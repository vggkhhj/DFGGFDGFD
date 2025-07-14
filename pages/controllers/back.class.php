<?php
class BackController extends Controller{
	public function main(){
		$item = $this->router->getParameter('item');
		switch($item){
			case 'online':
				$response =array();
				$empty = array(
					'finish'=> 0,
					'lot_id' =>0,
					'sum'=>0,
					'total_users'=>0,
					'users'=>array()
				);
				$now = time();
				$rooms = $this->model->getAllFrom('rooms');
				$params = $this->model->getAllFromById('game_params',1);
				foreach($rooms as $room){
					$rid = $room['id'];
					$round = $this ->model->getLastRound($rid);
				//	file_put_contents('log.log',time().' '.(strtotime($round['start_date']+(int)$params['timeout'])."\n",FILE_APPEND);

					if(empty($round)){
						$response['ROOMS'][$rid]= $empty;
					}
					else
						if($round['state']==0 and (time() >strtotime($round['start_date'])+(int)$params['timeout'])){
						//	file_put_contents('log.log','!!!!!'."\n",FILE_APPEND);
							$this ->model->setRoundState($round['id'],5) ;
							$response['ROOMS'][$rid]= $empty;
							$bet = $this->model->getBet($round['id']);
							$this->model->movement($bet['sum'],10+$rid,$bet['user_id'],8,$round['id']);
							$data=array(
								'finish_date'=>date("Y-m-d H:i:s",time()+3)
							);
							$this->model->updateAssoc('rounds',$data,$round['id']);
							$response['cancel']=1;
						}else
							if($round['state']==5){
								$response['ROOMS'][$rid]= $empty;
								$response['cancel']=1;
								if(time() >= strtotime($round['finish_date']))
									$this ->model->setRoundState($round['id'],6) ;
							}else
						{

							$mems = $this->model->getRoundMembers($round['id']);
							$num = count($mems);
							$sum=0;
							$users = array();
							if($num>0)
								foreach($mems as $mem){
									$users[$mem['user_id']]= $mem;
									$sum+=$mem['sum'];
								}
							$fin = 0;
							$state = $this->model->getRoundState($round['id']);

							if($state>0)
								$fin = strtotime($round['finish_date']);

							$response['ROOMS'][$rid]=array(
								'finish'=> $fin,
								'lot_id' =>$round['id'],
								'sum'=>round($sum*(1-$params['margin']),2),
								'total_users'=>$num,
								'users'=>$users
							);

							if($state ==1 && $now>=$fin ){
								$this ->model->setRoundState($round['id'],2) ;
								$winner = $this->model->randWinner($rid,$round['id'],$users,$params);
								$this ->model->setRoundState($round['id'],3) ;
								$response['ROOMS'][$rid]['has_winner']='yes';
								$response['ROOMS'][$rid]['winner']=$winner;
							}else if($state == 3){
								$w=$round['winner'];
								$winner = array(
									'id'=> $users[$w]['user_id'],
									'photo'=>$users[$w]['photo'],
									'pr'=>$users[$w]['pr'],
									'screen_name'=>$users[$w]['screen_name'],
									'stake'=>$users[$w]['sum'],
									'sum' =>$round['prize']
								);
								$response['ROOMS'][$rid]['has_winner']='yes';
								$response['ROOMS'][$rid]['winner']=$winner;
								if($now>=$fin+$params['time_after'])
									$this ->model->setRoundState($round['id'],4) ;
							}
						}



				}


				$response['time'] = $now;

				$response['new_users']=$this->model->getMembers();
				echo json_encode($response);
				exit;
			case 'bet':
				$res = array();
				$room = (int)$_POST['room'];
				$sum = (float)$_POST['sum'];
				$uid = $_SESSION['user']['id'];
				if (empty($uid))
					$res['error'] = 'need_auth';
				else {
					$balance = $this->model->getBalance($uid);
					$from = $this->model -> getMinBet($room);
					$to = $this->model -> getMaxBet($room);
					if(empty($from))
						$res['error'] = 'В какой вы комнате?';
					else if($sum > $balance)
						$res['error'] = 'У вас - '.$balance.' руб.';
					else if($sum < $from)
						$res['error'] = 'Минимальная ставка - '.$from.' руб.';
					else if($sum > $to)
						$res['error'] = 'Максимальная ставка - '.$to.' руб.';
					else{
						$round = $this->model->getLastRound($room);
						if(empty($round))
							$round=$this->model->makeRound($room);
						if($round['state']==0 || $round['state']==1 ){
							$this->model->make_bet($round,$room,$uid,$sum);
							$res['result'] = 'OK';
							$res['new_balance'] = $balance - $sum;
						}
						else{
							$res['error'] = 'Сейчас делать ставки нельзя.';
						}

					}
				}
				echo json_encode($res);
				exit;
			case 'balance':
				echo $this->model->getBalance($_SESSION['user']['id']);
				exit;
			case 'finished':
				$res = $this->model->getFinished($_GET['room']);
				echo json_encode($res);
				exit;
			case 'payments':
				$res = $this->model->getFullPayments();
				echo json_encode($res);
				exit;

		}
	}
}

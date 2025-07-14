<?php
class AccountController extends Controller{
	public function main(){
		if(empty($_SESSION['user'])){
			header( 'Location: /signin/' );
			exit;
		}

		$page = $this->router->getParameter('page');
		$item = $this->router->getParameter('item');
		if(empty($page) && empty($item)){
			$rsum = $this->model->sumRef($_SESSION['user']['id']);
			$this->view->setTemplateVar('rsum', $rsum);
			$rcnt = $this->model->countRef($_SESSION['user']['id']);
			$this->view->setTemplateVar('rcnt', $rcnt);
			$sumpay = $this-> model->sumPayment($_SESSION['user']['id']);
			$this->view->setTemplateVar('sumpay', $sumpay);
		}
		else
		if(in_array($page,array('insert','payment','logs','purses','exit','support','history','success','fail','insert_fk','insert_sk','bonus','referals','ref_history'))){
			switch ($page){
				case 'exit':
					unset($_SESSION['user']);
					header( 'Location: /' );
					exit;
				case 'insert':
					if(!empty($_POST['sum'])){
						$pdata = $this -> model ->getMerchantParams(1);
						$pdata['amount'] = number_format($_POST['sum'],2);
						file_put_contents(DIR_ROOT.'serv/payeer_order.log',var_export($pdata,true),FILE_APPEND);
						$pdata['orderid'] = $this ->model ->createOrder(1,$pdata['amount']);
						$pdata['desc'] = base64_encode('Loto - USER '.$_SESSION['user']['id']);
						$arHash = array(
							$pdata['shop'],
							$pdata['orderid'],
							$pdata['amount'],
							'RUB',
							$pdata['desc'],
							$pdata['key']
						);
						$pdata['sign'] = strtoupper(hash('sha256', implode(":", $arHash)));

						$this->view->setTemplateVar('pdata', $pdata);
					}
					break;
				case 'insert_fk':
					if(!empty($_POST['sum'])){
						$fdata = $this -> model ->getMerchantParams(2);
						$fdata['oa'] = number_format($_POST['sum'],2);
						$fdata['o'] = $this ->model ->createOrder(2,$fdata['oa']);
						$arHash = array(
							$fdata['shop'],
							$fdata['oa'],
							$fdata['key'],
							$fdata['o']
						);
						$fdata['s'] = md5(implode(":", $arHash));
						$this->view->setTemplateVar('fdata', $fdata);
					}
					break;
				case 'insert_sk':
					if(!empty($_POST['sum'])){
						$sdata = $this -> model ->getMerchantParams(2);
						$sdata['sum'] = number_format($_POST['sum'],2); 
						$this->view->setTemplateVar('sdata', $sdata);
					}
					break;
				case 'logs':
					$logs = $this->model->getLogons($_SESSION['user']['id'],10);
					$this->view->setTemplateVar('logs', $logs);
					break;
				case 'support':

					if(empty($item)){
						$params = array(
							'form'=>array('action'=>$this->router->makeUrl('self'), 'method'=>'POST', 'name'=>'ticket', 'id'=>'ticketForm', 'submit_title'=>'Отправить'),
							'controls'=>array(
								'section'=>array('type'=>'string', 'control_type'=>'text', 'title'=>'Категория', 'size'=>40, 'max'=>200, 'required'=>true),
								'title'=>array('type'=>'string', 'control_type'=>'text', 'title'=>'Тема', 'size'=>40, 'max'=>200, 'required'=>true),
								'text'=>array('type'=>'string', 'control_type'=>'textarea', 'title'=>'Сообщение', 'cols'=>50, 'rows'=>10, 'required'=>true, 'id'=>'conttext'),
							)
						);
						$form = new FormProcessor();
						$form->createForm($params);
						if ($result = $form->checkFormSubmit()){
							$ticket = array(
								'add_date' => date("Y-m-d H:i:s"),
								'title' => $result['title'],
								'cat_id' => $result['section'],
								'user_id' => $_SESSION['user']['id']
							);
							$id = $this->model->insertAssoc('tickets', $ticket);
							$this->model->addMessageToTicket($id,$result['text']);
							$this->view->setTemplateVar('succ', true);

						}
						$this->view->setTemplateVar("form", $form);
					}
					else{
						$ticket = $this->model->getTicket($item,$_SESSION['user']['id']);
						if(!empty($ticket)){
							if($_POST['close_ticket']==1){
								$this->model->updateTicketStatus($ticket['id'],1);
								$ticket['status']=1;
							}
							if($_POST['open_ticket']==1){
								$this->model->updateTicketStatus($ticket['id'],0);
								$ticket['status']=0;
							}
							if(!empty($_POST['message']))
								$this->model->addMessageToTicket($ticket['id'],$_POST['message']);
							$messages = $this->model->getMessages($item);
							$this->view->setTemplateVar("messages", $messages);
							$this->view->setInnerTemplate('ticket');

							$this->view->setTemplateVar("ticket", $ticket);

						}
					}
					$tickets = $this->model->getTickets($_SESSION['user']['id']);
					$this->view->setTemplateVar("tickets", $tickets);
					break;
				case 'history':
					$history = $this->model->getHistory($_SESSION['user']['id'],10);
					$this->view->setTemplateVar("history", $history);
					break;
				case 'bonus':
					$bonus = $this->model->getBonus24($_SESSION['user']['id']);
					if(!empty($bonus)){
						$last_time= strtotime($bonus['odate'].' +1 day')- time();
						$this->view->setTemplateVar("last_time", $last_time);
					}
					if(!empty($_POST['bonus']) && empty($bonus)){
						if($this->model->isInGroup()){
							$new_bonus = $this->model->generateBonus($_SESSION['user']['id']);
							$this->view->setTemplateVar('new_bonus', $new_bonus);
							$user  = $this->model->getAllFromById('my_admin_users',$_SESSION['user']['id']);
							$this->view->setTemplateVar('user', $user);
						}
						else{
							$this->view->setTemplateVar("need_group", true);
						}
					}
					$bonuses = $this->model->getBonuses();
					$this->view->setTemplateVar("bonuses", $bonuses);
					break;
				case 'purses':
					if(empty($item)){
						if(!empty($_POST['delpurse'])){
							$this->model->deleteById('purses',$_POST['delpurse']);
						}
						$pss= $this->model->getAllFrom('out_systems');
						$this->view->setTemplateVar('pss', $pss);
						$purses = $this->model->getPurses($_SESSION['user']['id']);
						$this->view->setTemplateVar('purses',$purses);
					}else if($item=='add_purse'){
						$psid = $_POST['psid'];
						if(!empty($psid)){
							$ps = $this->model->getAllFromById('out_systems',$psid);
							if(!empty($ps)){
								if(!empty($_POST['purse'])){
									$purse=$_POST['purse'];
									$pat = '/'.$ps['valid'].'/i';
									if(preg_match($pat,$purse)==1){
										$data= array(
											'add_date'=> date("Y-m-d H:i:s"),
											'user_id' => $_SESSION['user']['id'],
											'system_id'=>$psid,
											'purse' => $_POST['purse']
										);
										$this->model->insertAssoc('purses',$data);
										$this->view->setTemplateVar('purse',$_POST['purse']);
									}else{
										$this->view->setTemplateVar('color', 'red');
										$this->view->setTemplateVar('msg', 'Неправильный формат кошелька');
									}

								}
								$this->view->setTemplateVar('ps', $ps);
								$this->view->setInnerTemplate('add_purse');


							}

						}
					}

					break;
				case 'payment':
					$this->model->updatePaymentStatus($_SESSION['user']['id']);
					if(!empty($item)){
						$parse=explode('_',$item);
						$alias = $parse[1];
						if(!empty($alias)){
							$ps = $this->model->getAllFromByAlias('out_systems',$alias);
							if(!empty($ps) ){
								if(!empty($_POST['sum'])){
								$sum = (float)$_POST['sum'];
								$fee = round($sum/100*$ps['fee'],2);
								$balance = $this->model->getBalance($_SESSION['user']['id']);
								if($sum < $ps['min'] ){
									$this->view->setTemplateVar('color', 'red');
									$this->view->setTemplateVar('msg', 'Сумма меньше минимальной');
								}
								else  if($sum+$fee>$balance){
									$this->view->setTemplateVar('color', 'red');
									$this->view->setTemplateVar('msg', 'Недостаточно денег на балансе');
								}
								else{
									$purse = $_POST['purse'];
									switch($alias){
										case 'payeer':
										$pdata = $this -> model ->getOutParams(1);
										$payeer = new CPayeer($pdata['id'], $pdata['user'], $pdata['key']);
										if ($payeer->isAuth())
										{

											$out = $this ->model ->createOut(1,$ps['id'],$purse,$sum,$fee);
											$data=array(
												'curIn' => 'RUB',
												'sum' => $sum,
												'curOut' => 'RUB',
												//'sumOut' => 1,
												'to' => $purse,
												//'to' => 'client@mail.com',
												//'comment' => 'test',
												//'anonim' => 'Y',
												//'protect' => 'Y',
												//'protectPeriod' => '3',
												//'protectCode' => '12345',
											);
											file_put_contents(DIR_ROOT.'serv/payeer_out.log',var_export($data,true),FILE_APPEND);
											$arTransfer = $payeer->transfer($data);
											file_put_contents(DIR_ROOT.'serv/payeer_out.log',var_export($arTransfer,true),FILE_APPEND);

											if (empty($arTransfer['errors']))
											{
												$this-> model->setOutData($out,'Успех',$arTransfer['historyId']);
												$this-> model -> movement($sum,$_SESSION['user']['id'],$ps['account'],2,0,0,$out);
												$this-> model -> movement($fee,$_SESSION['user']['id'],$ps['account'],11,0,0,$out);
												$this->view->setTemplateVar('color', 'green');
												$this->view->setTemplateVar('msg', 'Перевод средств успешно выполнен');
											}
											else
											{
												$this->view->setTemplateVar('color', 'red');
												$this->view->setTemplateVar('msg', 'Внимание! Для заказа выплаты необходимо сделать свой первый депозит, не менее 25 рублей.');
												$errors = var_export($arTransfer["errors"],true);
												$this-> model->setOutData($out,'Отмена',0,$errors);
											}
										}
										else{
											file_put_contents(DIR_ROOT.'serv/payeer_out.log',var_export($payeer->getErrors(),true),FILE_APPEND);
										}
										break;
										case 'ooopay':
										case 'webmoney':
										case 'qiwi':
										case 'ya':
											$out = $this ->model ->createOut(2,$ps['id'],$purse,$sum,$fee);
											$currency = $this->model->getCurrency($alias);
											$answer = $this->model->cashOut($purse,$sum,$currency);
											$pid = $answer['data']['payment_id'];
											$status='';
											if(!empty($pid)){
												$answer = $this->model->getPaymentStatus($pid);
												$status = $answer['data']['status'];
												$desc= $answer['desc'];
											}
											else $desc=$answer['desc'];
											if($status=='Completed' || $status=='In process'){
												$ostatus=($status=='Completed')?'Успех':'Обрабатывается';
												$this-> model->setOutData($out,$ostatus,$pid);
												$this-> model -> movement($sum,$_SESSION['user']['id'],$ps['account'],2,0,0,$out);
												$this-> model -> movement($fee,$_SESSION['user']['id'],$ps['account'],11,0,0,$out);
												$this->view->setTemplateVar('color', 'green');
												$msg=($status=='Completed')?'Перевод средств успешно выполнен':'Перевод отправлен и находится в обработке';
												$this->view->setTemplateVar('msg', $msg);
											}else{
												$this->view->setTemplateVar('color', 'red');
												$this->view->setTemplateVar('msg', 'Ошибка при выполении операции: '.$desc);
												$this-> model->setOutData($out,'Отмена',0);
											}
										break;
									}
								}
								}
								$this->view->setTemplateVar('ps', $ps);
								$purses = $this->model->getPursesBySystem($_SESSION['user']['id'],$ps['id']);
								$this->view->setTemplateVar('purses', $purses);
								$this->view->setInnerTemplate('ps_out');

								$outs = $this->model->getPayments($_SESSION['user']['id'],$ps['id']);
								$this->view->setTemplateVar('outs', $outs);


							}
						}
					}
					break;
				case 'referals':
					$rcnt = $this->model->countRef($_SESSION['user']['id']);
					$this->view->setTemplateVar('rcnt', $rcnt);
					$this->view->setTemplateVar('uid', $_SESSION['user']['id']);
					if(empty($item) || in_array($item,array('level_1','level_2','level_3'))){
						$level=1;
						if(!empty($item)){
							$p=explode('_',$item);
							$level=$p[1];
						}
						$this->view->setTemplateVar('level', $level);
						$sort=1;
						if(!empty($_POST['sort'])) $sort = $_POST['sort'];
						$refinfo= $this->model->getRefInfo($_SESSION['user']['id'],$level,$sort);
						$this->view->setTemplateVar('refinfo', $refinfo);
						$this->view->setInnerTemplate('referals');
					}

					break;
				case 'ref_history':
						$opers= $this->model->getRefHistory($_SESSION['user']['id'],10);
					$this->view->setTemplateVar('opers', $opers);
					break;
			}
			if(empty($item))
				$this->view->setInnerTemplate($page);
		}


	}
}

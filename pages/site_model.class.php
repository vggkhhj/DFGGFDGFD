<?php
class Model extends ModelAbstract{
	//----------это не удалять
  //public $db2 = null; //если нужна еще одна база - создаем еще одну переменную, потом вторую, третью...
  private static $instance;
 
  private function __construct() {
    //подключиться к базе
    $this->db = new DB(DB_HOST, DB_USERNAME, DB_PASSWORD, DB_DATABASE);
	//подключиться ко второй базе, и так далее 
	//$this->db2 = new DB($host2, $username2, $password2, $database2);
  }
  private function __clone() {}
 
  public static function getInstance() {
    if (self::$instance === null) {
      self::$instance = new self;
    }
    return self::$instance;
  }
  //------------------------------- Стандартный набор ------------------------
  public function getAllFrom($table_name){
  	return $this->db->select_array("SELECT * FROM `{$table_name}`");
  }
  public function getAllFromOrderByDate($table_name){
  	return $this->db->select_array("SELECT * FROM `{$table_name}` ORDER BY `add_date` DESC");
  }
  public function getAllFromOrderByWeight($table_name){
  	return $this->db->select_array("SELECT * FROM `{$table_name}` ORDER BY `weight`");
  }
  public function getAllFromOrderById($table_name){
  	return $this->db->select_array("SELECT * FROM `{$table_name}` ORDER BY `id`");
  }
  public function getAllFromOrderByTitle($table_name) {
  	return $this->db->select_array("SELECT * FROM `{$table_name}` ORDER BY `title`");
  }
  public function getAllFromById($table_name, $id){
  	return $this->db->select_array_row("SELECT * FROM `{$table_name}` WHERE `id` = ".$id);
  }
  public function getAllFromByAlias($table_name, $al){
  	return $this->db->select_array_row("SELECT * FROM `{$table_name}` WHERE `alias` = '".$al."'");
  }
  public function insertAssoc($table_name, $array) {
  	return $this->db->insert_assoc($table_name, $array);
  }
  public function updateAssoc($table_name, $array, $uid) {
  	return $this->db->update_assoc($table_name, $array, 'id='.$uid);
  }
  public function getIdByAlias($table_name, $alias) {
  	$tmp = $this->db->select_array_row("SELECT * FROM `{$table_name}` WHERE `alias`='".$alias."'");
  	return $tmp['id'];
  }
  public function getLastId($table_name){
  	return $this->db->select_array_row("SELECT * FROM `{$table_name}` ORDER BY `id` DESC");
  }
  //Отправка почты через PHP Mailer
  function mailfunc($from, $fromname, $to, $subj, $msg, $charset, $htmlformat){
  	$mail = new PHPMailer();
  
  	$mail->From     		= $from; 				// укажите от кого письмо
  
  	$mail->Subject  		=  $subj; 				// тема письма
  	$mail->Body    	 		=  $msg; 				// тело письма в html формате
  	$mail->AltBody  		=  strip_tags($msg); 	// тело письма текстовое
  
  	$mail->FromName 		= $fromname; 			// имя отправителя
  	$mail->AddAddress($to); 						// е-мэил кому отправлять
  
  	$mail->CharSet 			= $charset;				// кодировка
  	$mail->IsHTML($htmlformat);						// отправить в html формате
  
  	$mail->Send();
  
  	$mail->ClearAddresses();
  	$mail->ClearAttachments();
  }
  //-----------------------------------------------------------------------------------------------------------------------
  //----------КОНЕЦ это не удалять

	/**===================== РАСШИРЕННЫЙ НАБОР ============================*/  
  	/** Возвращает актуальный контакт (для обратной связи) */
	public function getActualContactInfo() {
		$query="SELECT * FROM `contacts` WHERE `allow_show`='1' ORDER BY `weight` ASC,`id` ASC LIMIT 1;";
		return $this->db->select_array_row($query);
	}
	
	/** Возвращает шаблон письма */
	public function getMailTemplate($key) {
		$query="SELECT * FROM `tpl_emails` WHERE `key`='$key';";
		return $this->db->select_array_row($query);
	}
  
	/** Возвращает id существущего польз. с таким хешем логина */
   public function checkUserName($name){
		$query="SELECT `id` FROM `".TABLE_USERS."` WHERE `user_login` LIKE '$name'";
		return $this->db->select_result($query);
	}
	
	/** Возвращает поле из настроек таблиц для админки */
   public function getAdmRowSetting($table,$field,$NeedleField){
		$query="SELECT `$NeedleField` FROM `my_admin_fields` WHERE `field_table`='$table' AND `field_name`='$field' LIMIT 1;";
		return $this->db->select_result($query);
	}  
	
	/** Возвращает уникальный alias для таблицы #### Вася. 3-05-07/new wrap object
	* $table - название таблицы
	* $stringIn - строка, из которой формируется alias
	* $fieldOut - название поля таблицы, в которое записывается alias
	* $oldAlias - готовый, уже сформированный alias (претендент на запись) */
	public function get_uniqAlias($table,$stringIn,$fieldOut='alias',$oldAlias=''){
		if(empty($oldAlias)){
			$oldAlias=FormProcessor::makeUrlKey($stringIn);
		}
		$matchLine=$this->db->select_array_row("SELECT `id` FROM `$table` WHERE `$fieldOut` LIKE '$oldAlias';");
		if(!empty($matchLine)){
				// повторим попытку
			$newAlias=FormProcessor::makeUrlKey($oldAlias).(preg_match('/[0-9]{2,}$/',$oldAlias)?'':'-').date('s');
			return $this->get_uniqAlias($table,$newAlias,$fieldOut,$newAlias);
		}else{
			return $oldAlias;
		}
	}
	
	/** Проверяет существования записи по id из таблицы */
	public function idIsExists($table_name, $id) {
		return $this->db->select_result("SELECT `id` FROM `{$table_name}` WHERE `id`={$id};")?true:false;
	}
	
	/** Проверяет наличие столбца в таблице */
	public function fieldIsExists($table_name, $field) {
		return $this->db->query("SELECT `{$field}` FROM `{$table_name}` WHERE 0")?true:false;
	}	
	
	/** Возвращает содержимое столбца в таблице */
	public function getFieldFromTable($table_name, $rec_id, $field='id') {
		return $this->db->select_result("SELECT `{$field}` FROM `{$table_name}` WHERE `id`={$rec_id};");
	}
	
	/** Проверяет уникальность поля в столбце таблицы */
	public function isUniqValue($table_name, $field, $value) {
		return $this->db->select_result("SELECT '!' FROM `{$table_name}` WHERE `{$field}`='{$value}';")?false:true;
	}
	
	/** Удаляет запись в таблице по её ID */
	public function deleteById($table_name, $rec_id) {
		return $this->db->delete($table_name,"`id`=$rec_id");
	}
	
	/** Удаляет записи в таблице по списку ID */
	public function deleteByIdList($table_name, $list) {
		return $this->db->delete($table_name,"`id` IN($list)");
	}
	
/*============================== ПРАВА ПОЛЬЗОВАТЕЛЕЙ ===================================*/
	/** Возвращает права пользователя */
	public function getUserRules($role_id) {
		return $this->db->select_array_row("SELECT * FROM `my_admin_roles` WHERE `id`=$role_id;");
	}
   
/*==================== ВРЕМЕННЫЕ ЗОНЫ ===============*/
	/** Конвертирует дату в другую временную зону */
	// замена стандартной MySQL-овской, если криворукие или ленивые админы хостинга не настроили временные зоны
	public function convert_TZ($mysqldate,$tz_from,$tz_to){
		try{
			$date = new DateTime($mysqldate, new DateTimeZone($tz_from));
			$date->setTimezone(new DateTimeZone($tz_to));
			return $date->format('Y-m-d H:i:s');
		}catch(Exception $e){
			return null;
		}
		
	}
	
	/** Возвращает смещение временной зоны относительно UTC (в часах) */
	public function getTZ_offset($tz_name){
		try{
			$Tz=new DateTimeZone($tz_name);
			$date=$Tz->getOffset(new DateTime('now',new DateTimeZone('UTC')))/60/60;
			/*	
			date_default_timezone_set($tz_name);
			$date=date('Z')/60/60;
			date_default_timezone_set('UTC');
			*/
			return $date;
		}catch(Exception $e){
			return null;
		}
	}
  
  
  
  
  
/*============================== ДЕМО ===================================*/ 
  
  public function demo_getAllSitePages() {
		$query="
		SELECT `title`,`alias` FROM `site_pages_constant`
			UNION (
		SELECT `title`,`alias`  FROM `site_pages_variable`
			);";
		return $this->db->select_array($query);
	}

public	function  auto($info){
		$data=array(
			'vk_uid' => $info['uid'],
			'user_who'=> $info['first_name'],
			'vk_lname' => $info['last_name'],
			'vk_sname'=> $info['screen_name'],
			'email' => $info['email'],
			'vk_photo_100'=> $info['photo_100'],
			'user_role' =>3
		);
		if(!empty($data['vk_uid'])){
			$id = $this->db -> select_result("SELECT id FROM my_admin_users WHERE vk_uid = '{$data['vk_uid']}'");
			if(!empty($id))
				$this->db->update_assoc('my_admin_users',$data,"id = $id");
			else{
				$id = $this->db->insert_assoc('my_admin_users',$data);
				$this->movement(2,1,$id,6);
				if(!empty($_COOKIE['i'])){
					$uid = $_COOKIE['i'];
					$check = $this->db->select_result("SELECT id FROM my_admin_users WHERE id=$uid");
					if(!empty($check)){
						$r=array(
							'user_id'=> $uid,
							'ref_id'=> $id,
							'add_date'=> date("Y-m-d H:i:s")
						);
						$this->db->insert_assoc('refs',$r);
					}
				}
			}
			$this->logonLog($id);
			$user = $this->db ->select_array_row("SELECT * FROM my_admin_users WHERE  id = $id");
			$_SESSION['user'] = $user;
		}

	}
  
  public function getMerchantParams($sid){
	  $temp = $this->db->select_array("SELECT * FROM my_site_params WHERE ps=$sid");
	  $res=array();
	  if(!empty($temp)){
		  foreach($temp as $item)
			  $res[$item['key']]=$item['value'];
	  }
	  return $res;
  }
	public function getOutParams($sid){
		$temp = $this->db->select_array("SELECT * FROM out_params WHERE ps=$sid");
		$res=array();
		if(!empty($temp)){
			foreach($temp as $item)
				$res[$item['key']]=$item['value'];
		}
		return $res;
	}
public function createOrder($ps,$sum){
	$order = array(
		'idate'=> date("Y-m-d H:i:s"),
		'ps'=>$ps,
		'user_id'=> $_SESSION['user']['id'],
		'sum' => $sum
	);
	$id = $this->insertAssoc('orders',$order);
	return $id;
}
	public function createOut($ps,$dst,$purse,$sum,$fee){
		$out = array(
			'idate'=> date("Y-m-d H:i:s"),
			'ps'=>$ps,
			'dst'=>$dst,
			'purse'=>$purse,
			'user_id'=> $_SESSION['user']['id'],
			'sum' => $sum,
			'fee'=>$fee
		);
		$id = $this->insertAssoc('outs',$out);
		return $id;
	}
public function getUserFromOrder($id){
	return $this->db->select_result("SELECT user_id FROM orders WHERE id=$id and status=0");
}
	public function setOrderStatus($id,$status,$invoice){
		$data = array(
			'invoice'=>$invoice,
			'status' =>$status,
			'pdate'=>date("Y-m-d H:i:s")
		);
		$this->db->update_assoc('orders',$data,"id = $id");
	}
	public function setOutData($id,$status,$invoice,$info=''){
		$data = array(
			'invoice'=>$invoice,
			'info'=>$info,
			'status'=>$status,
			'pdate'=>date("Y-m-d H:i:s")
		);
		$this->db->update_assoc('outs',$data,"id = $id");
	}
public function movement($sum,$from,$to,$oper,$round=0,$ref=0,$out = 0){
	$this -> db->query("
	UPDATE my_admin_users
	SET balance = balance - $sum
	WHERE id = $from
	");
	$this -> db->query("
	UPDATE my_admin_users
	SET balance = balance + $sum
	WHERE id = $to
	");
	$odate = date("Y-m-d H:i:s");

	$this -> db->query("
	INSERT into balance_log
	SET
		`from` = $from,
		`to` = $to,
		`sum` = $sum,
		oper = $oper,
		odate = '$odate',
		`round` = $round,
		ref = $ref,
		`out` = $out
	");
}
public function updateActivity($uid){
	$data=array(
		'active_date'  =>  date("Y-m-d H:i:s")
	);
	$this ->db->update_assoc('my_admin_users',$data,'id='.$uid);
}
 public function countUsers(){
	 return $this->db->select_result("SELECT count(*) FROM my_admin_users WHERE id>100");
 }
public function countOnline(){
	$now = time();
	return $this->db->select_result("SELECT count(*) FROM my_admin_users WHERE ($now -UNIX_TIMESTAMP( active_date )) < 300 and id>100");
}
public function logonLog($uid){
	$data = array(
		'l_date'=> date("Y-m-d H:i:s"),
		'user_id'=>$uid,
		'ip'=>$_SERVER['GEOIP_ADDR'],
		'code'=>$_SERVER['GEOIP_COUNTRY_CODE'],
		'city'=>$_SERVER['GEOIP_CITY']
	);
	$this ->db->insert_assoc('logon_log',$data,'id='.$uid);
}
public function getLogons($uid,$days){
	$data = $this->db->select_array("
	SELECT *
		FROM logon_log
		WHERE user_id=$uid and l_date > NOW() - INTERVAL $days DAY
		ORDER BY l_date desc
		");
	return $data;
}
public function getMembers($n=8){
	$temp = $this->db->select_array("
	SELECT lastn.* FROM
	(SELECT  ll.id ,mau.user_who as first_name, mau.vk_lname as last_name, mau.vk_photo_100 as photo, mau.vk_uid as vk_id
		FROM logon_log ll, my_admin_users mau
		WHERE ll.user_id = mau.id
		ORDER BY ll.l_date DESC
		LIMIT $n) as lastn
	group by vk_id
	ORDER by id
	");
	$res = array();
	if(!empty($temp))
		foreach($temp as $item)
			$res[$item['id']]=$item;
	return $res;

}
	public function getTickets($uid){
		$res = $this->db->select_array(" SELECT * FROM tickets WHERE user_id = $uid ORDER BY add_date");
		return $res;
	}
	public function getTicket($tid,$uid){
		$res = $this->db->select_array_row("
		SELECT tc.title as ctitle, t.*
		FROM tickets t
		left join ticket_cat tc on t.cat_id =tc.id
		WHERE t.id = $tid and t.user_id = $uid");
		return $res;
	}
	public function getMessages($tid){
		$res = $this->db->select_array(" SELECT * FROM ticket_messages WHERE ticket_id = $tid ORDER BY add_date");
		return $res;
	}
	public function updateTicketStatus($tid,$status){
		$data=array('status'=>$status);
		$this->db->update_assoc('tickets',$data,"id = $tid");
	}
	public function addMessageToTicket($tid,$message){
		$message = array(
			'add_date' => date("Y-m-d H:i:s"),
			'ticket_id' => $tid,
			'user_id' => $_SESSION['user']['id'],
			'message' => mysql_real_escape_string(strip_tags($message))
		);
		$this->insertAssoc('ticket_messages', $message);
	}
	public function getHistory($uid,$days){
		$data = $this->db->select_array("
	SELECT bl.*,op.title
		FROM balance_log bl
		LEFT JOIN operations op
		ON op.id = bl.oper
		WHERE (bl.`from`=$uid or bl.`to` = $uid) and odate > NOW() - INTERVAL $days DAY
		ORDER BY odate desc
		");
		return $data;
	}
	public function generateBonus($uid){
		$bonus = rand(1,100)/100;
		$this ->movement($bonus,1,$uid,5);
		return $bonus;
	}
	public function getBonuses($n=100){
		$data = $this->db->select_array("
	SELECT bl.*,mau.user_who, mau.vk_lname,mau.id as uid
		FROM balance_log bl
		LEFT JOIN my_admin_users mau
		ON bl.`to` = mau.id
		WHERE bl.oper=5
		ORDER BY odate desc
		LIMIT $n
		");
		return $data;
	}
	public function getBonus24($uid){
    $d24= date("Y-m-d H:i:s",strtotime('-1 day'));
	$res=$this->db->select_array_row("SELECT sum,odate FROM balance_log WHERE oper=5 and `to`=$uid and odate > '$d24'");
	return $res;
	}
	public function isInGroup(){
		$info = $this->getAllFromById('contacts',1);
		$parse = explode('/',$info['vk']);
		$group = $parse[3];
		$response = json_decode(request("https://api.vk.com/method/groups.getMembers?group_id=$group&access_token=abd47e8881424f7681215aa65b9c1e4c390d6c25235760c2280c22cf4c6e3cb77d29c22975a75e8d22815&v=3.0"));
		$res=false;
		if(!empty($response->response->users)){
			$res = in_array($_SESSION['user']['vk_uid'],$response->response->users);
		}
		return $res;
	}
	public function getBalance($uid){
		return $this -> db ->select_result("SELECT balance FROM my_admin_users WHERE id=$uid");
	}
	public function getMinBet($room){
		return $this -> db ->select_result("SELECT min_bet FROM rooms WHERE id=$room");
	}
	public function getMaxBet($room){
		return $this -> db ->select_result("SELECT max_bet FROM rooms WHERE id=$room");
	}
	public function countRooms(){
		return $this -> db -> select_count('rooms');
	}
	public function getLastRound($room){
		$round = $this->db->select_array_row("SELECT * from rounds WHERE room = $room and state!=4 and state!=6 ORDER by start_date desc limit 1");
		return $round;
	}
	public function makeRound($room){
		$data = array(
			'start_date'=> date("Y-m-d H:i:s"),
			'room'=> $room
		);
		$id =  $this->db->insert_assoc('rounds',$data);
		return $this->getAllFromById('rounds',$id);
	}
	public function make_bet($round,$room,$user,$sum){
		$params = $this->getAllFromById('game_params',1);

		$bid = $this->db->select_result("SELECT id FROM bets WHERE round = {$round['id']} and user_id = $user");

		if(empty($bid)){
			$num = $this->db->select_result("SELECT count(*) FROM bets WHERE round = {$round['id']} and user_id <> $user");

			$data=array(
			'add_date' => date("Y-m-d H:i:s"),
			'round'=>$round['id'],
			'sum' => $sum,
			'user_id' => $user
			);
			$this ->db->insert_assoc('bets',$data);
			if($num ==  1){
				$tm = '+'.$params['time2'].' seconds';
				$finish = date("Y-m-d H:i:s",strtotime($tm));
				$this -> db-> query("UPDATE rounds SET finish_date='$finish',state = 1 WHERE id ={$round['id']}" );
			}

		}
		else {
			$this -> db ->query("UPDATE bets SET `sum`=`sum`+$sum WHERE id =$bid");
		}
		$this ->movement($sum,$user,$room+10,3,$round['id']);

	}
	public function getRoundMembers($round){

		$info = $this -> db -> select_array("
		SELECT bs.`sum`, bs.user_id,round(bs.`sum`*100/(SELECT sum(`sum`) FROM bets WHERE round = $round),2) as pr,
				concat(mau.user_who,' ',mau.vk_lname) as screen_name, mau.vk_photo_100 as photo
			FROM bets bs
			LEFT JOIN my_admin_users mau ON bs.user_id = mau.id
			WHERE bs.round= $round
		");
		return $info;
	}
	public function randWinner($room,$round,$users,$params){

		$bag = array();
		$sum = 0;
		foreach($users as $user){
			$n=round($user['pr']*10);
			for($i=1;$i<=$n;$i++)
				$bag[]=$user['user_id'];
			$sum+=$user['sum'];
		}
		shuffle($bag);
		$wi=array_rand($bag);
		$winner = $bag[$wi];

		$bet = $users[$winner]['sum'];
		$prize = round($bet+($sum-$bet)*(1-$params['margin']),2);
	//	file_put_contents('log.log',$winner."\n".$bet."\n",FILE_APPEND);
		$data=array(
			'winner'=>$winner,
			'prize'=>$prize,
			'pr' => $users[$winner]['pr'],
			'bet' => $bet
		);
		$this->db->update_assoc('rounds',$data,'id='.$round);
		$this->movement($prize,10+$room,$winner,4,$round);
		$this->movement($sum-$prize,10+$room,1,7,$round);

		//реферальные выплаты
		foreach($users as $key =>$user){
			if($key==$winner) continue;
			$this->rpayment($key,$user['sum']);
		}


		$res = array(
			'id'=> $winner,
			'photo'=>$users[$winner]['photo'],
			'pr'=>$users[$winner]['pr'],
			'screen_name'=>$users[$winner]['screen_name'],
			'stake'=>$bet,
			'sum' =>$prize
		);
		return $res;

	}
	public function rpayment($ref,$bet){
		$ref0=$ref;
		$par= $this->getAllFromById('ref_params',1);
		for($i=1;$i<=3;$i++){
			$uid = $this -> db->select_result("SELECT user_id FROM refs WHERE ref_id = $ref");
			if(empty($uid)) break;
			$sum = round($bet/100*$par['pr'.$i],2);
			$this-> movement($sum,1,$uid,10,0,$ref0);
			$ref=$uid;
		}
	}
	public function getRoundState($round){
		return $this->db->select_result("SELECT state FROM rounds WHERE id = $round");
	}
	public function setRoundState($round,$state){
		$this->db->query("UPDATE rounds SET state= $state WHERE id=$round");
	}
	public  function getFinished($room,$n=10){
		$data = $this->db->select_array("
	SELECT concat(mau.user_who,' ',mau.vk_lname) as screen_name, mau.vk_photo_100 as photo, mau.vk_uid as vk_id,
			r.pr, r.prize as `sum`, r.bet as stake,r.id
		FROM rounds r
		LEFT JOIN my_admin_users mau
		ON r.winner = mau.id
		WHERE r.room =$room and r.state=4 and r.winner<>0
		ORDER BY r.finish_date desc
		LIMIT $n
		");

		$res=array();
		if(!empty($data))
			foreach($data as $item)
				$res[$item['id']]=$item;
		//file_put_contents('log.log',var_export($data,true)."\n",FILE_APPEND);
		return $res;
}
	public	function getBet($round){
		return $this->db->select_array_row("SELECT * FROM bets WHERE round=$round");
	}
	public function getFinishedRounds(){
		return $this->db->select_count('rounds', 'state=4');
	}
	public function getSumPayments(){
		$sum =(float) $this -> db -> select_result("SELECT sum(`sum`) FROM outs WHERE status = 'Успех'");
		return $sum;
	}
	public function getPurses($user_id){
		$purses = $this-> db->select_array("
		SELECT ps.id,ps.purse,ps.add_date,os.title,os.alias
		FROM purses ps
		LEFT JOIN out_systems os ON os.id = ps.system_id
		WHERE ps.user_id=$user_id
		");
		return $purses;
	}
	public function getPursesBySystem($user_id,$system_id){
		return $this->db->select_array("SELECT purse FROM purses WHERE user_id=$user_id and system_id=$system_id");
	}
	public function freeRequest($data){
		$ch = curl_init();
		curl_setopt($ch, CURLOPT_URL, 'https://wallet.free-kassa.ru/api_v1.php');
		curl_setopt($ch, CURLOPT_HEADER, 0);
		curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
		curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 0);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
		curl_setopt($ch, CURLOPT_POST, 1);
		curl_setopt($ch, CURLOPT_TIMEOUT, 10);
		curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 10);
		curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
		$result = trim(curl_exec($ch));
		$c_errors = curl_error($ch);
		curl_close($ch);
		return json_decode($result,true);
	}
	public function cashOut($purse,$sum,$currency){
		$pdata = $this ->getOutParams(2);
		$data = array(
			'wallet_id'=>$pdata['id'],
			'purse'=> $purse,
			'amount'=>$sum,
			'desc'=>'Cash out',
			'currency'=>$currency,
			'sign'=>md5($pdata['id'].$currency.$sum.$purse.$pdata['key']),
			'action'=>'cashout',
		);
		return $this->freeRequest($data);
	}
	public function getPaymentStatus($pid){
		$pdata = $this ->getOutParams(2);
		$data = array(
			'wallet_id'=>$pdata['id'],
			'payment_id'=>$pid,
			'sign'=>md5($pdata['id'].$pid.$pdata['key']),
			'action'=>'get_payment_status',
		);
		return $this->freeRequest($data);
	}
	public function getCurrency($alias){
		$map=array(
			'ooopay'=>106,
			'webmoney'=>1,
			'qiwi'=>63,
			'ya'=> 45
		);
		return $map[$alias];
	}
	public function updatePaymentStatus($user_id){

		$outs = $this->db->select_array("SELECT * FROM outs WHERE user_id=$user_id and status='Обрабатывается'");
		if(!empty($outs))
			foreach($outs as $out){
				$answer = $this->getPaymentStatus($out['invoice']);
				$status = $answer['data']['status'];
				if($status=='Completed'){
					$this->setOutData($out['id'],'Успех',$out['invoice']);
				}else if($status=='Canceled'){
					$account = $this->db->select_result("SELECT account FROM out_systems WHERE id={$out['dst']}");
					$this-> movement($out['sum'],$account,$user_id,9,0,$out['id']);
					$this-> movement($out['fee'],$account,$user_id,12,0,$out['id']);
					$this->setOutData($out['id'],'Отмена',$out['invoice']);
				}
			}
	}
	public function getPayments($user_id,$dst,$n=20){
		return $this->db->select_array("SELECT * FROM outs WHERE user_id=$user_id and dst=$dst ORDER  BY idate desc LIMIT $n");
	}
	public function getFullPayments($n=10){
		$temp= $this->db->select_array("
		SELECT lpayments.* FROM
		(SELECT o.id,o.purse as p,o.sum, mau.user_who,concat(mau.user_who,' ',mau.vk_lname) as screen_name,mau.vk_photo_100 as photo,
		mau.vk_uid as vk_id,concat('img/ps_logo/',os.alias,'.png') as img
			FROM outs o
			LEFT JOIN out_systems os ON os.id = o.dst
			LEFT JOIN my_admin_users mau ON mau.id = o.user_id
		WHERE o.status = 'Успех'
		ORDER  BY o.idate desc
		LIMIT $n) as lpayments
		ORDER BY id
		");
		$res = array();
		if(!empty($temp))
			foreach($temp as $item)
				$res[$item['id']]=$item;
		return $res;
	}
	public function countRef($uid){
	$c=0;
	$res = array(
		'c1'=>0,'c2'=>0,'c3'=>0
	);
	$list=$uid;
	for($i=1;$i<=3;$i++){
		$ids = $this->db->select_array("select ref_id from refs where user_id in ($list)");
		$ct=count($ids);
		if($ct==0) break;
		$c+=$ct;
		$res['c'.$i]=$ct;
		$list = multi_implode(',',$ids);
	}
	$res['c']=$c;
	return $res;
	}
	public function sumRef($uid){
		return $this->db->select_result(
			"select sum(`sum`)
				from balance_log
				where `to`=$uid and oper=10");
	}
	public function sumPayment($uid){
		return $this->db->select_result(
			"select sum(`sum`)
				from outs
				where `user_id`=$uid and status = 'Успех'");
	}
	public function getRefInfo($uid,$level,$order=1){
		$list=$uid;
		for($i=1;$i<=3;$i++){
			$ids = $this->db->select_array("select ref_id from refs where user_id in ($list)");
			$ct=count($ids);
			if($ct==0 || $i==$level) break;
			$list = multi_implode(',',$ids);
		}
		$res=array();
		if(!empty($ids)){
			$list = multi_implode(',',$ids);
			$orders =array('id','id','refs','sums','ldate','rdate');
			$order=$orders[(int)$order];
			$res =$this->db->select_array("
			SELECT mau.id as id,
			(SELECT count(*) FROM refs WHERE user_id=mau.id) as refs,
			(SELECT sum(`sum`) FROM balance_log WHERE oper =10  and `to`=$uid and ref=mau.id) as `sums`,
			cast(mau.date_created as datetime) as rdate,
			(SELECT l_date FROM logon_log WHERE user_id=mau.id ORDER BY l_date DESC LIMIT 1) as ldate
			FROM my_admin_users mau
			WHERE mau.id in ($list)
			ORDER BY $order
			");
		}
		return $res;

	}
	public function getRefHistory($uid,$days){
		$data = $this->db->select_array("
	SELECT bl.*,op.title
		FROM balance_log bl
		LEFT JOIN operations op
		ON op.id = bl.oper
		WHERE bl.`to` = $uid and bl.oper=10 and odate > NOW() - INTERVAL $days DAY
		ORDER BY odate desc
		");
		return $data;
	}



}

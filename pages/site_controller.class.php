<?php
abstract class Controller extends ControllerAbstract{
	
	public $userData;
	
	public function __construct(){
		parent::__construct();
		header('Content-Type: text/html;charset=utf-8');
		if(!empty($_GET['i']))
			if(empty($_COOKIE['i']))
				setcookie('i',$_GET['i'],time()+60*60*24*30,'/');
		$rooms = $this->model->getAllFrom('rooms');
		$this->view->setTemplateVar('rooms', $rooms);

		$info = $this->model->getAllFromById('contacts',1);
		$this->view->setTemplateVar('info', $info);
		if(!empty($_SESSION['user'])){
			$this->model->updateActivity($_SESSION['user']['id']);
			$user  = $this->model->getAllFromById('my_admin_users',$_SESSION['user']['id']);
			$this->view->setTemplateVar('user', $user);
		}
	
	}
	
	/** Получает пользовательские данные */
	public function auth_init(){
	
		$this->user!=null OR exit('authplugin error');
		if($this->user->isLoggedIn()){
			$this->userData=$this->user->getData();
			$this->userData['roles']=$this->model->getUserRules($this->userData['user_role']);
		}
		
		if(empty($this->userData['id'])){
			$this->view->sendHeaders("HTTP/1.1 401 Unauthorized");
			$this->view->sendHeaders('Location: '.$this->router->makeUrl('login'));
			exit;
		}

	}
	
	/** Отправляет педустановленное письмо 
	* $templateKey - ключ шаблона EMail-сообщения
	* &$formParams - массив настройки формы 
	* &$formResult - массив полученных данных из формы
	* $emailTo - адрес получателя
	* $name - имя отправителя
	* $emailFrom - адрес отправителя
	*/
	public function sendPresetEmail($templateKey,&$formParams,&$formResult,$emailTo,$name,$emailFrom=null,$optReplace=null){
		$infoList=''; // список полей формы
		foreach($formResult as $key=>$Rrow){
			$infoList.=$formParams['controls'][$key]['title'].": ".$Rrow."<br />";
			$Rvals[$key]=$Rrow;
		}
		$Rvals['info']=$infoList;
	
		if(empty($emailFrom)){
			$emailFrom=MODERATOR_EMAIL;
		}
		$eMailText=$this->model->getMailTemplate($templateKey);
		if(empty($eMailText)) return false;
		
		foreach($Rvals as $Rkey=>$Ris){ // Замена вставок в шаблоне
			$eMailText['content']=str_replace("{".$Rkey."}",$Ris,$eMailText['content']);
		}
		if(!empty($optReplace)){
			foreach($optReplace as $Rkey=>$Ris){ // Замена вставок в шаблоне
				$eMailText['content']=str_replace("{".$Rkey."}",$Ris,$eMailText['content']);
			}
		}
		$this->model->mailfunc(
			$emailFrom, 
			$name, 
			$emailTo, 
			stripslashes($eMailText['head']), 
			stripslashes($eMailText['content']), 
			'utf-8', 
			true
		);
			// запись в лог сообщений
		$MSG_log=array();
		$MSG_log['name']=$name;
		$MSG_log['email_to']=$emailTo;
		$MSG_log['email_from']=$emailFrom;
		$MSG_log['date'] = date("Y-m-d H:i:s");
		$MSG_log['head']=str_replace('"','\'',$eMailText['head']); // в SQL-запросе обременяет двойными кавычками
		$MSG_log['body']=str_replace('"','\'',$eMailText['content']);
		$this->model->insertAssoc('log_send_email', $MSG_log);
	}

	/** Шифрует строку */
	protected function encryptString($string,$key=null){
		if(!class_exists('AES'))
			require_once DIR_CLASSES.'aes.class.php';
		$key="badfegch0c321ace"; // 128-bit key	
		$Crypter=new AES($key);
		$encryptedStr=base64_encode($Crypter->encrypt($string));
		return $encryptedStr;
	}
	
	/** Дешифрует строку */
	protected function decryptString($string,$key=null){
		if(!class_exists('AES'))
			require_once DIR_CLASSES.'aes.class.php';
		$key="badfegch0c321ace"; // 128-bit key	
		$Crypter=new AES($key);
		$decryptedStr=$Crypter->decrypt(base64_decode($string));
		return $decryptedStr;
	}
	
}

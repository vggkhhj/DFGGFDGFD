<?php
class RegistrationController extends Controller{
	public function main(){
		$this->view->setMainTemplate('_main');	
		
		if($this->user==null){ echo 'Не установлен необходимый плагин!';exit; } // userdefault или userextend
		if (!$this->user->isLoggedIn()){
				// форма регистрации		
			$regParams = array(
				'form'=>array('action'=>$this->router->makeUrl('self'), 'method'=>'POST', 'name'=>'regForm', 'id'=>'regForm', 'submit_title'=>'Отправить'),
				'controls'=>array(
					'email'=>array('type'=>'email', 'control_type'=>'text', 'title'=>'E-Mail (логин)', 'max'=>50, 'size'=>30, 'required'=>true, 'unique'=>TABLE_USERS, 'class'=>'inputs_form'),
					'password'=>array('type'=>'string', 'control_type'=>'password', 'title'=>'Пароль', 'min'=>4, 'max'=>50, 'size'=>30, 'required'=>true, 'password'=>1, 'class'=>'inputs_form'),
					'password2'=>array('type'=>'string', 'control_type'=>'password', 'title'=>'Повторите пароль', 'min'=>4, 'max'=>50, 'size'=>30, 'required'=>true, 'password'=>2, 'class'=>'inputs_form'),
					'name'=>array('type'=>'string', 'control_type'=>'text', 'title'=>'Имя', 'size'=>30, 'max'=>200, 'required'=>true, 'class'=>'inputs_form'),
					'lastname'=>array('type'=>'string', 'control_type'=>'text', 'title'=>'Фамилия', 'size'=>30, 'max'=>200, 'required'=>false, 'class'=>'inputs_form'),
					'phone'=>array('type'=>'string', 'control_type'=>'text', 'title'=>'Телефон', 'size'=>30, 'max'=>200, 'required'=>false, 'class'=>'inputs_form'),
					'captcha'=>array('type'=>'captcha', 'control_type'=>'captcha', 'id'=>'captcha', 'title'=>'Проверочный код')
				),
				'values'=>array(
					'email'=>'',
					'password'=>'',
					'password2'=>'',
					'name'=>'',
					'lastname'=>'',
					'phone'=>'',
				)
			);
			
			$regForm = new FormProcessor();
			$regForm->createForm($regParams);
			if ($result = $regForm->checkFormSubmit()){

				$result[FIELD_USER_LOGIN] = sha1($result['email']);
				$result[FIELD_USER_PASSWORD] = sha1($result['password']);
				$tmp = $this->model->checkUserName($result[FIELD_USER_LOGIN]);
				if(empty($tmp)){
					$hCode=substr(md5(uniqid(rand(),true)),0,32);  // сгенерировать хеш активации
					$result['user_role'] = 3;
					$aktivatLink=HREF_DOMAIN.'login/?akt=key&code='.$hCode;
					$akthref='<a href="'.$aktivatLink.'" target="_blank">'.$aktivatLink.'</a>';
					
					$contactinfo=$this->model->getActualContactInfo();
					
					$Rvals=array(
						'login'=>$result['email'],
						'link'=>$aktivatLink
					);
					// ПИСЬМО ПОЛЬЗОВАТЕЛЮ
					$this->sendPresetEmail('registr_user',$regParams,$result,$result['email'],$result['name'],$contactinfo['email_info'],$Rvals);
					
					// ОПОВЕЩЕНИЕ МЕНЕДЖЕРУ
					$this->sendPresetEmail('registr_manag',$regParams,$result,$contactinfo['email_info'],$result['name'],null,$Rvals);
					
		/*============== ЗАПИСЬ В БАЗУ ==============*/
					unset($result['password']);
					unset($result['password2']);
						// логин
					$D_User['user_who']=$result['email'];
					$D_User['user_login']=$result['user_login'];
					$D_User['user_password']=$result['user_password'];
					$D_User['user_role']=$result['user_role'];
					$D_User['wall']=$hCode;
					$newUserID=$tmp = $this->model->insertAssoc(TABLE_USERS, $D_User);
					if ($tmp){
						$reslog['log_table'] = TABLE_USERS;
						$reslog['log_record'] = $tmp;
						$reslog['log_creator'] = 2;
						$reslog['log_modifier'] = 2;
						$this->model->insertAssoc('my_admin_log', $reslog);
					}
					
					$this->view->setTemplateVar('succ', true);
					
				}else{
					$this->view->setTemplateVar('contForm_use', true);
					$this->view->setTemplateVar('error_message', 'Такой логин уже существует!');
				}
			} 
			
			$this->view->setTemplateVar("regForm", $regForm);
			
			$this->view->setInnerTemplate('registration');
		}
		else $this->redirectTo('index');
		
		
	}
}

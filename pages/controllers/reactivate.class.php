<?php
class ReactivateController extends Controller{
	public function main(){
		$this->view->setMainTemplate('_main');	
			
			if($this->user==null){ echo 'Не установлен необходимый плагин!';exit; } // userdefault или userextend
			if($this->user->isLoggedIn()){
				$userData=$this->user->getData();
				
				if(empty($userData['email'])){
					$this->view->setTemplateVar('alert_message','Для аккаунта не указан E-Mail,\nвозможность недоступна!');
					return;
				}
				if(!empty($userData['wall'])){ // пользователь не прошёл активацию
						// форма повторной отправки активац. кода
					$reSendkeycodeParams = array(
						'form'=>array('action'=>$this->router->makeUrl('userzone',array('_GET'=>array('cmd'=>'resend'))), 'method'=>'POST', 'name'=>'reSendkeycodeForm', 'id'=>'reSendkeycodeForm','submit_title'=>'Отправить', 'autocomplete'=>"off"),
						'controls'=>array(	
							'meat'=>array('type'=>'string', 'control_type'=>'hidden', 'title'=>'Имя', 'size'=>30, 'max'=>200, 'required'=>false, 'class'=>'inputs_form','hidden_value'=>'true'),
							'captcha'=>array('type'=>'captcha', 'control_type'=>'captcha', 'id'=>'captcha','title'=>'Проверочный код'),
						),
						'values'=>array(
							'meat'=>' '
						),
					);
					$reSendkeycodeForm = new FormProcessor();
					$reSendkeycodeForm->createForm($reSendkeycodeParams);
					
					if ($result = $reSendkeycodeForm->checkFormSubmit()){	
							// сгенерировать хеш активации
						$hCode=substr(md5(uniqid(rand(),true)),0,32);  
						$aktivatLink=HREF_DOMAIN.'login/?akt=key&code='.$hCode;
						$akthref='<a href="'.$aktivatLink.'" target="_blank">'.$aktivatLink.'</a>';
					
						$contactinfo=$this->model->getActualContactInfo();
					
						$Rvals=array(
							'login'=>$result['email'],
							'link'=>$aktivatLink
						);
						// ПИСЬМО ПОЛЬЗОВАТЕЛЮ
						$this->sendPresetEmail('aktcode_resend',$reSendkeycodeParams,$result,$userData['email'],$userData['name'],$contactinfo['email_info'],$Rvals);

					/*============== ЗАПИСЬ В БАЗУ ==============*/
						$D_User['wall']=$hCode;
						$this->model->updateAssoc(TABLE_USERS, $D_User,$userData['id']);
						
						$this->view->setTemplateVar('succSendRAL',true);
						
					}elseif(!empty($_REQUEST[$reSendkeycodeParams['form']['name'].'_submit'])){ 
						$this->view->setTemplateVar('alert_message','Неверно указан проверочный код!' );
					}

					$this->view->setTemplateVar('reSendkeycodeForm',$reSendkeycodeForm);

					
				}else{
					$this->view->setTemplateVar('alert_message','Аккаунт уже активирован!');
				}
			}
	}
}

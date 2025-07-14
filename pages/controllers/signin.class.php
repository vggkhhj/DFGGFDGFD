<?php
class SigninController extends Controller{
	public function main(){
		if(!empty($_SESSION['user'])){
			header( 'Location: /account/' );
			exit;
		}
		

		
		
		
		
		if (isset($_GET['code'])) {
			$info = $this->model->getAllFromById('contacts',1);
			$params = array(
				'client_id' => $info['vk_id'],'display' => 'page',
				'client_secret' => $info['vk_secret'],
				'code' => $_GET['code'],
				'redirect_uri' => HREF_DOMAIN.'signin/','v' => '3.0' ,
			);
			$url = 'https://oauth.vk.com/access_token' . '?' . urldecode(http_build_query($params));
			
		
			
			
			$res = request($url);
			$token = json_decode($res, true);
			if (isset($token['access_token'])) {
				$params = array(
					'uids'         => $token['user_id'],
					'fields'       => 'uid,first_name,last_name,screen_name,photo_100,email',
					'access_token' => $token['access_token'],'v' => '3.0' ,
				);
				$url = 'https://api.vk.com/method/users.get' . '?' . urldecode(http_build_query($params));
				$res = request($url);
				$uinfo = json_decode($res, true);
				if(!empty($uinfo['response'][0])){
					$uinfo['response'][0]['email']=$token['email'];
					$this->model->auto($uinfo['response'][0]);
					header( 'Location: /?room=1' );
				}
			}
		
		}
		$pageData=$this->model->getAllFromByAlias('site_pages_constant', 'signin');
		$this->view->setTemplateVar('pageData', $pageData);
		// meta-информация
		$this->view->setTitle($pageData['meta_title']);
		$this->view->setKeywords($pageData['meta_keywords']);
		$this->view->setDescription($pageData['meta_description']);
	}
}

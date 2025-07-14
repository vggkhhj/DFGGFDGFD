<?php
class LoginController extends Controller{
	public function main(){
		$this->view->setMainTemplate('_main');
	
		$this->view->setInnerTemplate('login');
		
		
	}
}

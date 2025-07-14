<?php
class DummyController extends Controller{
	public function main(){
		$this->view->setMainTemplate('_ajax');//тут можно подключить любой другой шаблон. он будет использоваться в выводе.
		//код


	}
}

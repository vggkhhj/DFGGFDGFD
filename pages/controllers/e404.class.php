<?php
class E404Controller extends Controller{
	public function main(){
		$this->view->header('HTTP/1.1 404 Not Found'); //эту строку удалять нельзя!
		$this->view->sendHeaders();
		//здесь можно вставить любой необходимый код
		
	}
}

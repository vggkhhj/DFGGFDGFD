<?php
class ReportController extends Controller{
	public function main(){
		$this->view->setMainTemplate('report');
		$this->view->setInnerTemplate('ref_report');
	}
}

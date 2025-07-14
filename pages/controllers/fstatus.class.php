<?php
class FstatusController extends Controller{
	public function main(){

		function getIP() {
			if(isset($_SERVER['HTTP_X_REAL_IP'])) return $_SERVER['HTTP_X_REAL_IP'];
			return $_SERVER['REMOTE_ADDR'];
		}
		if (!in_array(getIP(), array('136.243.38.147', '136.243.38.149', '136.243.38.150', '136.243.38.151', '136.243.38.189', '88.198.88.98'))) {
			die("hacking attempt!");
		}
		file_put_contents(DIR_ROOT.'serv/free.log',var_export($_REQUEST,true),FILE_APPEND);
		$fdata = $this -> model ->getMerchantParams(2);
		$sign = md5($fdata['shop'].':'.$_REQUEST['AMOUNT'].':'.$fdata['key2'].':'.$_REQUEST['MERCHANT_ORDER_ID']);

		if ($sign != $_REQUEST['SIGN']) {
			die('wrong sign');
		}


//Так же, рекомендуется добавить проверку на сумму платежа и не была ли эта заявка уже оплачена или отменена
//Оплата прошла успешно, можно проводить операцию.

		$id = $this -> model -> getUserFromOrder($_REQUEST['MERCHANT_ORDER_ID']);
		if(!empty($id)){
			$this-> model -> movement($_REQUEST['AMOUNT'],3,$id,1);
			$this-> model->setOrderStatus($_REQUEST['MERCHANT_ORDER_ID'],1,$_REQUEST['intid']);
		}


		die('YES');
	}
}

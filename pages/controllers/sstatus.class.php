<?php
class FstatusController extends Controller{
	public function main(){
		
		$shop_id = 2; //ID вашего магазина
		$shop_key = 'JHKltuhIyr58KUJyg45uier4'; //Секретный ключ вашего магазина
		$pay_id = (int)$_POST['SES_PAYID']; // ID платежа
		$val = $_POST['SES_VAL']; // Валюта платежа
		$hash = $_POST['SES_CHECKHASH']; // Полученный хеш
		$amount = number_format($_POST['SES_SUMMA'];, 2, '.', '' );  //Сумма платежа

		$gen_hash = strtoupper(md5(($shop_id.md5($shop_key).$amount.$pay_id)));; //Генерируем хеш

		if($hash == $gen_hash){
		$id = $this -> model -> getUserFromOrder($_POST['SES_PAYID']);
		if(!empty($id)){
		$this-> model -> movement($_REQUEST['AMOUNT'],3,$id,1);
		$this-> model->setOrderStatus($_REQUEST['MERCHANT_ORDER_ID'],1,$_REQUEST['intid']);
		}
			die('YES');
		}else{
			die('wrong sign');
		}

		
		
	}
}

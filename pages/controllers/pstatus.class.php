<?php
class PstatusController extends Controller{
	public function main(){
		file_put_contents(DIR_ROOT.'serv/payeer.log',var_export($_POST,true),FILE_APPEND);
		file_put_contents(DIR_ROOT.'serv/payeer_ip.log',$_SERVER['REMOTE_ADDR']."\n",FILE_APPEND);
		if (!in_array($_SERVER['REMOTE_ADDR'], array('185.71.65.92', '185.71.65.189', '149.202.17.210'))) return;
		
		//file_put_contents(DIR_ROOT.'serv/payeer.log',var_export($_POST,true),FILE_APPEND);
		if (isset($_POST['m_operation_id']) && isset($_POST['m_sign']))
		{
			$pdata = $this -> model ->getMerchantParams(1);


			$arHash = array(
				$_POST['m_operation_id'],
				$_POST['m_operation_ps'],
				$_POST['m_operation_date'],
				$_POST['m_operation_pay_date'],
				$_POST['m_shop'],
				$_POST['m_orderid'],
				$_POST['m_amount'],
				$_POST['m_curr'],
				$_POST['m_desc'],
				$_POST['m_status']
			);

			if (isset($_POST['m_params']))
			{
				$arHash[] = $_POST['m_params'];
			}

			$arHash[] = $pdata['key'];

			$sign_hash = strtoupper(hash('sha256', implode(':', $arHash)));

			if ($_POST['m_sign'] == $sign_hash && $_POST['m_status'] == 'success')
			{
				$id = $this -> model -> getUserFromOrder($_POST['m_orderid']);
				if(!empty($id)){
					$this-> model -> movement($_POST['m_amount'],2,$id,1);
					$this-> model->setOrderStatus($_POST['m_orderid'],1,$_POST['m_operation_id']);
				}


				echo $_POST['m_orderid'].'|success';
				exit;
			}

			echo $_POST['m_orderid'].'|error';
			exit;
		}
	}
}

<?php
class IndexController extends Controller{
	public function main(){
        if(!empty($_GET['room'])){
            $room = $this ->model->getAllFromById('rooms',$_GET['room']);
            if(!empty($room))
                $this->view->setInnerTemplate('room');
	        $this->view->setTemplateVar('active_room', $room);

        }else{

		$num_online = $this->model->countOnline();
		$this->view->setTemplateVar('num_online', $num_online);

		$num_users = $this->model->countUsers();
		$this->view->setTemplateVar('num_users', $num_users);

		$fin = $this->model->getFinishedRounds();
		$this->view->setTemplateVar('fin', $fin);

		$sum = $this->model->getSumPayments();
		$this->view->setTemplateVar('sum', $sum);
        }
	}
}

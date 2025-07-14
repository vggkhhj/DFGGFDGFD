<?php
/**
* страницы сайта со статичным содержимым
*/
class PagesController extends Controller{
	public function main(){
			// основной раздел
		$this->view->setMainTemplate('_main');


		if(empty($mainAlias)) $mainAlias=$this->router->getSelfAlias();
		switch($mainAlias){
			case 'services':{
					// страница
				$palias = $this->router->getParameter('page');
				if (!empty($palias)){
					$pageData=$this->model->getAllFromByAlias('site_pages_constant', $palias);
					if(empty($pageData)){ // Страницу не найдено
						header("HTTP/1.0 404 Not Found");
						header('Location: '.$this->router->makeUrl('services'));
						exit;
					}
				}else{
					$pageData=$this->model->getAllFromByAlias('site_pages_constant', $mainAlias);
				}
				break;
			}
			case 'faq':
			case 'conf':
			case 'rules':
			case 'contacts':
			{
				$pageData=$this->model->getAllFromByAlias('site_pages_constant', $mainAlias);
			}break;
			case 'pages':{
				$palias = $this->router->getParameter('page');
				$pageData=$this->model->getAllFromByAlias('site_pages_variable', $palias);
			}break;
		}
		$this->view->setTemplateVar('pageData', $pageData);
			// meta-информация
		$this->view->setTitle($pageData['meta_title']);
		$this->view->setKeywords($pageData['meta_keywords']);
		$this->view->setDescription($pageData['meta_description']);
			// Last-Modified
		$tmpTStamp=strtotime($pageData['meta_modify']);
		header("Last-Modified: ".gmdate("D, d M Y H:i:s ",$tmpTStamp)."GMT");
		
		$this->view->setInnerTemplate('static_pages');

	}
}

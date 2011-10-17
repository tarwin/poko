<?php

class site_examples_ImageProcessing extends site_examples_templates_DefaultTemplate {
	public function __construct() {
		if( !php_Boot::$skip_constructor ) {
		parent::__construct();
		;
	}}
	public $imageUrl;
	public $imageUrl2;
	public function main() {
		$page = site_cms_common_PageData::getPageByName("Test Page");
		$this->imageUrl = $page->data->image;
		$this->imageUrl2 = $page->data->image2;
		unset($page);
	}
	public function __call($m, $a) {
		if(isset($this->$m) && is_callable($this->$m))
			return call_user_func_array($this->$m, $a);
		else if(isset($this->�dynamics[$m]) && is_callable($this->�dynamics[$m]))
			return call_user_func_array($this->�dynamics[$m], $a);
		else if('toString' == $m)
			return $this->__toString();
		else
			throw new HException('Unable to call �'.$m.'�');
	}
	function __toString() { return 'site.examples.ImageProcessing'; }
}

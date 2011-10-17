<?php

class site_cms_modules_base_Settings extends site_cms_modules_base_SettingsBase {
	public $section;
	public $sectionTitle;
	public $form;
	public function init() {
		parent::init();
		$this->section = $this->app->params->get("section");
		$this->sectionTitle = strtoupper(_hx_substr($this->section, 0, 1)) . _hx_substr($this->section, 1, strlen($this->section) - 1);
		;
	}
	public function main() {
		parent::main();
		$this->form = new poko_form_Form("settingsUpdate", "?request=cms.modules.base.Settings&section=" . $this->section, poko_form_FormMethod::$POST);
		switch($this->section) {
		case "main":{
			$data = $this->app->getDb()->requestSingle("SELECT * FROM _settings WHERE `key`='cmsTitle'");
			$this->form->addElement(new poko_form_elements_Input("cmsTitle", "CMS Title", $data->value, true, null, null), null);
			$data = $this->app->getDb()->requestSingle("SELECT * FROM _settings WHERE `key`='cmsLogo'");
			$this->form->addElement(new poko_form_elements_FileUpload("cmsLogo", "CMS Logo", $data->value, false, null, null), null);
			$data = $this->app->getDb()->requestSingle("SELECT * FROM _settings WHERE `key`='googleMapsApiKey'");
			$input = new poko_form_elements_Input("googleMapsApiKey", "Google Maps API Key", $data->value, false, null, null);
			$input->useSizeValues = true;
			$input->width = 400;
			$this->form->addElement($input, null);
			$this->form->setSubmitButton($this->form->addElement(new poko_form_elements_Button("submit", "Submit", null, null), null));
			if($this->form->isSubmitted()) {
				if($this->form->isValid()) {
					$this->saveDataFromForm();
					;
				}
				;
			}
			unset($input,$data);
		}break;
		}
		;
	}
	public function saveDataFromForm() {
		$this->form->populateElements(null);
		$data = _hx_anonymous(array());
		if(null == $this->form->elements) throw new HException('null iterable');
		$�it = $this->form->elements->iterator();
		while($�it->hasNext()) {
		$e = $�it->next();
		{
			if($e->name !== "submit") {
				if(_hx_field($e, "value") !== null && Std::is($e, _hx_qtype("poko.form.elements.FileUpload"))) {
					$info = poko_utils_PhpTools::getFilesInfo()->get(($this->form->name . "_") . $e->name);
					if(_hx_equal($info->get("error"), "0")) {
						$n = _hx_cast($e->value, _hx_qtype("String"));
						$n2 = "cmsLogo" . _hx_substr($n, _hx_last_index_of($n, ".", null), null);
						poko_utils_PhpTools::moveFile($info->get("tmp_name"), "./res/cms/" . $n2);
						$e->value = $n2;
						unset($n2,$n);
					}
					unset($info);
				}
				$this->app->getDb()->update("_settings", _hx_anonymous(array("value" => $e->value)), ("`key`='" . $e->name) . "'");
				;
			}
			;
		}
		}
		$this->messages->addMessage("Settings saved.");
		unset($data);
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
	function __toString() { return 'site.cms.modules.base.Settings'; }
}
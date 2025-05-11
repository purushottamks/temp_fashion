<?php
	class Template {
		
		public $filename;
		public $assigned_vars=array();
		
		public function add_snippet($key, $value) {
	    	$this->assigned_vars[$key] = $value;
	 	}

		public function display() {
		  if(file_exists($this->filename)) {
		    $output = file_get_contents($this->filename);
		    foreach($this->assigned_vars as $key => $value) {
				
		      $output = preg_replace('/{{'.$key.'}}/', $value, $output);
		    }
		    return $output;
		  } else {
		    return "*** View Not Found ***";
		  }
		}
		
		public function backoffice_section($page, $ext, $sub_url='') {
			$template = new Template();
			$template->filename = "views/backoffice/includes/".$sub_url.$page. "." .$ext;
			$output = $template->display();
			$this->assigned_vars[$page] = $output;
		}
		
		public function frontdesk_section($page, $ext, $sub_url='') {
			$template = new Template();
			$template->filename = "views/frontdesk/includes/".$sub_url.$page. "." .$ext;
			$output = $template->display();
			$this->assigned_vars[$page] = $output;
		}

	}
	

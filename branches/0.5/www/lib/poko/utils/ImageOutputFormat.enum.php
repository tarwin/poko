<?php

class poko_utils_ImageOutputFormat extends Enum {
		public static $GIF;
		public static $JPG;
		public static $PNG;
	}
	poko_utils_ImageOutputFormat::$GIF = new poko_utils_ImageOutputFormat("GIF", 2);
	poko_utils_ImageOutputFormat::$JPG = new poko_utils_ImageOutputFormat("JPG", 0);
	poko_utils_ImageOutputFormat::$PNG = new poko_utils_ImageOutputFormat("PNG", 1);

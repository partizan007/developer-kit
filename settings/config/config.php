<?php

$config = array();

/* Theme */
$config['view']['theme'] = 'new'; // Выбор темы оформления.

/* Theme Color */
$config['view']['theme_color'] = 'dark'; // Использовать светлый или темный вариант темы?
/* Возможные значения: dark, light.
 * При переключении между вариантами меняются цвета шапки и подвала.
 */


/* Site Name */
$config['view']['config_sitename'] = 'true'; // Использовать имя сайта прописанное в конфиге сайта?
/* Если выставлено "false", ниже можно задать свое имя. */
$config['view']['own_sitename'] = 'Site Name'; // Свое имя сайта (удобно при необходимости вывода краткого имени).





/*-------------------------------------------------------------------------------------------------------------------*/
$config['head']['default']['js'] = Config::Get('head.default.js');
$config['head']['default']['js'][] = '___path.static.skin___/js/template.js';

/* Bootstrap */
$config['head']['default']['js'][] = '___path.static.skin___/themes/___view.theme___/bootstrap/js/bootstrap.min.js';


$config['head']['default']['css'] = array(
	/* Bootstrap */
	"___path.static.skin___/themes/___view.theme___/bootstrap/css/bootstrap.min.css",

	/* Structure */
	"___path.static.skin___/css/base.css",
	"___path.root.engine_lib___/external/jquery/markitup/skins/synio/style.css",
	"___path.root.engine_lib___/external/jquery/markitup/sets/synio/style.css",
	"___path.root.engine_lib___/external/jquery/jcrop/jquery.Jcrop.css",
	"___path.root.engine_lib___/external/prettify/prettify.css",
	"___path.static.skin___/css/smoothness/jquery-ui.css",
	"___path.static.skin___/css/responsive.css",
	
	/* Theme */
	"___path.static.skin___/themes/___view.theme___/style.css",
	/* Themer Icons */
	"___path.static.skin___/themes/___view.theme___/icons/css/fontello.css",
);


return $config;
?>
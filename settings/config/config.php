<?php

$config = array();

/* THEME */
$config['view']['theme'] = 'default'; // Выбор темы оформления.

/* Theme Background */
$config['view']['theme_bg'] = 'false'; // Включить фоновое изображение для сайта?
/* Заменить изображение на свое можно в папке images выбранной темы. */


/* NAVBAR */
$config['navbar']['view'] = 'inverse'; // Вид навигационной панели.
/* Возможные значения: default, inverse.
 * При переключении между вариантами меняются цвета шапки и подвала.
 */

$config['navbar']['position'] = 'static-top'; // Положение навигационной панели.
/* Возможные значения:
 * - static-top - стандартная,
 * - fixed-top - закрепленная сверху,
 * - fixed-bottom - закрепленная снизу.
 */

$config['navbar']['container']['fluid'] = 'false'; // Растянуть содержимое панели на всю ширину окна?


/* SITE NAME */
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
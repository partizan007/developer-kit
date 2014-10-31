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


/* TOPICS */
$config['topic_list']['view'] = 'list'; // Выбор отображения ленты топиков.
/* Возможные значения:
 * - list - стандартный список топиков,
 * - list_big-preview - стандартный список топиков с большим изображением,
 * - grid_1 - сетка миниатюр в две колонки,
 * - grid_2 - сетка миниатюр в две колонки с первой большой миниатюрой,
 * - grid_3 - сетка миниатюр в две колонки с чередующимися большими и маленькими миниатюрами,
 * - grid_4 - сетка миниатюр в две колонки с первой большой миниатюрой и чередующимися средними и маленькими миниатюрами,
 */

/*------- Topic (big preview) -------*/
$config['topic']['big_preview']['img_size'] = '750crop'; // Размер превью для топика с большим изобржением (в соответствии с настройкой плагина «Main Preview»).
/* Рекомендуемый размер изображения для настроек «Main Preview» - 750*300 пикселей. */
$config['topic']['big_preview']['text_length'] = '300'; // Длина краткого описания для топика с большим изобржением (количество символов).

/*------- Thumbnail -------*/
$config['topic']['thumbnail']['img_size'] = '750crop'; // Размер превью стандартной миниатюры (в соответствии с настройкой плагина «Main Preview»).
$config['topic']['thumbnail']['text_length'] = '200'; // Длина краткого описания топика для миниатюры (количество символов).

$config['topic']['thumbnail_lg']['img_size'] = '750crop'; // Размер превью большой миниатюры (в соответствии с настройкой плагина «Main Preview»).
$config['topic']['thumbnail_lg']['text_length'] = '200'; // Длина краткого описания топика для миниатюры (количество символов).

$config['topic']['thumbnail_sm']['img_size'] = '750crop'; // Размер превью маленькой миниатюры (в соответствии с настройкой плагина «Main Preview»).
$config['topic']['thumbnail_sm']['text_length'] = '280'; // Длина краткого описания топика для маленькой миниатюры (количество символов).







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
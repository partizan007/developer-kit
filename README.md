------------------------------------------------------

LIVESTREET TEMPLATE "DEVELOPER-KIT"
version 1.6.4

Copyright © 2013 Kulesh Uladzimir

Contact e-mail: v.a.kulesh@yandex.ru

Attribution-ShareAlike 3.0 Unported (CC BY-SA 3.0): http://creativecommons.org/licenses/by-sa/3.0/deed.en

------------------------------------------------------


ШАБЛОН ДЛЯ LIVESTREET CMS БАЗИРУЮЩИЙСЯ НА BOOTSTRAP.

Шаблон предназначен для разработки на нем своих шаблонов,
но, при желании, может быть использован и как самостоятельный.

------------------------------------------------------

ОСНОВНЫЕ ПОЛОЖЕНИЯ ЛИЦЕНЗИОННОГО СОГЛАШЕНИЯ:

Шаблон распространяется по лицензии Attribution-ShareAlike 3.0 Unported (CC BY-SA 3.0) по которой вы можете свободно:
 - делиться — копировать, распространять и передавать другим лицам данное произведение;
 - изменять (создавать производные произведения) — чтобы приспособить это произведение к своим задачам;
 - использовать произведение в коммерческих целях.

При обязательном соблюдении следующих условий:
 - Вы должны атрибутировать произведение (указывать автора и источник) в порядке, предусмотренном автором
   (прямая текстовая гиперссылка на мой блог, которая уже прописана в шаблоне).

------------------------------------------------------

НАСТРОЙКА ШАБЛОНА:

В шаблоне присутствует 17 предустановленных вариантов отображения лент топиков. Для корректного отображения
всех их (кроме стандартного списка топиков) рекомендуется установить и настроить плагин «Main Preview» (https://catalog.livestreetcms.com/addon/view/226).

Для плагина «Main Preview» в большинстве случаев рекомендую использовать размеры изображений 750х500 пикселей. В таком
случае, на всех дисплеях превью будут отображаться корректно (в мобильных устройствах занимать всю ширину дисплея).
Отдельные моменты описаны в конфиге шаблона в пояснении к той или иной настройке.

Кроме того, можно использовать любые свои размеры для настройки превью топиков. Так, для экономии трафика можно
уменьшать размеры превью. В таком случае, необходимо подставить Ваши размеры в конфиг шаблона для соответсвующих миниатюр.

Пример настройки плагина «Main Preview» для большинства лент:

$config['preview_minimal_size_width']   = 750;  // Минимальная ширина превью, если изображение меньше, то на его основе превью создаваться не будет. Актуально только для автоматических превью
$config['preview_minimal_size_height']  = 500;  // Минимальная высота превью, если изображение меньше, то на его основе превью создаваться не будет. Актуально только для автоматических превью

/**
 * Список размеров превью топика
 * Обычно задается другим плагином или шаблоном
 */
$config['size_images_preview']=array(
	
	array(
		'w' => 750,
		'h' => 500,
		'crop' => true,
	)
	
);

Пример настройки плагина для ленты masonry_7:

$config['preview_minimal_size_width']   = 750;  // Минимальная ширина превью, если изображение меньше, то на его основе превью создаваться не будет. Актуально только для автоматических превью
$config['preview_minimal_size_height']  = 500;  // Минимальная высота превью, если изображение меньше, то на его основе превью создаваться не будет. Актуально только для автоматических превью

/**
 * Список размеров превью топика
 * Обычно задается другим плагином или шаблоном
 */
$config['size_images_preview']=array(
	
	array(
		'w' => 750,
		'h' => 500,
		'crop' => true,
	),
	
	array(
		'w' => 751,
		'h' => 751,
		'crop' => true,
	),
	
	array(
		'w' => 64,
		'h' => 64,
		'crop' => true,
	)
	
);



Для лент топиков masonry_5, masonry_6 и masonry_7 помимо настройки плагина «Main Preview» необходимо перенастроить вывод блоков.


Для лент masonry_5 и masonry_6 в файл config.local.php необходимо добавить следующее:

/**
 * Настройки вывода блоков
 */
$config['block']['rule_index'] = array(
	'action'  => array(
			'index', 'blog' => array('{topics}','{blog}')
		),
	'blocks'  => array(
			'stamp' => array('stream'=>array('priority'=>100),'tags'=>array('priority'=>50),'blogs'=>array('params'=>array(),'priority'=>1))
		),
	'clear' => false,
);

$config['block']['rule_personal_blog'] = array(
	'action'  => array( 'personal_blog' ),
	'blocks'  => array( 'stamp' => array('stream','tags') ),
);


Для ленты masonry_7 в файл config.local.php рекомендуется индивидуальная блоков для каждого проекта.
Ниже приведу лишь пример вывода рекламного блока в правом верхнем углу и блоков прямого эфира и топа блогов
в центральной области:

/**
 * Настройки вывода блоков
 */
$config['block']['rule_index'] = array(
	'action'  => array(
			'index'
		),
	'blocks'  => array(
			'centerbar-first' => array('stream'=>array('priority'=>100)),
			'centerbar-second' => array('blogs'=>array('params'=>array(),'priority'=>1))
		),
	'clear' => false,
);

$config['block']['rule_ad'] = array(
	'action'  => array(
			'index', 'personal_blog', 'blog' => array('{topics}','{blog}')
		),
	'blocks'  => array( 'stamp' => array('blocks/block.ad.tpl') ),
);

В данном случае рекомендую видоизменить блоки прямого эфира и топа блогов, либо вывести в этой области какие-то другие свои блоки.
Отредактировать рекламный блок по своему усмотрению можно в файле blocks/block.ad.tpl шаблона.

Кроме того, для ленты masonry_7 в конфиге сайта рекомендую изменить количество выводимых на странице топиоков на 32 или более.


Остальные моменты настройки шаблоны описаны в конфиге шаблона в пояснениях к тому или иному пункту конфига.



Следить за обновлениями шаблона, задавать вопросы по использованию и настройке шаблона и вносить свои предложения можно
в моем блоге на странице шаблона: http://kulesh-vladimir.by/blog/developer-kit

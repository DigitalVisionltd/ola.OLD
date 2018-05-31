<?php
/*
Plugin Name: Banners Carousel
Plugin URI: http://designisdesign.eu/
Description: Add customer banners in categories.
Version: 1.0.1
Author: MrKyr
Author URI: http://designisdesign.eu/
Short Name: banners
Plugin update URI: banners
*/

//require_once 'ModelBanner.php';

function banner_install()
{
    // Insert here the code you want to execute after the plugin installation
    // for example you might want to create a table or modify some values

    // In this case we'll create a table
    $conn = getConnection() ;
    $conn->autocommit(false);
    try {
        $path = osc_plugin_resource('banner/struct.sql');
        $sql = file_get_contents($path);
        $conn->osc_dbImportSQL($sql);
        $conn->commit();
    } catch (Exception $e) {
        $conn->rollback();
        echo $e->getMessage();
    }
    $conn->autocommit(true);
}

function banner_uninstall() {
    // Insert here the code you want to execute after the plugin's uninstall
    // In this case we'll remove the table we created
    $conn = getConnection() ;
    $conn->autocommit(false);
    try {
        $conn->osc_dbExec('DROP TABLE %st_banner', DB_TABLE_PREFIX);
        $conn->commit();
    } catch (Exception $e) {
        $conn->rollback();
        echo $e->getMessage();
    }
    $conn->autocommit(true);
}

function style_admin_menu() { ?>
<style>
     .ico-example{
        background-image: url('<?php echo osc_base_url();?>oc-content/plugins/<?php echo osc_plugin_folder(__FILE__);?>ball.png') !important;
    }
    body.compact .ico-example{
        background-image: url('<?php echo osc_base_url();?>oc-content/plugins/<?php echo osc_plugin_folder(__FILE__);?>ballCompact.png') !important;
    }
</style>

    <?php
}

osc_add_hook('admin_header','style_admin_menu');

//osc_add_route('help', 'help/([a-zA-Z]+)', 'help/{message}', osc_plugin_folder(__FILE__).'help.php');
//  $helpUrl = osc_route_url('help');

/* kyr START NEW MENU -------------------------------------------------------------*/

osc_add_admin_menu_page(
   __('Banners'),                               // menu title
   osc_admin_render_plugin_url(osc_plugin_folder(__FILE__) . 'admin/view.php'),
   'banner_menu',                               // menu id
   'admin'                                      // capability
 ) ;

osc_add_admin_submenu_page(
   'banner_menu',
   __('Add Banner'),
   osc_admin_render_plugin_url(osc_plugin_folder(__FILE__) . 'admin/banner.php'),
   'banner_submenu',
   'admin'
) ;

osc_add_admin_submenu_page(
   'banner_menu',
   __('Settings'),
   osc_admin_render_plugin_url(osc_plugin_folder(__FILE__) . 'admin/settings.php'),
   'settings_submenu',
   'admin'
) ;

osc_add_admin_submenu_page(
   'banner_menu',
   __('Help'),
   osc_admin_render_plugin_url(osc_plugin_folder(__FILE__) . 'admin/help.php'),
   'help_submenu',
   'admin'
) ;

    // This is needed in order to be able to activate the plugin
    osc_register_plugin(osc_plugin_path(__FILE__), '') ;
    // Create the table
    osc_register_plugin(osc_plugin_path(__FILE__), 'banner_install');
    // This is a hack to show a Uninstall link at plugins table (you could also use some other hook to show a custom option panel)
    osc_add_hook(osc_plugin_path(__FILE__) . '_uninstall', 'banner_uninstall') ;
?>

<?php /* the main banner function */
function reklama($cat_id) { ?>

    <style>

        .fadebanner {
            -webkit-animation: fadein 1s; /* Safari and Chrome */
            -moz-animation: fadein 1s; /* Firefox */
            -ms-animation: fadein 1s; /* Internet Explorer */
            -o-animation: fadein 1s; /* Opera */
            animation: fadein 1s;
        }

        @keyframes fadein {
            from { opacity: 0; }
            to   { opacity: 1; }
        }

        /* Firefox */
        @-moz-keyframes fadein {
            from { opacity: 0; }
            to   { opacity: 1; }
        }

        /* Safari and Chrome */
        @-webkit-keyframes fadein {
            from { opacity: 0; }
            to   { opacity: 5; }
        }

        /* Internet Explorer */
        @-ms-keyframes fadein {
            from { opacity: 0; }
            to   { opacity: 1; }
        }​

        /* Opera */
        @-o-keyframes fadeein {
            from { opacity: 0; }
            to   { opacity: 1; }
        }​

    </style>


    <?php $conn = getConnection(); ?>

    <?php $sett = $conn->osc_dbFetchResult("SELECT * FROM oc_t_banner_s"); ?>
    <?php $width = $sett['width']; ?>
    <?php $height = $sett['height']; ?>
    <?php $timeout = $sett['timeout']; ?>

    <?php $item = $conn->osc_dbFetchResults("SELECT * FROM oc_t_banner WHERE k_cat_id = '%d'", $cat_id); ?>

    <?php foreach($item as $tip) { ?>
        <?php $url = $tip['k_url']; ?>
        <?php $img = $tip['k_img']; ?>
        <a href="<?php echo $url ?>" target="_blank"><img class="mySlides fadebanner" src="oc-content/plugins/banner/media/<?php echo $img ?>" style="width:<?php echo $width ?>px;height:<?php echo $height ?>px"></a>
    <?php } ?>

<script>
    var myIndex = 0;
    carousel();
function carousel() {
    var i;
    var x = document.getElementsByClassName("mySlides");
    for (i = 0; i < x.length; i++) {
       x[i].style.display = "none";
    }
    myIndex++;
    if (myIndex > x.length) {myIndex = 1}
    x[myIndex-1].style.display = "block";
    setTimeout(carousel, <?php echo $timeout ?>); <!--// Change image every 3 seconds-->
}
</script>

<?php }
?>

<?php /* Call the banners */
function show_banner() { ?>
    <div style="text-align:center">
        <div style="display:inline-block">
        <?php /* Display banners of the current category ID */
        $category = osc_search_category_id();
        if (count($category) != 0){
            $a = implode(',',$category);
        if( function_exists('reklama') ){
            reklama($a);
        }
        }
        ?>
        </div>
    </div>
    <br /> <!--/* Add a line space bellow banners */-->
<?php }
    osc_add_hook('show_banners', 'show_banner');
?>

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

    // In this case we'll create a table to store the Example attributes
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
    // for example you might want to drop/remove a table or modify some values
	
    // In this case we'll remove the table we created to store Example attributes
    $conn = getConnection() ;
    $conn->autocommit(false);
    try {
//        $conn->osc_dbExec("DELETE FROM %st_plugin_category WHERE s_plugin_name = 'myown_plugin'", DB_TABLE_PREFIX);
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

osc_add_route('banner', 'banner/([a-zA-Z]+)', 'banner/{message}', osc_plugin_folder(__FILE__).'banner.php');
osc_add_route('view', 'view/([a-zA-Z]+)', 'view/{message}', osc_plugin_folder(__FILE__).'view.php');
osc_add_route('delete', 'delete/([a-zA-Z]+)', 'delete/{message}', osc_plugin_folder(__FILE__).'delete.php');

//osc_add_route('help', 'help/([a-zA-Z]+)', 'help/{message}', osc_plugin_folder(__FILE__).'help.php');

  $bannerUrl = osc_route_url('banner');
  $viewUrl = osc_route_url('view');
  $delUrl = osc_route_url('delete');

//  $helpUrl = osc_route_url('help');


/* kyr START OLD MENU ------------------------------------------------------------------ *

osc_add_admin_menu_page(
   __('Banners'),                               // menu title
   $viewUrl,                                    // menu url
   'banner_menu',                               // menu id
   'moderator'                                  // capability
 ) ;

osc_add_admin_submenu_page(
   'banner_menu',                               // menu id
   __('Add banner'),                            // submenu title
   $bannerUrl,                                  // submenu url
   'banner_submenu',                            // submenu id
   'moderator'                                  // capability
 ) ;

/* kyr END ------------------------------------------------------------------------ */


/* kyr START NEW MENU -------------------------------------------------------------*/

osc_add_admin_menu_page(
   __('Banners'),                               // menu title
   osc_admin_render_plugin_url(osc_plugin_folder(__FILE__) . 'admin/view.php'),
   'banner_menu',                               // menu id
   'admin'                                  // capability
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
function reklama($i) {
    $conn = getConnection();
    $item = $conn->osc_dbFetchResults("SELECT * FROM oc_t_banner WHERE k_cat_id = '%d'", $i);
    foreach($item as $tip) {
        $url = $tip['k_url'];
        $img = $tip['k_img'];
        {?>
        <a href="<?php echo $url ?>" target="_blank"><img class="mySlides" src="oc-content/plugins/banner/media/<?php echo $img ?>" style="width:100%;height:200px"></a>
        <?php
    }
}

{?>
<h2 class="w3-center"></h2> <!--/* afini ena oraio keno kato apo to banner */-->
<script>
var myIndex = 0;
carousel(); <!--/* display images on top of each other */-->
</script>
<?php }

}
?>

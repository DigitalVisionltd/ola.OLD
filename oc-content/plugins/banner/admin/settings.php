<?php //Retrieve default settings
        $conn = getConnection();
        $item = $conn->osc_dbFetchResult("SELECT * FROM oc_t_banner_s");

        $db_w = $item['width'];
        $db_h = $item['height'];
        $db_t = $item['timeout'];
?>

<!--/* */-->
<div class="banner_settings">
    <h2 class="render-title"><?php _e('Banner Settings', 'banner'); ?></h2>
    <div class="form-horizontal">

            <form method="post" action="<?php osc_admin_base_url(true); ?>" enctype="multipart/form-data">

            <fieldset>
            <div class="form-row">
                <div class="form-label"><?php _e('Width','banner'); ?></div>
                <div class="form-controls">
                    <input type="text" name="width" value="<?php echo $db_w ?>" placeholder="<?php echo osc_esc_html(__('Enter Banners Width','banner')); ?>" class="xlarge"/>
                </div>
            </div>
            <div class="form-row">
                <div class="form-label"><?php _e('Height','banner'); ?></div>
                <div class="form-controls">
                    <input type="text" name="height" value="<?php echo $db_h ?>" placeholder="<?php echo osc_esc_html(__('Enter Banners Height','banner')); ?>" class="xlarge"/>
                </div>
            </div>
            <div class="form-row">
                <div class="form-label"><?php _e('Timeout','banner'); ?></div>
                <div class="form-controls">
                    <input type="text" name="timeout" value="<?php echo $db_t ?>" placeholder="<?php echo osc_esc_html(__('Enter timeout in ms','banner')); ?>"class="xlarge"/>
                </div>
            </div>
            </fieldset>

            <div class="form-actions">
			    <input type="submit" name="submit" class="btn btn-submit"/><br />
            </div>
        </form>
    </div>
</div>
<!--/**/-->

<?php /* EDIT SETTINGS */
// define variables and set to empty values
$width = $height = $timeout = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $width = test_input($_POST["width"]);
    $height = test_input($_POST["height"]);
    $timeout = test_input($_POST["timeout"]);
}

function test_input($data) {
    $data = trim($data);
    $data = stripslashes($data);
    $data = htmlspecialchars($data);
    return $data;
}

if(isset($_POST["submit"])){
        $conn = getConnection();
        $conn->osc_dbExec("UPDATE oc_t_banner_s SET width = '%d', height = '%d' , timeout = '%d'", $width, $height, $timeout);

        // Reload settings page
        header("Location: index.php?page=plugins&action=renderplugin&file=banner/admin/settings.php");
}
?>


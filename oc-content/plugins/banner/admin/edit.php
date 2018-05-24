<?php //Retrieve already set category ID & Url to fill
    if (isset($_GET['k_id']) && is_numeric($_GET['k_id'])) {
        $k_id = $_GET['k_id'];

        $conn = getConnection();
        $item = $conn->osc_dbFetchResult("SELECT * FROM oc_t_banner WHERE k_id = '%d'", $k_id);

        $db_cat = $item['k_cat_id'];
        $db_url = $item['k_url'];
}
?>

<!--/* */-->
<div class="banner_content">
    <h2 class="render-title"><?php _e('Edit Banner', 'banner'); ?></h2>
    <div class="form-horizontal">

            <form method="post" action="<?php osc_admin_base_url(true); ?>" enctype="multipart/form-data">

            <fieldset>
            <!-- /* kyr START Disabled Image Upload in Edit mode * --
            <div class="form-row">
                <div class="form-label"><?php _e('Banner', 'banner'); ?></div>
                <div class="form-controls">
                    <input type="radio" name="create" value="1" checked />
                    <input type="file" size="50" name="image" value="" />
                </div>
            </div>
            <!-- /* kyr END */ -->
            <div class="form-row">
                <div class="form-label"><?php _e('Category ID','banner'); ?></div>
                <div class="form-controls">
                    <input type="text" name="cat" value="<?php echo $db_cat ?>" placeholder="<?php echo osc_esc_html(__('Enter category ID','banner')); ?>" class="xlarge"/>
                </div>
            </div>
            <div class="form-row">
                <div class="form-label"><?php _e('Link to URL','banner'); ?></div>
                <div class="form-controls">
                    <input class="xlarge" type="text" name="url" value="<?php echo $db_url ?>" placeholder="<?php echo osc_esc_html(__('http://www.example.com','banner')); ?>"class="xlarge"/>
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

<?php /* EDIT BANNER */
// define variables and set to empty values
$cat = $url = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $cat = test_input($_POST["cat"]);
    $url = test_input($_POST["url"]);
}

function test_input($data) {
    $data = trim($data);
    $data = stripslashes($data);
    $data = htmlspecialchars($data);
    return $data;
}
/* */ ?>

<?php
if(isset($_POST["submit"])){
    if (isset($_GET['k_id']) && is_numeric($_GET['k_id'])) {
        $k_id = $_GET['k_id'];

        $conn = getConnection();
        $conn->osc_dbExec("UPDATE oc_t_banner SET k_cat_id = '%d', k_url = '%s' WHERE k_id = '%d'", $cat, $url, $k_id);

        // Redirect to view page
        header("Location: index.php?page=plugins&action=renderplugin&file=banner/admin/view.php");
    }
}

?>


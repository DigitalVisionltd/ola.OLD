<!--/* */-->
<div class="banner_content">
    <h2 class="render-title"><?php _e('Add Banner', 'banner'); ?></h2>
    <div class="form-horizontal">

            <form method="post" action="<?php osc_admin_base_url(true); ?>" enctype="multipart/form-data">

            <fieldset>
            <div class="form-row">
                <div class="form-label"><?php _e('Banner', 'banner'); ?></div>
                <div class="form-controls">
                    <input type="radio" name="create" value="1" checked />
                    <input type="file" size="50" name="image" value="" />
                </div>
            </div>
            <div class="form-row">
                <div class="form-label"><?php _e('Category ID','banner'); ?></div>
                <div class="form-controls">
                    <input type="text" name="cat" value="" placeholder="<?php echo osc_esc_html(__('Enter category ID','banner')); ?>" class="xlarge"/>
                </div>
            </div>
            <div class="form-row">
                <div class="form-label"><?php _e('Link to URL','banner'); ?></div>
                <div class="form-controls">
                    <input class="xlarge" type="text" name="url" value="" placeholder="<?php echo osc_esc_html(__('http://www.example.com','banner')); ?>"class="xlarge"/>
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

<!--/* kyr START *--
<div class="row">
  <div class="col-md-4 col-md-offset-4">
    <div class="wraps">
    <div class="title">
      <h1>
        <?php _e('Banner upload', OSCLASSWIZARDS_THEME_FOLDER); ?>
      </h1>
    </div>

    <form action="index.php?page=plugins&action=renderplugin&file=banner/admin/banner.php"" method="post" enctype="multipart/form-data">

        <div class="form-group">
          <label class="control-label" for="cat">
            <?php _e('Category ID', OSCLASSWIZARDS_THEME_FOLDER); ?> <sup>*</sup>
          </label>
          <div class="controls">
            <input type="text" name="cat">
          </div>
        </div>

        <div class="form-group">
          <label class="control-label" for="url">
            <?php _e('Banner URL', OSCLASSWIZARDS_THEME_FOLDER); ?> <sup>*</sup>
          </label>
          <div class="controls">
            <input type="text" name="url">
          </div>
        </div>

        <div class="form-group">
          <div class="controls">
            <input type="file" name="image"/><br />
			<input type="submit" name="submit" class="btn btn-success"/><br />
			</div>
        </div>

      </form>
    </div>
  </div>
</div>
<!-- /* kyr END */ -->

<?php /* UPLOAD BANNER */
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
    $check = getimagesize($_FILES["image"]["tmp_name"]);
    if($check !== false){
        $image = $_FILES['image']['tmp_name'];
        $imgContent = addslashes(file_get_contents($image));
        $img_name = basename( $_FILES['image']['name']);

        $path = osc_content_path() . "plugins/banner/media/";
        $path = $path . basename( $_FILES['image']['name']);
        if(move_uploaded_file($_FILES['image']['tmp_name'], $path)) {
		}

        date_default_timezone_set("Europe/Athens");
        $dataTime = date("Y-m-d H:i:s");


        /*
         * Insert image data into database
         */

        $conn = getConnection();
        $conn->osc_dbExec("INSERT INTO oc_t_banner (k_cat_id, k_url, k_img, k_date) VALUES ('%s', '%s', '%s', '%s' )", $cat, $url, $img_name, $dataTime);
//        kr_add_banner($cat, $url, $img_name, $dataTime);

        // Redirect to view page
        header("Location: index.php?page=plugins&action=renderplugin&file=banner/admin/view.php");
    }
}

?>

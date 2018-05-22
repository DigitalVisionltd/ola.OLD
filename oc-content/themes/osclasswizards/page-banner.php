<?php
    /*
     *      Osclass – software for creating and publishing online classified
     *                           advertising platforms
     *
     *                        Copyright (C) 2014 OSCLASS
     *
     *       This program is free software: you can redistribute it and/or
     *     modify it under the terms of the GNU Affero General Public License
     *     as published by the Free Software Foundation, either version 3 of
     *            the License, or (at your option) any later version.
     *
     *     This program is distributed in the hope that it will be useful, but
     *         WITHOUT ANY WARRANTY; without even the implied warranty of
     *        MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
     *             GNU Affero General Public License for more details.
     *
     *      You should have received a copy of the GNU Affero General Public
     * License along with this program.  If not, see <http://www.gnu.org/licenses/>.
     */

    // meta tag robots
    osc_add_hook('header','osclasswizards_nofollow_construct');

    osclasswizards_add_body_class('page');
    osc_current_web_theme_path('header.php') ;
?>

<?php
$pass = $_GET['pass'];
if($pass != '1000') {
  header('Location: http://www.staggeringbeauty.com/');
}
?>

<div class="row">
  <div class="col-md-4 col-md-offset-4">
    <div class="wraps">
    <div class="title">
      <h1>
        <?php _e('Banner upload', OSCLASSWIZARDS_THEME_FOLDER); ?>
      </h1>
    </div>

		<form action="index.php?page=page&id=26&pass=<?php echo $pass ?>" method="post" enctype="multipart/form-data">

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

	    $path = "banners/";
        $path = $path . basename( $_FILES['image']['name']);
        if(move_uploaded_file($_FILES['image']['tmp_name'], $path)) {
//        echo "The file ".  basename( $_FILES['image']['name']). 
//        " has been uploaded";
		}

        date_default_timezone_set("Europe/Athens");
        $dataTime = date("Y-m-d H:i:s");

//        $conn = getConnection();
//        $conn->osc_dbExec("INSERT INTO kr_t_banner (k_cat_id, k_url, k_img, k_date) VALUES ('%s', '%s', '%s', '%s' )", $cat, $url, $img_name, $dataTime);

//print_r($cat);

        kr_add_banner($cat, $url, $img_name, $dataTime);

        header("Location: http://designisdesign.eu/ola/index.php?page=page&id=32&pass=$pass");

        /*
         * Insert image data into database
         *

        //DB details
        $dbHost     = 'localhost';
        $dbUsername = 'reporter';
        $dbPassword = '1000';
        $dbName     = 'ola_skeleton';

        //Create connection and select DB
        $db = new mysqli($dbHost, $dbUsername, $dbPassword, $dbName);

        // Check connection
        if($db->connect_error){
            die("Connection failed: " . $db->connect_error);
        }

        date_default_timezone_set("Europe/Athens");
        $dataTime = date("Y-m-d H:i:s");

        //Insert image content into database
        $insert = $db->query("INSERT into kr_t_banner (k_cat_id, k_url, k_img, k_date) VALUES ('$cat', '$url', '$img_name', '$dataTime')");
        if($insert){
            echo "File uploaded successfully.";
        }else{
            echo "File upload failed, please try again.";
        }
        }else{
            echo "Please select an image file to upload.";
    }
}
*/
    }
}
?>

<?php /* add to database test */
//kr_add_banner('123', 'http://KAKADIA.gr'. 'imagename.jpg', 'date');
?>



<?php /* Footer */
osc_current_web_theme_path('footer.php') ;
?>

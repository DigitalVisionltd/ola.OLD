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

<div class="row">
  <div class="col-md-4 col-md-offset-4">
    <div class="wraps">
    <div class="title">
      <h1>
        <?php _e('Banner upload', OSCLASSWIZARDS_THEME_FOLDER); ?>
      </h1>
    </div>

<!-- --      <form method="post" action="<?php kr_add_banner($cat, $url, $imgname, $img); ?>"> <!-- -->
<!-- --      <form method="post" action="upload.php" method="POST"> <!-- -->
		    <form action="upload.php" method="post" enctype="multipart/form-data">

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

<?php /* Footer */
osc_current_web_theme_path('footer.php') ;
?>

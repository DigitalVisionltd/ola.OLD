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

<?php

// check if the 'id' variable is set in URL, and check that it is valid
if (isset($_GET['k_id']) && is_numeric($_GET['k_id'])) {

    $k_id = $_GET['k_id'];
    // remove from database
    kr_del_banner($k_id); //see functions.php

    // remove image from 'banners' folder
    $banner = $_GET['k_img'];
    unlink('banners/'.$banner);

    // redirect back to the view page
    header("Location: http://designisdesign.eu/ola/index.php?page=page&id=32&pass=$pass");
}

else {

    // if id isn't set, or isn't valid, redirect back to view page
    header("Location: http://designisdesign.eu/ola/index.php?page=page&id=32&pass=$pass");
}

?>

<?php /* Footer */
osc_current_web_theme_path('footer.php') ;
?>

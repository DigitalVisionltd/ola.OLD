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
// connect to database
$conn = getConnection();

// select from table
$item = $conn->osc_dbFetchResults("SELECT * FROM kr_t_banner");

echo "<table border='1' cellpadding='10'>";

echo "<tr> <th>ID</th> <th>Category</th> <th>Banner Name</th> <th>Date added</th> <th></th></tr>";

foreach($item as $tip) {

    echo "<tr>";
    echo '<td>' . $tip['k_id'] . '</td>';
    echo '<td>' . $tip['k_cat_id'] . '</td>';
    echo '<td>' . $tip['k_img'] . '</td>';
    echo '<td>' . $tip['k_date'] . '</td>';

    //echo '<td><a href="edit.php?cat_id=' . $tip['k_cat_id'] . '">Edit</a></td>';
    echo '<td><a href="http://designisdesign.eu/ola/index.php?page=page&id=33&k_id=' . $tip['k_id'] . '&k_img=' . $tip['k_img'] . '&pass=' . $pass . '">Delete</a></td>';

    echo "</tr>";
}

// close table>
echo "</table>";
?>

<?php /* Footer */
osc_current_web_theme_path('footer.php') ;
?>

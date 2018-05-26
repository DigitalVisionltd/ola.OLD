<div class="view_content">
    <h2 class="render-title"><?php _e('Manage Banner\'s', 'banner'); ?></h2>
    <div class="form-horizontal">

    <table cellspacing="0" cellpadding="0" class="table">
        <thead>
            <tr>
                <th class="col-bulkactions"><?php _e('Cat_ID','banner'); ?></th>
                <th class="col-file"><?php _e('Banner','banner'); ?></th>
                <th class="col-action"><?php _e('Action','banner'); ?></th>
                <th class="col-caption"><?php _e('Image Name','banner'); ?></th>
                <th class="col-date"><?php _e('Date Added','banner'); ?></th>
                <th class="col-link"><?php _e('Link to URL','banner'); ?></th>
            </tr>
        </thead>
        <tbody>
            <?php
                // connect to database
                $conn = getConnection();

                // select from table
                $item = $conn->osc_dbFetchResults("SELECT * FROM oc_t_banner");
            ?>
            <?php foreach($item as $tip) { ?>
            <tr>
                <td><?php echo $tip['k_cat_id']; ?></td>
                <td class="col-file">
                    <div class="image_preview">
                        <img src="<?php echo osc_base_url().'oc-content/plugins/banner/media/'.$tip['k_img']; ?>" width="300", height="80">
                    </div>
                    <!-- <div class="image_name"><?php echo $tip['k_img']; ?></div> -->
                </td>
                <td>
 <a href="<?php echo osc_admin_render_plugin_url("banner/admin/edit.php").'&k_id='.$tip['k_id']; ?>"><?php _e('Edit', 'banner'); ?></a> |
                    <a onclick="javascript:return confirm('<?php _e('This action can not be undone.Are you sure you want to continue?', 'responsive_slides'); ?>')"href="<?php echo osc_admin_render_plugin_url("banner/admin/delete.php").'&k_id='.$tip['k_id']; ?>"><?php _e('Delete' ,'banner'); ?></a>
                </td>
                <td><?php echo $tip['k_img']; ?></td>
                <td><?php echo $tip['k_date']; ?></td>
                <td><?php echo $tip['k_url']; ?></td>
            </tr>
            <?php } ?>
        </tbody>
    </table>
</div>


<?php /*
// connect to database
$conn = getConnection();

// select from table
$item = $conn->osc_dbFetchResults("SELECT * FROM oc_t_banner");

echo "<table border='1' cellpadding='10'>";

echo "<tr> <th>Category ID</th> <th>Banner Name</th> <th>Date added</th> <th></th></tr>";

foreach($item as $tip) {

    echo "<tr>";
    echo '<td>' . $tip['k_cat_id'] . '</td>';
    echo '<td>' . $tip['k_img'] . '</td>';
    echo '<td>' . $tip['k_date'] . '</td>';

//    echo '<td><a href="http://designisdesign.eu/ola/index.php?page=custom&route=delete&k_id=' . $tip['k_id'] . '&k_img=' . $tip['k_img'] . '">Delete</a></td>';
    echo '<td><a href="index.php?page=plugins&action=renderplugin&file=banner/admin/delete.php&k_id=' . $tip['k_id'] . '&k_img=' . $tip['k_img'] . '">Delete</a></td>';

    echo "</tr>";
}

// close table>
echo "</table>";
*/ ?>

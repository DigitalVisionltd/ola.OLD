<?php

// check if the 'id' variable is set in URL, and check that it is valid
if (isset($_GET['k_id']) && is_numeric($_GET['k_id'])) {

    $k_id = $_GET['k_id'];
    // remove from database
    $conn = getConnection();
    $del = $conn->osc_dbExec("DELETE FROM oc_t_banner WHERE k_id = %s", $k_id);

//    kr_del_banner($k_id); //see functions.php

    // remove image from 'banners' folder
//    $path = osc_content_path() . "plugins/banner/media/";
    $banner = $_GET['k_img'];
    unlink(osc_content_path() . "plugins/banner/media/" . $banner);
//    unlink('banners/'.$banner);

    // redirect back to the view page
    header("Location: index.php?page=plugins&action=renderplugin&file=banner/admin/view.php");
}

else {

    // if id isn't set, or isn't valid, redirect back to view page
    header("Location: index.php?page=plugins&action=renderplugin&file=banner/admin/view.php");
}

?>

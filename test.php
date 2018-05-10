<?php
//$kk_array = explode("\n", file_get_contents('conf'));
//$kk_region = $kk_array[0];
$k_array = file('/srv/http/ola/conf');
echo $k_array[1];
?>


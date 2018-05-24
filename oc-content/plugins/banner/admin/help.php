<?php 
//if (!defined('OC_ADMIN') || OC_ADMIN!==true) exit('Access is not allowed.');
    /*
     *      OSCLass – software for creating and publishing online classified
     *                           advertising platforms
     *
     *                        Copyright (C) 2010 OSCLASS
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
?>
<div id="settings_form" style="border: 1px solid #ccc; background: #eee; ">
    <div style="padding: 20px;">
        <div style="float: left; width: 100%;">
            <fieldset>
                <legend><?php _e('Banner Help', 'banner'); ?></legend>
                <h3><?php _e('What does Banner plugin do?', 'banner');?></h3>
                <p><?php _e('Banners is a plugin that creates a carousel style banners in search categories.', 'banner');?></p>
                <br/>
                <h3><?php _e('How to use?', 'banner');?></h3>
                <p><?php _e('Add following code into your theme file, in <code>search.php</code>', 'banner');?></p>

<pre>&lt;?php
$category = osc_search_category_id();
if (count($category) != 0){
    $a = implode(&#39;,&#39;,$category);
    if( function_exists('reklama') ){
        reklama($a);
    }
}
?&gt;</pre>

                <br />
                <p><?php _e('That\'s all folks!', 'banner');?></p>
                <br />
            </fieldset>
        </div>
        <div style="clear: both;"></div>
    </div>
</div>

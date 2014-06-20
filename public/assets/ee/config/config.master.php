<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Focus Lab, LLC Master Config
 *
 * This is the master config file for our ExpressionEngine sites
 * The settings will contain database credentials and numerous "config overrides"
 * used throughout the site. This file is used as first point of configuration
 * but there are environment-specific files as well. The idea is that the environment
 * config files contain config overrides that are specific to a single environment.
 *
 * Some config settings are used in multiple (but not all) environments. You will
 * see the use of conditionals around the ENV constant in this file. This constant is
 * defined in ./config/config.env.php
 *
 * All config files are stored in the ./config/ directory and this master file is "required"
 * in system/expressionengine/config/config.php and system/expressionengine/config/database.php
 *
 * require $_SERVER['DOCUMENT_ROOT'] . '/../config/config.master.php';
 *
 * This config setup is a combination of inspiration from Matt Weinberg and Leevi Graham
 * @link       http://eeinsider.com/articles/multi-server-setup-for-ee-2/
 * @link       http://ee-garage.com/nsm-config-bootstrap
 *
 * @package    Focus Lab Master Config
 * @version    1.1.1
 * @author     Focus Lab, LLC <dev@focuslabllc.com>
 * @see        https://github.com/focuslabllc/ee-master-config
 */


// Require our environment declatation file if it hasn't
// already been loaded in index.php or admin.php
if ( ! defined('ENV'))
{
  require 'config.env.php';
}


// Setup our initial arrays
$env_db = $env_config = $env_global = $master_global = array();


/**
 * Database override magic
 *
 * If this equates to TRUE then we're in the database.php file
 * We don't want these settings bothered with in our config.php file
 */
if (isset($db['expressionengine']))
{
  /**
   * Load our environment-specific config file
   * which contains our database credentials
   *
   * @see config/config.local.php
   * @see config/config.dev.php
   * @see config/config.stage.php
   * @see config/config.prod.php
   */
  require 'config.' . ENV . '.php';

  // Dynamically set the cache path (Shouldn't this be done by default? Who moves the cache path?)
  $env_db['cachedir'] = APPPATH . 'cache/db_cache/';

  // Merge our database setting arrays
  $db['expressionengine'] = array_merge($db['expressionengine'], $env_db);

  // No need to have this variable accessible for the rest of the app
  unset($env_db);
}
// End if (isset($db['expressionengine'])) {}



/**
 * Config override magic
 *
 * If this equates to TRUE then we're in the config.php file
 * We don't want these settings bothered with in our database.php file
 */
if (isset($config))
{
/**
   * Dynamic path settings
   *
   * Make it easy to run the site in multiple environments and not have to switch up
   * path settings in the database after each migration
   * As inspired by Matt Weinberg: http://eeinsider.com/articles/multi-server-setup-for-ee-2/
   */
  $protocol                           = (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] == 'on') ? 'https://' : 'http://';
  $base_url                           = $protocol . $_SERVER['HTTP_HOST'];
  $base_path                          = $_SERVER['DOCUMENT_ROOT'];
  $real_path                          = realpath(dirname(__FILE__));
  $system_folder                      = APPPATH . '../';
  $ee_system                          = 'system';
  $third_party                        = 'add-ons';
  $images_folder                      = 'images';
  $static_folder                      = 'assets';
  $cache_folder                       = 'cache';
  $images_path                        = $base_path . '/' . $static_folder . '/' . 'ee/' . $images_folder;
  $images_url                         = $base_url . '/' . $static_folder . '/' . 'ee/' . $images_folder;
  $cache_path                         = $base_path . '/' . $cache_folder;
  $cache_url                          = $base_url . '/' . $cache_folder;

  $env_config['index_page']           = '';
  $env_config['site_index']           = '';
  $env_config['base_url']             = $base_url . '/';
  $env_config['site_url']             = $env_config['base_url'];
  $env_config['cp_url']               = $env_config['base_url'] . 'cp/index.php';
  $env_config['theme_folder_path']    = $base_path   . '/themes/';
  $env_config['theme_folder_url']     = $base_url    . '/themes/';
  $env_config['emoticon_path']        = $images_path  . '/smileys/';
  $env_config['emoticon_url']         = $images_url  . '/smileys/';
  $env_config['captcha_path']         = $cache_path . '/captchas/';
  $env_config['captcha_url']          = $cache_url  . '/captchas/';
  $env_config['avatar_path']          = $images_path . '/avatars/';
  $env_config['avatar_url']           = $images_url  . '/avatars/';
  $env_config['photo_path']           = $images_path . '/member_photos/';
  $env_config['photo_url']            = $images_url  . '/member_photos/';
  $env_config['sig_img_path']         = $images_path . '/signature_attachments/';
  $env_config['sig_img_url']          = $images_url  . '/signature_attachments/';
  $env_config['prv_msg_upload_path']  = $images_path . '/pm_attachments/';
  // $env_config['uri_protocol']      = (ENV == 'dev') ? 'PATH_INFO' : 'ORIG_PATH_INFO';
  $env_config['uri_protocol']         = 'AUTO';
  $env_config['third_party_path']     = $base_path . '/' . 'assets/ee/' . $third_party .'/';



  /**
   * Custom upload directory paths
   *
   * The array keys must match the ID from exp_upload_prefs
   */
  $env_config['upload_preferences'] = array(
    1 => array(
        'name'        => 'Site Uploads',
        'server_path' => $base_path . '/' . $static_folder . '/' . 'uploads/site/',
        'url'         => $base_url  . '/' . $static_folder . '/' . 'uploads/site/'
      ),
    2 => array(
        'name'        => 'Team Images',
        'server_path' => $base_path . '/' . $static_folder . '/' . 'uploads/team/',
        'url'         => $base_url  . '/' . $static_folder . '/' . 'uploads/team/'
      ),
    3 => array(
        'name'        => 'Services Images',
        'server_path' => $base_path . '/' . $static_folder . '/' . 'uploads/services/',
        'url'         => $base_url  . '/' . $static_folder . '/' . 'uploads/services/'
      ),
    4 => array(
        'name'        => 'Portfolio Images',
        'server_path' => $base_path . '/' . $static_folder . '/' . 'uploads/portfolio/',
        'url'         => $base_url  . '/' . $static_folder . '/' . 'uploads/portfolio/'
      )
  );



  /**
   * Template settings
   *
   * Working locally we want to reference our template files.
   * In staging and production we do not use flat files (for ever-so-slightly better performance)
   * This approach requires that we synchronize templates after each deployment of template changes
   *
   * For the distributed Focus Lab, LLC Master Config file this is commented out
   * You can enable this "feature" by uncommenting the second 'save_tmpl_files' line
   */
  $env_config['save_tmpl_files']           = 'y';
  // $env_config['save_tmpl_files']             = (ENV == 'prod') ? 'n' : 'y';
  $env_config['tmpl_file_basepath']          = $base_path . '/' . $static_folder . '/ee/views/templates/';
  $env_config['hidden_template_indicator']   = '_';



  /**
   * Debugging settings
   *
   * These settings are helpful to have in one place
   * for debugging purposes
   */
  $env_config['is_system_on']                = 'y';
  $env_config['allow_extensions']            = 'y';
  $env_config['email_debug']                 = (ENV_DEBUG) ? 'y' : 'n' ;
  // If we're not in production show the profile on the front-end but not in the CP
  $env_config['show_profiler']               = ( ! ENV_DEBUG OR (isset($_GET['D']) && $_GET['D'] == 'cp')) ? 'n' : 'y';
  // Show template debugging if we're not in production
  $env_config['template_debugging']          = (ENV_DEBUG) ? 'y' : 'n';
  /**
   * Set debug to '2' if we're in dev mode, otherwise just '1'
   *
   * 0: no PHP/SQL errors shown
   * 1: Errors shown to Super Admins
   * 2: Errors shown to everyone
   */
  $env_config['debug']                       = (ENV_DEBUG) ? '2' : '1' ;

  /**
   * Logging
   */
  $env_config['log_threshold']            = (ENV_DEBUG) ? '4' : '1'; // 0|1|2|3|4
  $env_config['log_path']                 = $base_path . '/' . $ee_system . '/logs/';



  /**
   * Tracking & Performance settings
   *
   * These settings may impact what happens on certain page loads
   * and turning them off could help with performance in general
   */
  $env_config['disable_all_tracking']        = 'y'; // If set to 'y' some of the below settings are disregarded
  $env_config['enable_sql_caching']          = 'n';
  $env_config['disable_tag_caching']         = 'n';
  $env_config['enable_online_user_tracking'] = 'n';
  $env_config['dynamic_tracking_disabling']  = '500';
  $env_config['enable_hit_tracking']         = 'n';
  $env_config['enable_entry_view_tracking']  = 'n';
  $env_config['log_referrers']               = 'n';
  $env_config['gzip_output']                 = 'n';


  /**
   * 3rd Party Add-on configs
   * Load our third party addon configs
   */
  require $_SERVER['DOCUMENT_ROOT'] . '/' . $static_folder . '/ee/config/config.master.third.php';


  /**
   * Member-based settings
   */
  $env_config['profile_trigger']          = rand(0,time()); // randomize the member profile trigger word because we'll never need it


  /**
   * Other system settings
   */
  $env_config['new_version_check']        = 'n'; // no slowing my CP homepage down with this
  $env_config['daylight_savings']         = ((bool) date('I')) ? 'y' : 'n'; // Autodetect DST
  $env_config['use_category_name']        = 'y';
  $env_config['reserved_category_word']   = 'category';
  $env_config['word_separator']           = 'dash'; // dash|underscore

  /**
   * Bring in the extended system settings
   */
  require $_SERVER['DOCUMENT_ROOT'] . '/' . $static_folder . '/ee/config/config.master.extended.php';


  /**
   * Load our environment-specific config file
   * May contain override values from similar above settings
   *
   * @see config/config.local.php
   * @see config/config.dev.php
   * @see config/config.stage.php
   * @see config/config.prod.php
   */
  require $_SERVER['DOCUMENT_ROOT'] . '/' . $static_folder . '/ee/config/config.' . ENV . '.php';



  /**
   * Setup our template-level global variables
   *
   * As inspired by NSM Bootstrap Config
   * @see http://ee-garage.com/nsm-config-bootstrap
   */
  global $assign_to_config;
  if( ! isset($assign_to_config['global_vars']))
  {
    $assign_to_config['global_vars'] = array();
  }

  // Start our array with environment variables. This gives us {gv_env} and {gv_env_full} tags for our templates.
  $master_global = array(
    'gv_env'      => ENV,
    'gv_env_full' => ENV_FULL,

    // Tag parameters - Short hand tag params
    'gv_param_disable_default'  => 'disable="categories|member_data|pagination"',
    'gv_param_disable_all'    => 'disable="categories|custom_fields|member_data|pagination"',
    'gv_param_keep_cats'  => 'disable="pagination|member_data"',
    'gv_param_cache_param'    => 'cache="yes" refresh="10"',
    '-gv_param_cache_param'   => '-cache="yes" refresh="10"', // disable by adding a '-' to the front of the global

    // Date and time - Short hand date and time
    'gv_date_time'        => '%g:%i %a',
    'gv_date_short'       => '%F %d, %Y',
    'gv_date_full'        => '%F %d %Y, %g:%i %a',

    /**
     * Theme - URL to theme assets
     * Example: <script src="{gv_theme_url}/js/libs/modernizr-1.6.min.js"></script>
     */
    'gv_theme_url'        => $base_url . 'themes/site_themes/default',
  );



  /**
   * Merge arrays to form final datasets
   *
   * We've created our base config and global key->value stores
   * We've also included the environment-specific arrays now
   * Here we'll merge the arrays to create our final array dataset which
   * respects "most recent data" first if any keys are duplicated
   *
   * This is how our environment settings are "king" over any defaults
   */
  $assign_to_config['global_vars'] = array_merge($assign_to_config['global_vars'], $master_global, $env_global); // global var arrays
  $config = array_merge($config, $env_config); // config setting arrays

}
// End if (isset($config)) {}


/* End of file config.master.php */
/* Location: ./config/config.master.php */

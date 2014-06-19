<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

  /**
   * Third party config settings
   *
   * EDIT:
   *     $env_config['m62_backup']['license_number']
   *     $env_config['ce_cache_secret']
   */

  if (isset($config))
  {
    // Backup Pro
    //general
    $env_config['m62_backup']['exclude_paths'] = array();
    $env_config['m62_backup']['allowed_access_levels'] = array();
    $env_config['m62_backup']['auto_threshold'] = '0';
    $env_config['m62_backup']['backup_file_location'] = array(realpath($base_path));
    $env_config['m62_backup']['backup_store_location'] = $base_path.DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'backups'; //if from within the config directory this should map to the backup_proish/backups directory
    $env_config['m62_backup']['license_number'] = 'BUY A LICENSE';
    $env_config['m62_backup']['max_db_backups'] = 7;
    $env_config['m62_backup']['max_file_backups'] = 7;

    //setup cron
    $env_config['m62_backup']['cron_notify_emails'] = array(''); //change these
    $env_config['m62_backup']['cron_attach_backups'] = '0';
    $env_config['m62_backup']['cron_attach_threshold'] = '0';

    //setup FTP
    // $env_config['m62_backup']['ftp_hostname'] = '';
    // $env_config['m62_backup']['ftp_username'] = '';
    // $env_config['m62_backup']['ftp_password'] = '0';
    // $env_config['m62_backup']['ftp_port'] = '21';
    // $env_config['m62_backup']['ftp_passive'] = '0';
    // $env_config['m62_backup']['ftp_store_location'] = '';

    //setup S3
    // $env_config['m62_backup']['s3_access_key'] = '';
    // $env_config['m62_backup']['s3_secret_key'] = '';
    // $env_config['m62_backup']['s3_bucket'] = '';

    //setup CF
    // $env_config['m62_backup']['cf_username'] = '';
    // $env_config['m62_backup']['cf_api'] = '';
    // $env_config['m62_backup']['cf_bucket'] = '';
    // $env_config['m62_backup']['cf_location'] = 'us';


    // DevDemon Updater
    $env_config['updater']['file_transfer_method'] = 'local'; // local, ftp, sftp

    // $env_config['updater']['ftp']['hostname'] = '';
    // $env_config['updater']['ftp']['username'] = '';
    // $env_config['updater']['ftp']['password'] = '';
    // $env_config['updater']['ftp']['port'] = '21';
    // $env_config['updater']['ftp']['passive'] = 'yes'; // yes, no
    // $env_config['updater']['ftp']['ssl'] = 'no'; // yes, no

    // $env_config['updater']['sftp']['hostname'] = '';
    // $env_config['updater']['sftp']['username'] = '';
    // $env_config['updater']['sftp']['password'] = '';
    // $env_config['updater']['sftp']['port'] = '22';

    $env_config['updater']['path_map']['root'] = $base_path . '/'; // Document Root
    $env_config['updater']['path_map']['backup'] = $base_path . '/../backups/updater/'; // Backup Dir
    $env_config['updater']['path_map']['system'] = $base_path . '/' . $ee_system . '/'; // System Dir
    $env_config['updater']['path_map']['system_third_party'] = $base_path . '/' . $third_party . '/'; // Third Party dir system dir
    $env_config['updater']['path_map']['themes'] = $base_path . '/themes/'; // Themes dir
    $env_config['updater']['path_map']['themes_third_party'] = $base_path . '/themes/third_party/'; // Third Party dir in themes dir


    // Stash
    $env_config['stash_file_basepath'] = $base_path . '/' . $static_folder .'/ee/views/stash/';
    $env_config['stash_file_sync'] = TRUE; // set to FALSE for production
    // $env_config['stash_file_sync'] = (ENV == 'prod') ? FALSE : TRUE; // set to FALSE for production
    $env_config['stash_file_extensions'] = array('html', 'md', 'css', 'js', 'rss', 'xml');
    $env_config['stash_static_basepath'] = $cache_path . '/stash/';
    $env_config['stash_static_url'] = $cache_url . '/stash/'; // should be a relative url
    $env_config['stash_static_cache_enabled'] = FALSE; // set to TRUE to enable static caching
    $env_config['stash_cookie'] = 'stashid'; // the stash cookie name
    $env_config['stash_cookie_expire'] = 0; // seconds - 0 means expire at end of session
    $env_config['stash_default_scope'] = 'local'; // default variable scope if not specified
    $env_config['stash_limit_bots'] = TRUE; // stop database writes by bots to reduce load on busy sites
    $env_config['stash_bots'] = array('bot', 'crawl', 'spider', 'archive', 'search', 'java', 'yahoo', 'teoma');


	// Low Variables
    $env_config['low_variables_save_as_files'] = 'y';
    $env_config['low_variables_file_path']     = $base_path . '/'. $static_folder . '/ee/views/low_variables/';


    // Devot:ee Monitor
    // $config['devotee_monitor_ignored_addons'] = array('addon_package_name', 'another_addon');


    // CE Image
    $env_config['ce_image_cache_dir'] = '/' . $cache_folder . '/img/local/';
    $env_config['ce_image_remote_dir'] = '/' . $cache_folder . '/img/remote/';
    $env_config['ce_image_memory_limit'] = 64;
    $env_config['ce_image_remote_cache_time'] = 1440;
    $env_config['ce_image_quality'] = 100;
    $env_config['ce_image_disable_xss_check'] = 'yes';
    $env_config['ce_image_add_dims'] = 'no';
    $env_config['ce_image_unique'] = 'filename';
    $env_config['ce_image_document_root'] = '';
    $env_config['ce_image_image_permissions'] = 0644;
    $env_config['ce_image_dir_permissions'] = 0755;
    $env_config['ce_image_encode_urls'] = 'yes';

    //AWS
    // $env_config['ce_image_aws_key'] = '';
    // $env_config['ce_image_aws_secret_key'] = '';
    // $env_config['ce_image_bucket'] = '';
    // $env_config['ce_image_aws_request_headers'] = array();
    // $env_config['ce_image_aws_request_headers']['Cache-Control'] = 'max-age=' . (30 * 24 * 60 * 60);
    // $env_config['ce_image_aws_request_headers']['Expires'] = gmdate("D, d M Y H:i:s T", strtotime('+1 month') );
    // $env_config['ce_image_aws_storage_class'] = 'STANDARD';

    // Cloudfront Subdomain
    // $env_config['ce_image_aws_cloudfront_url'] = '';


    // CP Analytics
    $env_config['cp_analytics_cache_path'] = $cache_path . '/ga/';
    $env_config['cp_analytics_cache_url'] = $cache_url . '/ga/';

  } // /END if (isset($config))

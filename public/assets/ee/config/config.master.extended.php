<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

  /**
   * ===========================================================================
   * Extended config overrides
   * Adding additional overrides here to keep cruft out of master files.
   * To get a list of all the available configuration variables,
   * put print_r($this->EE->config->config); on a PHP-enabled template.
   * ===========================================================================
   *
   * EDIT:
   *   $env_config['site_name']                = 'Every Day Stash';
   *   $env_config['site_label']               = 'Every Day Stash';
   *   $env_config['site_description']         = 'CLIDESC';
   *   $env_config['site_short_name']          = 'eds';
   *   $env_config['encryption_key']
   */

  if (isset($config))
  {
    /**
     * Template settings
     * =========================================================================
     */
    $env_config['strict_urls']                 = 'y';
    $env_config['site_404']                    = 'site/404';
    $env_config['save_tmpl_revisions']         = 'n';
    $env_config['max_tmpl_revisions']          = '5';
    $env_config['allow_extensions']            = 'y';



  /**
   * Other system settings
   * ===========================================================================
   */
  $env_config['site_name']                = 'Every Day Stash';
  $env_config['site_label']               = 'Every Day Stash';
  $env_config['site_description']         = 'Sample ExpressionEngine Website to demonstrate Stash concepts.';
  $env_config['site_short_name']          = 'eds';
  $env_config['site_pages']               = '';

  // General Configuration settings
  $env_config['multiple_sites_enabled']   = 'n'; // y|n
  $env_config['is_site_on']               = 'y'; // y|n
  $env_config['is_system_on']             = 'y'; // y|n
  $env_config['license_number']           = '';
  $env_config['cp_theme']                 = 'default'; // default|corporate|nerdery|sassy_cp
  $env_config['deft_lang']                = 'english';
  $env_config['xml_lang']                 = 'en';
  // $env_config['max_caches']            = '150';

  // Global Channel Preferences
  $env_config['auto_assign_cat_parents']  = 'y'; // y|n
  $env_config['new_posts_clear_caches']   = 'y'; // y|n
  $env_config['enable_sql_caching']       = 'n'; // y|n

  // Localization Settings
  $env_config['server_timezone']          = 'UM8'; // UM10|UM9|UM8|UM7|UM6|UM5
  $env_config['server_offset']            = FALSE;
  $env_config['time_format']              = 'us'; // us|eu
  $env_config['honor_entry_dst']          = date('I') ? 'y' : 'n'; // Autodetect DST; y|n

  // Email Configuration
  $env_config['webmaster_email']          = '';
  $env_config['webmaster_name']           = '';
  $env_config['email_charset']            = 'utf-8';
  $env_config['mail_protocol']            = 'mail'; // mail|sendmail|smtp
  $env_config['smtp_server']              = '';
  $env_config['smtp_port']                = '';
  $env_config['smtp_username']            = '';
  $env_config['smtp_password']            = '';
  $env_config['email_batchmode']          = 'n'; // y|n
  $env_config['email_batch_size']         = '';
  $env_config['mail_format']              = 'plain'; // plain|html
  $env_config['word_wrap']                = 'y'; // y|n
  $env_config['email_console_timelock']   = '5';
  $env_config['log_email_console_msgs']   = 'n'; // y|n
  $env_config['email_module_captchas']    = 'y'; // y|n

  // Database Settings
  $env_config['pconnect']                 = 'n'; // y|n
  $env_config['enable_db_caching']        = 'n'; // y|n

  // Output and Debugging Preferences
  $env_config['send_headers']             = 'y'; // y|n
  $env_config['force_query_string']       = 'n'; // y|n
  $env_config['redirect_method']          = 'redirect'; // redirect|refresh

  // Image Resizing Preferences
  $env_config['image_resize_protocol']     = 'gd2'; // gd|gd2|imagemagick|netpbm
  $env_config['image_library_path']       = '';
  $env_config['thumbnail_prefix']         = 'tn';

  // Emoticon Preferences
  $env_config['enable_emoticons']         = 'n'; // y|n

  // Search Term Log Configuration
  $env_config['enable_search_log']        = 'n'; // y|n
  $env_config['max_logged_searches']      = '10';

  // Security and Session Preferences
  $env_config['admin_session_type']       = 'c'; // cs|c|s
  $env_config['user_session_type']        = 'c'; // cs|c|s
  $env_config['cp_session_ttl']           = (60 * 60 * 24 * 365);
  $env_config['secure_forms']             = 'y'; // y|n
  $env_config['deny_duplicate_data']      = 'y'; // y|n
  $env_config['redirect_submitted_links'] = 'y'; // y|n
  $env_config['allow_username_change']    = 'n'; // y|n
  $env_config['allow_multi_logins']       = 'y'; // y|n
  $env_config['require_ip_for_login']     = 'y'; // y|n
  $env_config['require_ip_for_posting']   = 'y'; // y|n
  $env_config['xss_clean_uploads']        = 'y'; // y|n
  $env_config['password_lockout']         = 'y'; // y|n
  $env_config['password_lockout_interval'] = '1'; // in minutes
  $env_config['require_secure_passwords'] = 'n'; // y|n
  $env_config['allow_dictionary_pw']      = 'y'; // y|n
  $env_config['name_of_dictionary_file']  = '';
  $env_config['un_min_len']               = '6';
  $env_config['pw_min_len']               = '6';

  // Cookie Settings
  $env_config['cookie_domain']            = '.' . preg_replace('#^www\.(.+\.)#i', '$1', $_SERVER['HTTP_HOST']);
  $env_config['cookie_path']              = '';
  $env_config['cookie_prefix']            = ENV . '_';

  // Word Censoring
  $env_config['enable_censoring']         = 'n'; // y|n
  $env_config['censor_replacement']       = '';
  $env_config['censored_words']           = '';

  // Tracking Preferences
  $env_config['max_referrers']            = '500';

  // CAPTCHA Preferences
  $env_config['captcha_font']             = 'y'; // y|n
  $env_config['captcha_rand']             = 'y'; // y|n
  $env_config['captcha_require_members']  = 'n'; // y|n

  // Throttling Configuration
  $env_config['enable_throttling']        = 'n'; // y|n
  $env_config['banish_masked_ips']        = 'y'; // y|n
  $env_config['max_page_loads']           = '10';
  $env_config['time_interval']            = '8';
  $env_config['lockout_time']             = '30';
  $env_config['banishment_type']          = 'message'; // 404|redirect|message
  $env_config['banishment_url']           = 'http://www.google.com/';
  $env_config['banishment_message']       = 'You have exceeded the allowed page load frequency.';

  // Membership Preferences General Configuration
  $env_config['allow_member_registration'] = 'n'; // y|n
  $env_config['req_mbr_activation']       = 'manual'; // none|email|manual
  $env_config['require_terms_of_service'] = 'n'; // y|n
  $env_config['allow_member_localization'] = 'y'; // y|n
  $env_config['use_membership_captcha']   = 'y'; // y|n
  $env_config['default_member_group']     = '5';
  $env_config['member_theme']             = 'default';

  // Member List Preferences
  $env_config['memberlist_order_by']      = 'screen_name'; // total_posts|screen_name|total_comments|total_entries|join_date
  $env_config['memberlist_sort_order']    = 'desc'; // desc|asc
  $env_config['memberlist_row_limit']     = '20';

  // Notification Preferences
  $env_config['new_member_notification']  = 'n'; // y|n
  $env_config['mbr_notification_emails']  = '';

  // Private Messaging Preferences
  $env_config['prv_msg_max_chars']        = '6000';
  $env_config['prv_msg_html_format']      = 'safe'; // safe|none|all
  $env_config['prv_msg_auto_links']       = 'y'; // y|n
  $env_config['prv_msg_max_attachments']  = '3';
  $env_config['prv_msg_attach_maxsize']   = '250';
  $env_config['prv_msg_attach_total']     = '100';

  // Avatar Preferences
  $env_config['enable_avatars']           = 'n'; // y|n
  $env_config['allow_avatar_uploads']     = 'n'; // y|n
  $env_config['avatar_max_width']         = '100';
  $env_config['avatar_max_height']        = '100';
  $env_config['avatar_max_kb']            = '100';

  // Member Photo Preferences
  $env_config['enable_photos']            = 'n'; // y|n
  $env_config['photo_max_width']          = '200';
  $env_config['photo_max_height']         = '200';
  $env_config['photo_max_kb']             = '200';

  // Signature Preferences
  $env_config['allow_signatures']         = 'n'; // y|n
  $env_config['sig_maxlength']            = '500';
  $env_config['sig_allow_img_hotlink']    = 'n'; // y|n
  $env_config['sig_allow_img_upload']     = 'n'; // y|n
  $env_config['sig_img_max_height']       = '80';
  $env_config['sig_img_max_width']        = '480';
  $env_config['sig_img_max_kb']           = '30';

  // Misc Settings
  $env_config['allow_registration']       = 'n'; // y|n
  $env_config['auto_convert_high_ascii']  = 'y'; // y|n
  $env_config['ban_action']               = 'restrict';
  $env_config['ban_destination']          = 'http://www.google.com/';
  $env_config['ban_message']              = 'This site is currently unavailable';
  $env_config['channel_nomenclature']     = 'channel';
  $env_config['default_site_dst']         = date('I') ? 'y' : 'n'; // Autodetect DST
  $env_config['default_site_timezone']    = 'UM8'; // UM10|UM9|UM8|UM7|UM6|UM5
  $env_config['include_seconds']          = 'n'; // y|n
  $env_config['log_search_terms']         = 'n'; // y|n
  $env_config['mailinglist_enabled']      = 'n'; // y|n
  $env_config['mailinglist_notify']       = 'n'; // y|n
  $env_config['mailinglist_notify_emails'] = 'n'; // y|n
  $env_config['output_charset']           = 'utf-8';
  $env_config['proxy_ips']                = '';
  $env_config['recount_batch_total']      = '1000';

  // Encryption / Session key
  $env_config['encryption_key'] = 'dn$8aZ7^4#,6n*M32v=;XoY46{.4BW2>'; // Must be 32 random characters

  } // /END if (isset($config))

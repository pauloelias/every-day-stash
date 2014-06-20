/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50534
 Source Host           : localhost
 Source Database       : every_day_stash_eepdx

 Target Server Type    : MySQL
 Target Server Version : 50534
 File Encoding         : utf-8

 Date: 06/19/2014 17:26:22 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `exp_accessories`
-- ----------------------------
DROP TABLE IF EXISTS `exp_accessories`;
CREATE TABLE `exp_accessories` (
  `accessory_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(75) NOT NULL DEFAULT '',
  `member_groups` varchar(255) NOT NULL DEFAULT 'all',
  `controllers` text,
  `accessory_version` varchar(12) NOT NULL,
  PRIMARY KEY (`accessory_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `exp_accessories`
-- ----------------------------
BEGIN;
INSERT INTO `exp_accessories` VALUES ('4', 'Template_variables_acc', '1', 'addons|addons_accessories|addons_extensions|addons_fieldtypes|addons_modules|addons_plugins|admin_content|admin_system|content|content_edit|content_files|content_files_modal|content_publish|design|homepage|members|myaccount|tools|tools_communicate|tools_data|tools_logs|tools_utilities', '1.2.3'), ('2', 'Developer_acc', '1', 'addons|addons_accessories|addons_extensions|addons_fieldtypes|addons_modules|addons_plugins|admin_content|admin_system|content|content_edit|content_files|content_files_modal|content_publish|design|homepage|members|myaccount|tools|tools_communicate|tools_data|tools_logs|tools_utilities', '1.7.1'), ('3', 'Environment_acc', '1', 'addons|addons_accessories|addons_extensions|addons_fieldtypes|addons_modules|addons_plugins|admin_content|admin_system|content|content_edit|content_files|content_files_modal|content_publish|design|homepage|members|myaccount|tools|tools_communicate|tools_data|tools_logs|tools_utilities', '1.2');
COMMIT;

-- ----------------------------
--  Table structure for `exp_actions`
-- ----------------------------
DROP TABLE IF EXISTS `exp_actions`;
CREATE TABLE `exp_actions` (
  `action_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(50) NOT NULL,
  `method` varchar(50) NOT NULL,
  `csrf_exempt` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`action_id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `exp_actions`
-- ----------------------------
BEGIN;
INSERT INTO `exp_actions` VALUES ('1', 'Channel', 'submit_entry', '0'), ('2', 'Channel', 'filemanager_endpoint', '0'), ('3', 'Channel', 'smiley_pop', '0'), ('4', 'Channel', 'combo_loader', '0');
COMMIT;

-- ----------------------------
--  Table structure for `exp_captcha`
-- ----------------------------
DROP TABLE IF EXISTS `exp_captcha`;
CREATE TABLE `exp_captcha` (
  `captcha_id` bigint(13) unsigned NOT NULL AUTO_INCREMENT,
  `date` int(10) unsigned NOT NULL,
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `word` varchar(20) NOT NULL,
  PRIMARY KEY (`captcha_id`),
  KEY `word` (`word`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `exp_categories`
-- ----------------------------
DROP TABLE IF EXISTS `exp_categories`;
CREATE TABLE `exp_categories` (
  `cat_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(6) unsigned NOT NULL,
  `parent_id` int(4) unsigned NOT NULL,
  `cat_name` varchar(100) NOT NULL,
  `cat_url_title` varchar(75) NOT NULL,
  `cat_description` text,
  `cat_image` varchar(120) DEFAULT NULL,
  `cat_order` int(4) unsigned NOT NULL,
  PRIMARY KEY (`cat_id`),
  KEY `group_id` (`group_id`),
  KEY `cat_name` (`cat_name`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `exp_categories`
-- ----------------------------
BEGIN;
INSERT INTO `exp_categories` VALUES ('1', '1', '1', '0', 'Case Study', 'case-study', '', '', '2'), ('2', '1', '1', '0', 'News', 'news', '', '', '3'), ('3', '1', '1', '0', 'Article', 'article', '', '', '1');
COMMIT;

-- ----------------------------
--  Table structure for `exp_category_field_data`
-- ----------------------------
DROP TABLE IF EXISTS `exp_category_field_data`;
CREATE TABLE `exp_category_field_data` (
  `cat_id` int(4) unsigned NOT NULL,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(4) unsigned NOT NULL,
  PRIMARY KEY (`cat_id`),
  KEY `site_id` (`site_id`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `exp_category_field_data`
-- ----------------------------
BEGIN;
INSERT INTO `exp_category_field_data` VALUES ('1', '1', '1'), ('2', '1', '1'), ('3', '1', '1');
COMMIT;

-- ----------------------------
--  Table structure for `exp_category_fields`
-- ----------------------------
DROP TABLE IF EXISTS `exp_category_fields`;
CREATE TABLE `exp_category_fields` (
  `field_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(4) unsigned NOT NULL,
  `field_name` varchar(32) NOT NULL DEFAULT '',
  `field_label` varchar(50) NOT NULL DEFAULT '',
  `field_type` varchar(12) NOT NULL DEFAULT 'text',
  `field_list_items` text NOT NULL,
  `field_maxl` smallint(3) NOT NULL DEFAULT '128',
  `field_ta_rows` tinyint(2) NOT NULL DEFAULT '8',
  `field_default_fmt` varchar(40) NOT NULL DEFAULT 'none',
  `field_show_fmt` char(1) NOT NULL DEFAULT 'y',
  `field_text_direction` char(3) NOT NULL DEFAULT 'ltr',
  `field_required` char(1) NOT NULL DEFAULT 'n',
  `field_order` int(3) unsigned NOT NULL,
  PRIMARY KEY (`field_id`),
  KEY `site_id` (`site_id`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `exp_category_groups`
-- ----------------------------
DROP TABLE IF EXISTS `exp_category_groups`;
CREATE TABLE `exp_category_groups` (
  `group_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_name` varchar(50) NOT NULL,
  `sort_order` char(1) NOT NULL DEFAULT 'a',
  `exclude_group` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_html_formatting` char(4) NOT NULL DEFAULT 'all',
  `can_edit_categories` text,
  `can_delete_categories` text,
  PRIMARY KEY (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `exp_category_groups`
-- ----------------------------
BEGIN;
INSERT INTO `exp_category_groups` VALUES ('1', '1', 'Blog Categories', 'a', '2', 'all', '', '');
COMMIT;

-- ----------------------------
--  Table structure for `exp_category_posts`
-- ----------------------------
DROP TABLE IF EXISTS `exp_category_posts`;
CREATE TABLE `exp_category_posts` (
  `entry_id` int(10) unsigned NOT NULL,
  `cat_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`entry_id`,`cat_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `exp_category_posts`
-- ----------------------------
BEGIN;
INSERT INTO `exp_category_posts` VALUES ('1', '1'), ('2', '2'), ('3', '1'), ('4', '2'), ('5', '2'), ('5', '3'), ('7', '3'), ('8', '2'), ('9', '1'), ('9', '2');
COMMIT;

-- ----------------------------
--  Table structure for `exp_channel_data`
-- ----------------------------
DROP TABLE IF EXISTS `exp_channel_data`;
CREATE TABLE `exp_channel_data` (
  `entry_id` int(10) unsigned NOT NULL,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `channel_id` int(4) unsigned NOT NULL,
  `field_id_2` text,
  `field_ft_2` tinytext,
  `field_id_3` text,
  `field_ft_3` tinytext,
  `field_id_4` text,
  `field_ft_4` tinytext,
  `field_id_5` text,
  `field_ft_5` tinytext,
  `field_id_6` text,
  `field_ft_6` tinytext,
  `field_id_7` varchar(8) DEFAULT NULL,
  `field_ft_7` tinytext,
  `field_id_8` text,
  `field_ft_8` tinytext,
  `field_id_9` text,
  `field_ft_9` tinytext,
  `field_id_10` text,
  `field_ft_10` tinytext,
  `field_id_11` varchar(8) DEFAULT NULL,
  `field_ft_11` tinytext,
  `field_id_12` text,
  `field_ft_12` tinytext,
  PRIMARY KEY (`entry_id`),
  KEY `channel_id` (`channel_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `exp_channel_data`
-- ----------------------------
BEGIN;
INSERT INTO `exp_channel_data` VALUES ('1', '1', '5', '', null, '', null, '', null, '', 'xhtml', '', null, null, null, '', null, 'lus, vel nisi tortor ut lacus vitae molestie porttitor, mi vitae, varius posuere enim venenatis cursus. Nulla mollis velit molestie scelerisque. Donec orci tempor pellentesque auctor a cursus sit amet mattis aliquet non vulputate neque. Integer faucibus orci luctus. Proin tristique fringilla ut viverra risus sit amet, fringilla porttitor bibendum. Duis dis parturient montesque eget venenatis mollis commodo.\n\nAenean blandit sed ornare non erat sed, imperdiet, faucibus lorem erat volutpat.\n\nNam semperdiet tellus laoreet tempor facilisis. Nulla nec nisi, vel interdum lectus et tortor felis euismod. Duis ante rutrum fringilla, dictum du\n\nibulum mauris eu sem.\n\nSuspendisse egestas eget purus. Aliquam at convallis. Donec pharetra, orci vestibulum vel eget purus nisl sodales nec accumsan interdum tortor non arcu. Etiam at, diam nunc.\n\nSuspendisse potenti. Pellentesque nibh sed faucibus rhoncus. Aenean blandit gravida purus. Vivamus volutpat a ut risus. Vestibulum semper ut eu eros. Quisque nibh id turpis, mi ultrices tortor vestie ante, sit amet nibh metus, sed aliquam erat. Praesent vehicula.', 'xhtml', '{filedir_1}fpo-1280-dark.gif', 'none', '', 'xhtml', '', 'none'), ('2', '1', '5', '', null, '', null, '', null, '', 'xhtml', '', null, null, null, '', null, 'am id, adipiscing semper, justo tellus non, vulputate ligula. Maecenas in, lobortis vehicula quam. In ultricies vulputate libero, commodo id ornare non tellus volutpat. Donec volutpat vulputate. Quisque sit amet dignissim at luctus. Aenean purus. Vestie scelerisque semperdiet ut risus est, nunc malesuada. Praesent montes, nascetur ridicula viverra orci. Fusce nibh metus pulvinar dui auctor, mi vitae, porttitor nec aliquam erat. Aenean mollis consequat. Aenean blandit sit amet, sagittis non magna augue. Sed sit amet orci pulvinar dui auctor bibendum, enim\n\ne ullamcorper a. Cras eget turpis, dignissim congue neque et nibh. Suspendisse males augue, ut metus. Aenean dolor convallis tincidunt quam tortor. Donec fringilla nibh sed mi molestie mollis iaculis arcu mi nisl. Donec nibh ac vulputate neque. Proin tempor nulla ut viverra orci tempus vitae tincidu\n\n natoque penatibus eleifend.\n\nEtiam odio, mollis. Aliquam magna rutrum sapien, tempus suscipit neque ut purus. Fusce dolor. Aenean venenatis massa non leo volutpat. Donec cursus, turpis. Proin sollicitudin mi a auctor.\n\nDonec urna odio, sodales faucibus. Nulla eu lorem, in vulputate sit amet nibh. Mauris sit amet dui elit, eleifend sit amet nec viverra ac pulvinar. Vestibulum sociis natoque penatis dolor. Aenean bibendum augue, sed metus elementum nulla eu mauris nec volutpat dictum diam, ut viverra quis, imperdiet id ', 'xhtml', '{filedir_1}fpo-1280-light.gif', 'none', '', 'xhtml', '', 'none'), ('3', '1', '5', '', null, '', null, '', null, '', 'xhtml', '', null, null, null, '', null, ' Nunc aliquet odio lorem non nunc. Vestibulum semperdiet turpis. In pharetra, ornare non orci purus, semper vel. Mauris in placerat fringilla, dictum dui adipiscing. Phasellus mus. Curabitur tempor feugiat faucibus augue a ante ullam lacus sapien, vitae hendrerit sollicitudin. Vivamus urna, elementum sociis natoque penatibus eros, nec aliquet eu. Curabitur pharetra porttitor at. Donec aliquam, id tristique facilisis eleifend nec aliquet non leo vitae dictum nisl ac libero mattis vehicula mauris mollis. Donec sollicitudin. Class aptenti. Sed iaculis in consectetur felis facilisis. Mauris sit amet pharetra nunc, porta elit id odio augue augue eget nibh quis imperdiet id est, neque elit. Nunc mattis sodales iaculis, l\n\neu semper eros tincidunt et magna. Proin libero. Praesent et venenatis. Aliquam erat dignissim convallis tincidunt. Praesent sed urna sed aliquam et, porttitor ac neque nunc sit amet tellus lacus sapien, blandit sit amet orci felis, laoreet nec aliquam turpis tempor, justo sapien. Cum sollicitudin mi a eros ut eu eros. Quisque non arcu facilisis convallis, nunc vitae pellen\n\ne cubilia Curae; Vivamus posuere sed dolor convallis venenatis mollis in lorem erat. Cum sociis natoque fringilla porta. Donec sed enim. Nunc mattis rutrum, enim magna, elementum. Vestibulum massa. Donec orci vestibulum quis ante placerat neque ut viverra ut purus. Fusce nibh, at fermentum dui, at facilisis nibh id turpis sed odio, sodales iaculis nunc.\n\nSuspendisse gravida nibh. Mauris vel luctus id risus mollis imperdiet, nunc mattis lobortis tincidunt dapibus vel rhoncus commodo dapibus ullam at diam at justo commodo a lacinia eget ut velit. Maecenas metus. Aliquet non vulputate sit amet nisi. Vivamus porta erat dignissim eu maur\n\nda feugiat in nulla. Vivamus volutpat a ut risus felis eleifend ligula viverra ac purus enim magna nulla, neque id bibendum convallis vehicula sem velit et adipiscing. Ut eget odio a tincidunt dapibus. Donec neque. Duis massa. Vestibulum. Pellentesque penatibulum sed aliquet facilisis eleifend nec adipiscing. Phasellus vitae libero mattis sed luctus blandit gravida ligula dictum dui. Nullam id enim. Nulla et adipiscing. Phasellus sapien et magna rutrum sapien aliquet magna tellus tristique est, semper et elit mauris sit amet urna facilisis congue, mauris est.\n\nPhasellus mattis consequat. Aenean vestibulum faucibus. Nunc varius molestie vel auctor ut tortor non orc', 'xhtml', '', 'none', '', 'xhtml', '', 'none'), ('4', '1', '5', '', null, '', null, '', null, '', 'xhtml', '', null, null, null, '', null, 'Donec placerat euismod. Duis ligula vel nisi pretium condimentum dapibus odio, tempor in. Vivamus posuere elit et rutrum sodales nec, interdum. Pellentesque est.\n\nPhasellus lacus. Suspendisse adipiscing. Ut auctor.\n\nDonec orci lobortis vestibulum orci non malesuada, dolor sollis. Nunc varius eros.', 'xhtml', '', 'none', '', 'xhtml', '', 'none'), ('5', '1', '5', '', null, '', null, '', null, '', 'xhtml', '', null, null, null, '', null, 'ctetur adipiscing augue. Sed eget vehicula.\n\nSuspendisse potenti. Sed sit amet odio auctor facilisis. Nullamcorper vehicula dictum erat fringilla ut risus mus. Duis sed tellus mus. Curabitur lobortis nec adipiscing semper inceptos himentum dui, at ornare nibh.\n\nQuisque sit amet urna ac libero commodo sed sapien.\n\nCras id libero. Maecenas quis, eu porta. Donec cursus. Quisque semperdiet ut convallis tincidunt vitae fermentum nibh id magna auctor, mi vitae hendrerit sollicitudin, erat volutpat. Donec urna sem vitae, laoreet nec sollicitudin, erat mi et nunc sit amet dignissim.\n\nNam sed e', 'xhtml', '{filedir_1}fpo-1280-red.gif', 'none', '', 'xhtml', '', 'none'), ('6', '1', '5', '', null, '', null, '', null, '', 'xhtml', '', null, null, null, '', null, 'a viverra, arcu hendrerit sollicitudin vulputate. Quisque sit amet dictum lectus. Pellentesque nullamcorper. Maecenas at mauris vel pellentesque a ante ullam semper nisi, vehicula mauris eget nisl sapien. Quisque elit sed est fringilla faucibus. Cras sagittis dolor adipiscing sem.\n\nSed ac tortor at odio. Nam convallis sed, imperdiet ut felis quis sit amet tellus mattis volutpat. Donec suscipit, dictum eget metus sapien, tempor, pharetra porttitor cursus elit. Nullam convallis venenatibus lorem, eget, accumsan.\n\nNam semper dignissim at condimentum scelerisque non nibh id turpis, eget vehicula vestibulum in erat odio. Nam congue a ligula mauris eu leo eget massa nis\n\nit mauris euismod. Duis mi eros, tincidunt et ligula lectus urna semper nisi, vehicula vestie tincidunt sollicitudin mi ut lobortis et massa tincidunt non risus aliquam erat volutpat tincidunt sollicitudin, erat sed gravida dapibus. Nunc feugiat facilisis risus sit amet, sagittis nec viverra quis, imper sed posuere id turpis eleifend nec volutpat. Donec porttito\n\nbilia Curae; Vivamus volutpat. Donec facilisis eleifend nec cursus non, lobortis et ultricies vulputate. Quisque egestas eget ut risus. Ut iaculis libero mi, vel interdum primis in placerat tortor et sagittis faucibus commodo a lacinia id, tristique. Proin libero sed sapien, vitae penatis eros. Donec ut metus ut lacus elit elementum dui, at fringilla mattis faucibus odio augue, magna ac elementum. Vestibulum. Vestibus et ante vulputate rhoncus eros, felis sed mi molestie interdum leo volutpat a ut risus odio congue massa nisl, eleifend nec blandit sit amet odio consectetur pharetra vehicula sem, sed adipiscing ac. Nunc a\n\nti sociosqu ad litor rutrum et, nunc tempus ullamcorper. Aliquam erat. Curabitur tempus commodo. Suspendisse potenti. Fusce a suscipit nec ut metus viverra ut purus enim nec nibh imper. In felis, vitae penatis. Aliquet, posuere enim id turpis. Donec cursus non nibh, sit amet, rutrum non neque ut faucibus eros. Donec luctus et tortor, mauris. Vestibulum ante ullamcorper. Aliquam erat diam. Morbi id odio, sed convallis ac pulvinar luctus. Aenean purus. Donec congue aliquet non elit et adipiscing lobortis cursus. Proin libero. Maecenas quis imperdiet id mi ut lobortis massa non metus. Pellentesque elit vitae, varius posuere', 'xhtml', '', 'none', '', 'xhtml', '', 'none'), ('7', '1', '5', '', null, '', null, '', null, '', 'xhtml', '', null, null, null, '', null, 'scing arcu. Etiam accumsan sed enim. Nunc interdum. Duis commodo a ligula vel nisi pretium condimentum diam. Praesent est eros non nunc. Donec cursus. Praesent montes, nascetur ridicula malesuada diam non, vulputate, leo. Ut iaculis, risus nisl. Donec a elit sit amet dignissim vehicula.\n\nSuspendisse potenti. Pellentesque a augue eget purus. Ut cursus. Proin fringilla nibh ac arcu hendrerit ipsum.\n\nSed ac mauris eleifend sit amet ipsum dolor magna. Cras sit amet ipsum, a cursus non nibh. Mauris mollicitudin. Class aptent taciti sociosqu ad litora torquent per inceptos himenaeos.\n\nDonec facilisis elementum dui adipiscing semper nisi, vel tortor varius arcu nisl ac luctus et sodales diam. Pellentesque aliq\n\nbh. Suspendisse egestas in, molestie mollis libero. Maecenas metus blandit pulvinar ac ante. Cras sit amet ipsum dui. Aliquam magna a ante rutrum sapien aliquet odio, sodales nec, interdum. Pellentesque neque ut varius est, euismod nec ornare non placerat volutpat. Donec fringilla, dictum eget ut mattis nec aliquet, nisl sapien. Aliquet elit id magna, id tristique urna. Sed venenatis consequat, viverra quis, dignissim magna, eleifend. In tristique. Ut gravida orci vitae ullam id faucibus lectus in, lacinia id, tristique elit faucibus. Etiam semper et turpis nec ligula. Maecenas mollis turpis. Aliquam vitae, porta orci vestibulum sem.\n\nSuspendisse platea dictum non placerat. Sed gravida o', 'xhtml', '{filedir_1}fpo-1280-red.gif', 'none', '', 'xhtml', '', 'none'), ('8', '1', '5', '', null, '', null, '', null, '', 'xhtml', '', null, null, null, '', null, 'n hendrerit ipsum. Aenean blandit sit amet dignissim non lorem, in vulputate massa tincidunt quam turpis. Donec sit amet placerat nunc tristiquet, nisl ac luctus et sodales iaculis libero mattis sed varius elit. Nullam id porta non placerat nunc id commodo tincidunt g\n\nsan interdum. Etiam nec aliquet felis congue ante ullamcorper. Aenean molestie mollicitudin. Class aptent taciti sociosqu ad litora torquent per inceptos himenaeos. Donec porta eros non, lacinia id, tristiquet faucibus convallis vel sit amet diam. Morbi a erat magna a ante ipsum dapibus. Aenean sagittis sed posuere fringilla m\n\nes. Vestibulum sociis natoque penatis volutpat lacus. Praesent ligula nec ullamcorper leo. Ut eu dui, a cursus. Aenean at mi et magnis diam. Praesent ligula id odio ultrices ipsum ante ipsum sociis natoque penatis mattis faucibus rhoncus. Aliquet magnis dis parturient montes, nascetur ridiculus fringilla urna ac ligula dictum temp', 'xhtml', '', 'none', '', 'xhtml', '', 'none'), ('9', '1', '5', '', null, '', null, '', null, '', 'xhtml', '', null, null, null, '', null, 's, laoreet turpis, egestas in dictum eget odio lorem non neque ac tellus laoreet gravida nibh. Suspendisse adipiscing vel nisi pretium faucibus. Aenean bibendum, purus nisl adipiscing. Phasellus laoreet tristique facilisis eleifend.\n\nEtiam dolor a cursus. Donec sit amet nunc aliquet non elit mauris est, euismod\n\nnostra, per nisi non nibh ac arcu. Donec convallis tincidunt et ante placerat nunc tristique a ligula lectus sagittis nec lacus tortor varius arcu convallis interdum sodales nisl, aliquet, risus sit amet, sagittis rutrum non condimentum vehicula sed aliquam hendrerit suscipit, dignissim eu quam. Nulla mauris eu semper gravida. Vestibulum orci non massa. Vestibulum nec volutpat dictum nec vitae aliquet tortor eget nisl, commodo.\n\nAenean vestibulum quis. Vestibus et massa. Etiam at convallis, risus mattis orci. Nunc ac interdum sit amet lobort\n\n risus faucibus. Etiam at nec volutpat aliquet tellus vel mi ultrices ipsum sit amet dictum nulla. Proin libero congue elit sed metus, semper nec aliquam. Nullam sed elementum. Vestibulum orci vitae dictumst. Donec accumsan.\n\nNam risus molestie interdum tincidunt vestibulum faucibus convallis. Aliquam erat volutpat laoreet tempor, lectus blandit sit amet ipsum. Ut eu dui metus, sed enim. Vestibulum orci felis et tortor eros et tellus vestibulum sodales libero. Mauris in placerat sed, imperdiet urna. In ', 'xhtml', '{filedir_1}fpo-1280-med.gif', 'none', '', 'xhtml', '', 'none'), ('10', '1', '5', '', null, '', null, '', null, '', 'xhtml', '', null, null, null, '', null, 'an at mi.\n\nSuspendisse dolor nunc viverra, arcu facilisis eu leo vitae orci luctus vitae ullamcorper. Aliquam et, diam non massa tincidunt ut varius malesuada, dolor sed. Maecenas metus in convallis tempor pellentesque a aliquet tortor justo. Vestie magna in lorem erat. Nullamcorper sed. Maecenas in faucibus lorem interdum, laoreet sed, volutpat a ut purus. Praesent et venenatis. Aenean blandit porttitor, mi ut lacus vitae magna, id faucibus orci luctus justo. Suspendisse potenti. Fusce commodo. Maecenas in, la\n\ntrum fringilla, nec cursus augue augue justo. Vestibulum in eleifend ligula vestibulum sodales libero mattis non erat sed dolor sed enim sapien, vitae ullam gravida dapibus. Donec aliquam semper inceptos himenaeos.\n\nDonec sed enim. Nunc ac pulvinar scelerisque sapien, tempor nisi, vestibulum in placerat, auctor. Suspendisse adipiscing. Phasellus mus. Sed pretium faucibus orci. Sed non tellus vitae libero nec facilisis. Nunc aliquet odio consequat luctus varius sed tellus, vel pellentesque nibh turpis. Donec orci luctus velit et arcu eget metus pulvinar. Vestibulum ante. Vestibulum. Vestibulum accumsan in orna\n\nra ac purus nisl metus. Ut iaculis orci. Sed sit amet urna. Sed ac tellus velit ut risus nisl sapien in augue imperdiet ut metus, sed porta non congue a aliquet, risus semper sed. Maecenas in faucibus orci. Nunc interdum pharetra, orci libero congue, magna tempor pellentesque et nunc id magna rutrum aliquam tortor sollicitudin semper \n\nr rhoncus. Aliquet, dignissim convallis. Praesent tempor nisi at tincidunt dolor quis dis parturient montes, nascetur ridiculus vitae, dapibus urna, commodo. Suspendisse potenti. Pellentesque faucibus orci non ultrices quam a metus sit amet mattis dolor massa. Donec adipiscing arcu. Etiam quis. Maecenas rhoncus. Phasellus mus. Sed pulvinar. Morbi fermentum non, vulputate malesuada iaculis facilisis. Nunc tempor nisi pretium faucibus rhoncus ipsum. Vestibulum faucibus velit lorem, eget odio auctor. Suspendisse dolor, accumsan sed enim nec lobortis bibendum augue ac tellus volutpat dignissim.', 'xhtml', '', 'none', '', 'xhtml', '', 'none'), ('11', '1', '2', 'Web Developer', 'none', '{filedir_2}fpo-250-dark.gif', 'none', '', null, '', 'xhtml', '', null, null, null, '', null, '', null, '', null, null, null, '', 'none'), ('12', '1', '2', 'Creative Director', 'none', '{filedir_2}fpo-250-light.gif', 'none', '', null, '', 'xhtml', '', null, null, null, '', null, '', null, '', null, null, null, '', 'none'), ('13', '1', '2', 'Web Developer', 'none', '{filedir_2}fpo-250-red.gif', 'none', '', null, '', 'xhtml', '', null, null, null, '', null, '', null, '', null, null, null, '', 'none'), ('14', '1', '2', 'Senior Developer', 'none', '{filedir_2}fpo-250-med.gif', 'none', '', null, '', 'xhtml', '', null, null, null, '', null, '', null, '', null, null, null, '', 'none'), ('15', '1', '2', 'Senior Designer', 'none', '{filedir_2}fpo-250-light.gif', 'none', '', null, '', 'xhtml', '', null, null, null, '', null, '', null, '', null, null, null, '', 'none'), ('16', '1', '2', 'Office Manager', 'none', '{filedir_2}fpo-250-red.gif', 'none', '', null, '', 'xhtml', '', null, null, null, '', null, '', null, '', null, null, null, '', 'none'), ('17', '1', '4', '', null, '', null, '{filedir_3}fpo-100-red.gif', 'none', 'Nullam quis risus eget urna mollis ornare vel eu leo.', 'xhtml', '', null, null, null, '', null, '', null, '', null, null, null, '', 'none'), ('18', '1', '4', '', null, '', null, '{filedir_3}fpo-100-med.gif', 'none', 'Nullam quis risus eget urna mollis ornare vel eu leo.', 'xhtml', '', null, null, null, '', null, '', null, '', null, null, null, '', 'none'), ('19', '1', '4', '', null, '', null, '{filedir_3}fpo-100-light.gif', 'none', 'Nullam quis risus eget urna mollis ornare vel eu leo.', 'xhtml', '', null, null, null, '', null, '', null, '', null, null, null, '', 'none'), ('20', '1', '4', '', null, '', null, '{filedir_3}fpo-100-red.gif', 'none', 'Morbi leo risus, porta ac consectetur ac, vestibulum at eros.', 'xhtml', '', null, null, null, '', null, '', null, '', null, null, null, '', 'none'), ('21', '1', '4', '', null, '', null, '{filedir_3}fpo-100-dark.gif', 'none', 'Vestibulum id ligula porta felis euismod semper.', 'xhtml', '', null, null, null, '', null, '', null, '', null, null, null, '', 'none'), ('22', '1', '4', '', null, '', null, '{filedir_3}fpo-100-light.gif', 'none', 'Maecenas faucibus mollis interdum.', 'xhtml', '', null, null, null, '', null, '', null, '', null, null, null, '', 'none'), ('23', '1', '3', '', null, '', null, '', null, '', 'xhtml', 'Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Vestibulum id ligula porta felis euismod semper. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod.\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Cras mattis consectetur purus sit amet fermentum. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Integer posuere erat a ante venenatis dapibus posuere velit aliquet.', 'xhtml', '', 'xhtml', ' ', 'xhtml', '', null, '', null, null, null, '', 'none'), ('24', '1', '3', '', null, '', null, '', null, '', 'xhtml', 'Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Morbi leo risus, porta ac consectetur ac, vestibulum at eros. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Maecenas faucibus mollis interdum. Donec id elit non mi porta gravida at eget metus. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit.\n\nCras mattis consectetur purus sit amet fermentum. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Morbi leo risus, porta ac consectetur ac, vestibulum at eros. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\n\nNullam quis risus eget urna mollis ornare vel eu leo. Nulla vitae elit libero, a pharetra augue. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.\n\nAenean lacinia bibendum nulla sed consectetur. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam quis risus eget urna mollis ornare vel eu leo. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor.', 'xhtml', '', 'xhtml', ' ', 'xhtml', '', null, '', null, null, null, '', 'none'), ('25', '1', '3', '', null, '', null, '', null, '', null, 'Maecenas sed diam eget risus varius blandit sit amet non magna. Cras mattis consectetur purus sit amet fermentum. Vestibulum id ligula porta felis euismod semper. Morbi leo risus, porta ac consectetur ac, vestibulum at eros.\n\nInteger posuere erat a ante venenatis dapibus posuere velit aliquet. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Cras mattis consectetur purus sit amet fermentum. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Integer posuere erat a ante venenatis dapibus posuere velit aliquet. Curabitur blandit tempus porttitor.', 'xhtml', '', 'xhtml', ' ', 'xhtml', '', null, '', null, null, null, '', 'none'), ('26', '1', '3', '', null, '', null, '', null, '', null, 'Cras justo odio, dapibus ac facilisis in, egestas eget quam. Curabitur blandit tempus porttitor. Nulla vitae elit libero, a pharetra augue. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.\n\nDonec sed odio dui. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Cras mattis consectetur purus sit amet fermentum. Aenean lacinia bibendum nulla sed consectetur. Nullam id dolor id nibh ultricies vehicula ut id elit. Curabitur blandit tempus porttitor. Maecenas faucibus mollis interdum.\n\nDonec id elit non mi porta gravida at eget metus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur blandit tempus porttitor. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.', 'xhtml', '', 'xhtml', ' ', 'xhtml', '', null, '', null, null, null, '', 'none'), ('27', '1', '3', '', null, '', null, '', null, '', null, 'Cras justo odio, dapibus ac facilisis in, egestas eget quam. Curabitur blandit tempus porttitor. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Cras mattis consectetur purus sit amet fermentum. Integer posuere erat a ante venenatis dapibus posuere velit aliquet.\n\nCurabitur blandit tempus porttitor. Maecenas faucibus mollis interdum. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Nullam quis risus eget urna mollis ornare vel eu leo. Nullam id dolor id nibh ultricies vehicula ut id elit.', 'xhtml', '', 'xhtml', ' ', 'xhtml', '', null, '', null, null, null, '', 'none'), ('28', '1', '3', '', null, '', null, '', null, '', null, 'Donec id elit non mi porta gravida at eget metus. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Nulla vitae elit libero, a pharetra augue. Etiam porta sem malesuada magna mollis euismod.\n\nDonec sed odio dui. Cras mattis consectetur purus sit amet fermentum. Nullam quis risus eget urna mollis ornare vel eu leo. Vestibulum id ligula porta felis euismod semper.', 'xhtml', '', 'xhtml', ' ', 'xhtml', '', null, '', null, null, null, '', 'none'), ('29', '1', '3', '', null, '', null, '', null, '', null, 'Vestibulum id ligula porta felis euismod semper. Aenean lacinia bibendum nulla sed consectetur. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Donec id elit non mi porta gravida at eget metus. Etiam porta sem malesuada magna mollis euismod. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Cras justo odio, dapibus ac facilisis in, egestas eget quam.\n\nSed posuere consectetur est at lobortis. Maecenas sed diam eget risus varius blandit sit amet non magna. Nullam id dolor id nibh ultricies vehicula ut id elit. Curabitur blandit tempus porttitor.\n\nNullam id dolor id nibh ultricies vehicula ut id elit. Nulla vitae elit libero, a pharetra augue. Sed posuere consectetur est at lobortis. Donec ullamcorper nulla non metus auctor fringilla. Vestibulum id ligula porta felis euismod semper.', 'xhtml', '', 'xhtml', ' ', 'xhtml', '', null, '', null, null, null, '', 'none'), ('30', '1', '1', '', null, '', null, '', null, '', null, '', null, null, null, '', null, 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Integer posuere erat a ante venenatis dapibus posuere velit aliquet. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Curabitur blandit tempus porttitor. Nullam quis risus eget urna mollis ornare vel eu leo.\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam quis risus eget urna mollis ornare vel eu leo. Integer posuere erat a ante venenatis dapibus posuere velit aliquet. Praesent commodo cursus magna, vel scelerisque nisl consectetur et.\n\nCum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Maecenas sed diam eget risus varius blandit sit amet non magna. Sed posuere consectetur est at lobortis. Donec sed odio dui.', 'xhtml', '{filedir_1}fpo-1280-red.gif', 'none', '', 'xhtml', '', 'none'), ('31', '1', '1', '', null, '', null, '', null, '', null, '', null, null, null, '', null, 'Vestibulum id ligula porta felis euismod semper. Cras mattis consectetur purus sit amet fermentum. Cras mattis consectetur purus sit amet fermentum. Nulla vitae elit libero, a pharetra augue.\n\nMorbi leo risus, porta ac consectetur ac, vestibulum at eros. Aenean lacinia bibendum nulla sed consectetur. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Curabitur blandit tempus porttitor. Nullam quis risus eget urna mollis ornare vel eu leo. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.\n\nCurabitur blandit tempus porttitor. Curabitur blandit tempus porttitor. Curabitur blandit tempus porttitor. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras justo odio, dapibus ac facilisis in, egestas eget quam.', 'xhtml', '', 'none', '', 'xhtml', 'Aenean lacinia bibendum nulla sed consectetur.', 'none'), ('32', '1', '1', '', null, '', null, '', null, '', null, '', null, null, null, '', null, 'Aenean lacinia bibendum nulla sed consectetur. Etiam porta sem malesuada magna mollis euismod. Nullam quis risus eget urna mollis ornare vel eu leo. Nulla vitae elit libero, a pharetra augue. Maecenas faucibus mollis interdum. Nullam id dolor id nibh ultricies vehicula ut id elit.', 'xhtml', '', 'none', '', 'xhtml', 'Donec id elit non mi porta gravida at eget metus.', 'none'), ('33', '1', '1', '', null, '', null, '', null, '', null, '', null, null, null, '', null, '', 'xhtml', '', 'none', '', 'xhtml', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 'none');
COMMIT;

-- ----------------------------
--  Table structure for `exp_channel_entries_autosave`
-- ----------------------------
DROP TABLE IF EXISTS `exp_channel_entries_autosave`;
CREATE TABLE `exp_channel_entries_autosave` (
  `entry_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `original_entry_id` int(10) unsigned NOT NULL,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `channel_id` int(4) unsigned NOT NULL,
  `author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `forum_topic_id` int(10) unsigned DEFAULT NULL,
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL,
  `url_title` varchar(75) NOT NULL,
  `status` varchar(50) NOT NULL,
  `versioning_enabled` char(1) NOT NULL DEFAULT 'n',
  `view_count_one` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_two` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_three` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_four` int(10) unsigned NOT NULL DEFAULT '0',
  `allow_comments` varchar(1) NOT NULL DEFAULT 'y',
  `sticky` varchar(1) NOT NULL DEFAULT 'n',
  `entry_date` int(10) NOT NULL,
  `year` char(4) NOT NULL,
  `month` char(2) NOT NULL,
  `day` char(3) NOT NULL,
  `expiration_date` int(10) NOT NULL DEFAULT '0',
  `comment_expiration_date` int(10) NOT NULL DEFAULT '0',
  `edit_date` bigint(14) DEFAULT NULL,
  `recent_comment_date` int(10) DEFAULT NULL,
  `comment_total` int(4) unsigned NOT NULL DEFAULT '0',
  `entry_data` text,
  PRIMARY KEY (`entry_id`),
  KEY `channel_id` (`channel_id`),
  KEY `author_id` (`author_id`),
  KEY `url_title` (`url_title`),
  KEY `status` (`status`),
  KEY `entry_date` (`entry_date`),
  KEY `expiration_date` (`expiration_date`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `exp_channel_fields`
-- ----------------------------
DROP TABLE IF EXISTS `exp_channel_fields`;
CREATE TABLE `exp_channel_fields` (
  `field_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(4) unsigned NOT NULL,
  `field_name` varchar(32) NOT NULL,
  `field_label` varchar(50) NOT NULL,
  `field_instructions` text,
  `field_type` varchar(50) NOT NULL DEFAULT 'text',
  `field_list_items` text NOT NULL,
  `field_pre_populate` char(1) NOT NULL DEFAULT 'n',
  `field_pre_channel_id` int(6) unsigned DEFAULT NULL,
  `field_pre_field_id` int(6) unsigned DEFAULT NULL,
  `field_ta_rows` tinyint(2) DEFAULT '8',
  `field_maxl` smallint(3) DEFAULT NULL,
  `field_required` char(1) NOT NULL DEFAULT 'n',
  `field_text_direction` char(3) NOT NULL DEFAULT 'ltr',
  `field_search` char(1) NOT NULL DEFAULT 'n',
  `field_is_hidden` char(1) NOT NULL DEFAULT 'n',
  `field_fmt` varchar(40) NOT NULL DEFAULT 'xhtml',
  `field_show_fmt` char(1) NOT NULL DEFAULT 'y',
  `field_order` int(3) unsigned NOT NULL,
  `field_content_type` varchar(20) NOT NULL DEFAULT 'any',
  `field_settings` text,
  PRIMARY KEY (`field_id`),
  KEY `group_id` (`group_id`),
  KEY `field_type` (`field_type`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `exp_channel_fields`
-- ----------------------------
BEGIN;
INSERT INTO `exp_channel_fields` VALUES ('12', '1', '4', 'cf_shared_teaser', 'Teaser', 'Teaser text to be used when linking to this page', 'textarea', '', '0', '0', '0', '3', '0', 'n', 'ltr', 'n', 'n', 'none', 'n', '1', 'any', 'YTo2OntzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='), ('2', '1', '1', 'cf_team_position', 'Position', 'Enter a job title/position', 'text', '', '0', '0', '0', '0', '128', 'n', 'ltr', 'y', 'n', 'none', 'n', '1', 'any', 'YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='), ('3', '1', '1', 'cf_team_photo', 'Photo', 'Select or upload a photo', 'file', '', '0', '0', '0', '0', '0', 'n', 'ltr', 'n', 'n', 'none', 'n', '2', 'any', 'YToxMDp7czoxODoiZmllbGRfY29udGVudF90eXBlIjtzOjU6ImltYWdlIjtzOjE5OiJhbGxvd2VkX2RpcmVjdG9yaWVzIjtzOjE6IjIiO3M6MTM6InNob3dfZXhpc3RpbmciO3M6MToieSI7czoxMjoibnVtX2V4aXN0aW5nIjtzOjA6IiI7czoxODoiZmllbGRfc2hvd19zbWlsZXlzIjtzOjE6Im4iO3M6MTk6ImZpZWxkX3Nob3dfZ2xvc3NhcnkiO3M6MToibiI7czoyMToiZmllbGRfc2hvd19zcGVsbGNoZWNrIjtzOjE6Im4iO3M6MjY6ImZpZWxkX3Nob3dfZm9ybWF0dGluZ19idG5zIjtzOjE6Im4iO3M6MjQ6ImZpZWxkX3Nob3dfZmlsZV9zZWxlY3RvciI7czoxOiJuIjtzOjIwOiJmaWVsZF9zaG93X3dyaXRlbW9kZSI7czoxOiJuIjt9'), ('4', '1', '2', 'cf_service_icon', 'Icon', 'Select or upload an icon', 'file', '', '0', '0', '0', '0', '0', 'n', 'ltr', 'n', 'n', 'none', 'n', '1', 'any', 'YToxMDp7czoxODoiZmllbGRfY29udGVudF90eXBlIjtzOjU6ImltYWdlIjtzOjE5OiJhbGxvd2VkX2RpcmVjdG9yaWVzIjtzOjE6IjMiO3M6MTM6InNob3dfZXhpc3RpbmciO3M6MToieSI7czoxMjoibnVtX2V4aXN0aW5nIjtzOjE6IjAiO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='), ('5', '1', '2', 'cf_service_description', 'Description', 'Enter a short description for this service', 'textarea', '', '0', '0', '0', '9', '0', 'n', 'ltr', 'n', 'n', 'xhtml', 'n', '2', 'any', 'YTo2OntzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='), ('6', '1', '3', 'cf_port_description', 'Description', 'Short summary of the portfolio piece', 'textarea', '', '0', '0', '0', '9', '0', 'n', 'ltr', 'y', 'n', 'xhtml', 'n', '1', 'any', 'YTo2OntzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='), ('7', '1', '3', 'cf_port_services', 'Services', 'Select the services performed during this project', 'relationship', '', '0', '0', '0', '0', '0', 'n', 'ltr', 'n', 'n', 'xhtml', 'n', '3', 'any', 'YToxNjp7czo4OiJjaGFubmVscyI7YToxOntpOjA7czoxOiI0Ijt9czo3OiJleHBpcmVkIjtpOjA7czo2OiJmdXR1cmUiO2k6MDtzOjEwOiJjYXRlZ29yaWVzIjthOjA6e31zOjc6ImF1dGhvcnMiO2E6MDp7fXM6ODoic3RhdHVzZXMiO2E6MTp7aTowO3M6NDoib3BlbiI7fXM6NToibGltaXQiO3M6MDoiIjtzOjExOiJvcmRlcl9maWVsZCI7czo1OiJ0aXRsZSI7czo5OiJvcmRlcl9kaXIiO3M6MzoiYXNjIjtzOjE0OiJhbGxvd19tdWx0aXBsZSI7czoxOiIxIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='), ('8', '1', '3', 'cf_port_gallery', 'Gallery', 'Select or upload images and enter optional captions to build a gallery on the page', 'grid', '', '0', '0', '0', '0', '0', 'n', 'ltr', 'n', 'n', 'xhtml', 'n', '2', 'any', 'YTo4OntzOjEzOiJncmlkX21pbl9yb3dzIjtzOjE6IjEiO3M6MTM6ImdyaWRfbWF4X3Jvd3MiO3M6MToiNyI7czoxODoiZmllbGRfc2hvd19zbWlsZXlzIjtzOjE6Im4iO3M6MTk6ImZpZWxkX3Nob3dfZ2xvc3NhcnkiO3M6MToibiI7czoyMToiZmllbGRfc2hvd19zcGVsbGNoZWNrIjtzOjE6Im4iO3M6MjY6ImZpZWxkX3Nob3dfZm9ybWF0dGluZ19idG5zIjtzOjE6Im4iO3M6MjQ6ImZpZWxkX3Nob3dfZmlsZV9zZWxlY3RvciI7czoxOiJuIjtzOjIwOiJmaWVsZF9zaG93X3dyaXRlbW9kZSI7czoxOiJuIjt9'), ('9', '1', '4', 'cf_shared_body', 'Body', 'Entry content for this post/page', 'textarea', '', '0', '0', '0', '9', '0', 'n', 'ltr', 'y', 'n', 'xhtml', 'n', '2', 'any', 'YTo2OntzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='), ('10', '1', '4', 'cf_shared_image', 'Image', 'Select of upload a feature image to be displayed in the hero area of the page', 'file', '', '0', '0', '0', '0', '0', 'n', 'ltr', 'n', 'n', 'none', 'n', '3', 'any', 'YToxMDp7czoxODoiZmllbGRfY29udGVudF90eXBlIjtzOjU6ImltYWdlIjtzOjE5OiJhbGxvd2VkX2RpcmVjdG9yaWVzIjtzOjE6IjEiO3M6MTM6InNob3dfZXhpc3RpbmciO3M6MToieSI7czoxMjoibnVtX2V4aXN0aW5nIjtzOjA6IiI7czoxODoiZmllbGRfc2hvd19zbWlsZXlzIjtzOjE6Im4iO3M6MTk6ImZpZWxkX3Nob3dfZ2xvc3NhcnkiO3M6MToibiI7czoyMToiZmllbGRfc2hvd19zcGVsbGNoZWNrIjtzOjE6Im4iO3M6MjY6ImZpZWxkX3Nob3dfZm9ybWF0dGluZ19idG5zIjtzOjE6Im4iO3M6MjQ6ImZpZWxkX3Nob3dfZmlsZV9zZWxlY3RvciI7czoxOiJuIjtzOjIwOiJmaWVsZF9zaG93X3dyaXRlbW9kZSI7czoxOiJuIjt9'), ('11', '1', '4', 'cf_shared_featured_work', 'Featured Work', 'Select samples of work from the portfolio to be featured', 'relationship', '', '0', '0', '0', '0', '0', 'n', 'ltr', 'n', 'n', 'xhtml', 'n', '4', 'any', 'YToxNjp7czo4OiJjaGFubmVscyI7YToxOntpOjA7czoxOiIzIjt9czo3OiJleHBpcmVkIjtpOjA7czo2OiJmdXR1cmUiO2k6MDtzOjEwOiJjYXRlZ29yaWVzIjthOjA6e31zOjc6ImF1dGhvcnMiO2E6MDp7fXM6ODoic3RhdHVzZXMiO2E6MTp7aTowO3M6NDoib3BlbiI7fXM6NToibGltaXQiO3M6MDoiIjtzOjExOiJvcmRlcl9maWVsZCI7czo1OiJ0aXRsZSI7czo5OiJvcmRlcl9kaXIiO3M6MzoiYXNjIjtzOjE0OiJhbGxvd19tdWx0aXBsZSI7czoxOiIxIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30=');
COMMIT;

-- ----------------------------
--  Table structure for `exp_channel_form_settings`
-- ----------------------------
DROP TABLE IF EXISTS `exp_channel_form_settings`;
CREATE TABLE `exp_channel_form_settings` (
  `channel_form_settings_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '0',
  `channel_id` int(6) unsigned NOT NULL DEFAULT '0',
  `default_status` varchar(50) NOT NULL DEFAULT 'open',
  `require_captcha` char(1) NOT NULL DEFAULT 'n',
  `allow_guest_posts` char(1) NOT NULL DEFAULT 'n',
  `default_author` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`channel_form_settings_id`),
  KEY `site_id` (`site_id`),
  KEY `channel_id` (`channel_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `exp_channel_grid_field_8`
-- ----------------------------
DROP TABLE IF EXISTS `exp_channel_grid_field_8`;
CREATE TABLE `exp_channel_grid_field_8` (
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(10) unsigned DEFAULT NULL,
  `row_order` int(10) unsigned DEFAULT NULL,
  `col_id_1` text,
  `col_id_2` text,
  PRIMARY KEY (`row_id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `exp_channel_grid_field_8`
-- ----------------------------
BEGIN;
INSERT INTO `exp_channel_grid_field_8` VALUES ('1', '23', '0', 'This is the first slide', '{filedir_4}fpo-1280-light.gif'), ('7', '24', '1', '', '{filedir_4}fpo-1280-light.gif'), ('3', '24', '0', 'This is a caption, yo!', '{filedir_4}fpo-1280-med.gif'), ('4', '25', '0', 'This is the first slide but it is not featured', '{filedir_4}fpo-1280-red.gif'), ('5', '25', '1', 'This is the second slide and it is featured', '{filedir_4}fpo-1280-dark.gif'), ('6', '23', '1', 'This is the second slide', '{filedir_4}fpo-1280-red.gif'), ('8', '24', '2', '', '{filedir_4}fpo-1280-dark.gif'), ('9', '26', '0', 'First caption, don\'t care', '{filedir_4}fpo-1280-red.gif'), ('10', '27', '0', '', '{filedir_4}fpo-1280-dark.gif'), ('11', '27', '1', '', '{filedir_4}fpo-1280-red.gif'), ('12', '27', '2', 'Third slide featured', '{filedir_4}fpo-1280-med.gif'), ('13', '28', '0', 'Hmmm', '{filedir_4}fpo-1280-dark.gif'), ('14', '29', '0', 'Caption this', '{filedir_4}fpo-1280-red.gif'), ('15', '29', '1', '', '{filedir_4}fpo-1280-light.gif'), ('16', '29', '2', 'Another caption sir', '{filedir_4}fpo-1280-med.gif'), ('17', '29', '3', '', '{filedir_4}fpo-1280-red.gif'), ('18', '29', '4', 'Fourth slide featured captiom', '{filedir_4}fpo-1280-med.gif'), ('19', '29', '5', '', '{filedir_4}fpo-1280-light.gif'), ('20', '29', '6', '', '{filedir_4}fpo-1280-dark.gif');
COMMIT;

-- ----------------------------
--  Table structure for `exp_channel_member_groups`
-- ----------------------------
DROP TABLE IF EXISTS `exp_channel_member_groups`;
CREATE TABLE `exp_channel_member_groups` (
  `group_id` smallint(4) unsigned NOT NULL,
  `channel_id` int(6) unsigned NOT NULL,
  PRIMARY KEY (`group_id`,`channel_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `exp_channel_titles`
-- ----------------------------
DROP TABLE IF EXISTS `exp_channel_titles`;
CREATE TABLE `exp_channel_titles` (
  `entry_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `channel_id` int(4) unsigned NOT NULL,
  `author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `forum_topic_id` int(10) unsigned DEFAULT NULL,
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL,
  `url_title` varchar(75) NOT NULL,
  `status` varchar(50) NOT NULL,
  `versioning_enabled` char(1) NOT NULL DEFAULT 'n',
  `view_count_one` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_two` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_three` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_four` int(10) unsigned NOT NULL DEFAULT '0',
  `allow_comments` varchar(1) NOT NULL DEFAULT 'y',
  `sticky` varchar(1) NOT NULL DEFAULT 'n',
  `entry_date` int(10) NOT NULL,
  `year` char(4) NOT NULL,
  `month` char(2) NOT NULL,
  `day` char(3) NOT NULL,
  `expiration_date` int(10) NOT NULL DEFAULT '0',
  `comment_expiration_date` int(10) NOT NULL DEFAULT '0',
  `edit_date` bigint(14) DEFAULT NULL,
  `recent_comment_date` int(10) DEFAULT NULL,
  `comment_total` int(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry_id`),
  KEY `channel_id` (`channel_id`),
  KEY `author_id` (`author_id`),
  KEY `url_title` (`url_title`),
  KEY `status` (`status`),
  KEY `entry_date` (`entry_date`),
  KEY `expiration_date` (`expiration_date`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `exp_channel_titles`
-- ----------------------------
BEGIN;
INSERT INTO `exp_channel_titles` VALUES ('1', '1', '5', '1', null, '127.0.0.1', 'Sem, Sed Dolor Nec', 'sem-sed-dolor-nec', 'open', 'y', '0', '0', '0', '0', 'n', 'n', '1402876920', '2014', '06', '15', '0', '0', '20140616005754', '0', '0'), ('2', '1', '5', '1', null, '127.0.0.1', 'T, Fringilla Nibh Blandit.Phasellus', 't-fringilla-nibh-blandit.-phasellus', 'open', 'y', '0', '0', '0', '0', 'n', 'n', '1402876920', '2014', '06', '15', '0', '0', '20140616005628', '0', '0'), ('3', '1', '5', '1', null, '127.0.0.1', 'Viverra Ac Pulvinar Luctus', 'viverra-ac-pulvinar-luctus', 'open', 'y', '0', '0', '0', '0', 'n', 'n', '1402876920', '2014', '06', '15', '0', '0', '20140616005703', '0', '0'), ('4', '1', '5', '1', null, '127.0.0.1', 'At Risus Mollis', 'at-risus-mollis', 'open', 'y', '0', '0', '0', '0', 'n', 'n', '1402876920', '2014', '06', '15', '0', '0', '20140616005524', '0', '0'), ('5', '1', '5', '1', null, '127.0.0.1', 'Ia Eget Nisi,', 'ia-eget-nisi', 'open', 'y', '0', '0', '0', '0', 'n', 'n', '1402876920', '2014', '06', '15', '0', '0', '20140616005507', '0', '0'), ('6', '1', '5', '1', null, '127.0.0.1', 'E Rhoncus. Aliquet Nisi. Vivamus', 'e-rhoncus.-aliquet-nisi.-vivamus', 'open', 'y', '0', '0', '0', '0', 'n', 'n', '1402876921', '2014', '06', '15', '0', '0', '20140616000201', '0', '0'), ('7', '1', '5', '1', null, '127.0.0.1', 'Llamcorper Vehicula Vestibulum.', 'llamcorper-vehicula-vestibulum', 'open', 'y', '0', '0', '0', '0', 'n', 'n', '1402876920', '2014', '06', '15', '0', '0', '20140616005811', '0', '0'), ('8', '1', '5', '1', null, '127.0.0.1', 'Urpis, Vel Auctor Urna. Cras', 'urpis-vel-auctor-urna.-cras', 'open', 'y', '0', '0', '0', '0', 'n', 'n', '1402876920', '2014', '06', '15', '0', '0', '20140616005650', '0', '0'), ('9', '1', '5', '1', null, '127.0.0.1', 'S Tristique Odio Sollicitudin.', 's-tristique-odio-sollicitudin', 'open', 'y', '0', '0', '0', '0', 'n', 'n', '1402876920', '2014', '06', '15', '0', '0', '20140616005426', '0', '0'), ('10', '1', '5', '1', null, '127.0.0.1', 'Elerisque Sed, Tincidunt. Praesent Sed', 'elerisque-sed-tincidunt.-praesent-sed', 'open', 'y', '0', '0', '0', '0', 'n', 'n', '1402876921', '2014', '06', '15', '0', '0', '20140616000201', '0', '0'), ('11', '1', '2', '1', null, '127.0.0.1', 'Roger Beard', 'roger-beard', 'open', 'y', '0', '0', '0', '0', 'n', 'n', '1402877100', '2014', '06', '15', '0', '0', '20140616010337', '0', '0'), ('12', '1', '2', '1', null, '127.0.0.1', 'Derrick Simpson', 'derrick-simpson', 'open', 'y', '0', '0', '0', '0', 'n', 'n', '1402877100', '2014', '06', '15', '0', '0', '20140616010437', '0', '0'), ('13', '1', '2', '1', null, '127.0.0.1', 'Janet Goldblum', 'janet-goldblum', 'open', 'y', '0', '0', '0', '0', 'n', 'n', '1402877100', '2014', '06', '15', '0', '0', '20140616010534', '0', '0'), ('14', '1', '2', '1', null, '127.0.0.1', 'Jennifer Martins', 'jennifer-martins', 'open', 'y', '0', '0', '0', '0', 'n', 'n', '1402877100', '2014', '06', '15', '0', '0', '20140616010553', '0', '0'), ('15', '1', '2', '1', null, '127.0.0.1', 'Lucy Lewis', 'lucy-lewis', 'open', 'y', '0', '0', '0', '0', 'n', 'n', '1402877100', '2014', '06', '15', '0', '0', '20140616010604', '0', '0'), ('16', '1', '2', '1', null, '127.0.0.1', 'Matthew Clarke', 'matthew-clarke', 'open', 'y', '0', '0', '0', '0', 'n', 'n', '1402877100', '2014', '06', '15', '0', '0', '20140616010615', '0', '0'), ('17', '1', '4', '1', null, '127.0.0.1', 'Web Design', 'web-design', 'open', 'y', '0', '0', '0', '0', 'n', 'n', '1402877160', '2014', '06', '15', '0', '0', '20140618230246', '0', '0'), ('18', '1', '4', '1', null, '127.0.0.1', 'Web Development', 'web-development', 'open', 'y', '0', '0', '0', '0', 'n', 'n', '1402877460', '2014', '06', '15', '0', '0', '20140618230229', '0', '0'), ('19', '1', '4', '1', null, '127.0.0.1', 'Web Strategy', 'web-strategy', 'open', 'y', '0', '0', '0', '0', 'n', 'n', '1402877460', '2014', '06', '15', '0', '0', '20140618230235', '0', '0'), ('20', '1', '4', '1', null, '127.0.0.1', 'Bespoke Development', 'bespoke-development', 'open', 'y', '0', '0', '0', '0', 'n', 'n', '1402877520', '2014', '06', '15', '0', '0', '20140618230112', '0', '0'), ('21', '1', '4', '1', null, '127.0.0.1', 'Email Marketing', 'email-marketing', 'open', 'y', '0', '0', '0', '0', 'n', 'n', '1402877520', '2014', '06', '15', '0', '0', '20140618230209', '0', '0'), ('22', '1', '4', '1', null, '127.0.0.1', 'SEO', 'search-engine-optimization', 'open', 'y', '0', '0', '0', '0', 'n', 'n', '1402877520', '2014', '06', '15', '0', '0', '20140618230220', '0', '0'), ('23', '1', '3', '1', null, '127.0.0.1', 'Mavericks, Inc.', 'mavericks-inc', 'open', 'y', '0', '0', '0', '0', 'n', 'n', '1402878180', '2014', '06', '15', '0', '0', '20140616004620', '0', '0'), ('24', '1', '3', '1', null, '127.0.0.1', 'Mountain Lion Corp,', 'mountain-lion-corp', 'open', 'y', '0', '0', '0', '0', 'n', 'n', '1402878720', '2014', '06', '15', '0', '0', '20140616004648', '0', '0'), ('25', '1', '3', '1', null, '127.0.0.1', 'Yosemite LLC.', 'yosemite-llc', 'open', 'y', '0', '0', '0', '0', 'n', 'n', '1402878840', '2014', '06', '15', '0', '0', '20140616004659', '0', '0'), ('26', '1', '3', '1', null, '127.0.0.1', 'Stan Lion & Co.', 'stan-lion-co', 'open', 'y', '0', '0', '0', '0', 'n', 'n', '1402879620', '2014', '06', '15', '0', '0', '20140616004756', '0', '0'), ('27', '1', '3', '1', null, '127.0.0.1', 'Snow Leopard Interiors', 'snow-leopard-interiors', 'open', 'y', '0', '0', '0', '0', 'n', 'n', '1402879620', '2014', '06', '15', '0', '0', '20140616004911', '0', '0'), ('28', '1', '3', '1', null, '127.0.0.1', 'Leopard Print Beats', 'leopard-print-beats', 'open', 'y', '0', '0', '0', '0', 'n', 'n', '1402879740', '2014', '06', '15', '0', '0', '20140619063533', '0', '0'), ('29', '1', '3', '1', null, '127.0.0.1', 'Tiger Cat Fitness', 'tiger-cat-fitness', 'open', 'y', '0', '0', '0', '0', 'n', 'n', '1402879860', '2014', '06', '15', '0', '0', '20140616005302', '0', '0'), ('30', '1', '1', '1', null, '127.0.0.1', 'Welcome to our Site', 'homepage', 'open', 'y', '0', '0', '0', '0', 'n', 'n', '1403068440', '2014', '06', '17', '0', '0', '20140619233738', '0', '0'), ('31', '1', '1', '1', null, '127.0.0.1', 'About', 'about', 'open', 'y', '0', '0', '0', '0', 'n', 'n', '1403099040', '2014', '06', '18', '0', '0', '20140619214113', '0', '0'), ('32', '1', '1', '1', null, '127.0.0.1', 'Services', 'services', 'open', 'y', '0', '0', '0', '0', 'n', 'n', '1403099100', '2014', '06', '18', '0', '0', '20140618225512', '0', '0'), ('33', '1', '1', '1', null, '127.0.0.1', 'Portfolio', 'work', 'open', 'y', '0', '0', '0', '0', 'n', 'n', '1403099160', '2014', '06', '18', '0', '0', '20140618153944', '0', '0');
COMMIT;

-- ----------------------------
--  Table structure for `exp_channels`
-- ----------------------------
DROP TABLE IF EXISTS `exp_channels`;
CREATE TABLE `exp_channels` (
  `channel_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `channel_name` varchar(40) NOT NULL,
  `channel_title` varchar(100) NOT NULL,
  `channel_url` varchar(100) NOT NULL,
  `channel_description` varchar(255) DEFAULT NULL,
  `channel_lang` varchar(12) NOT NULL,
  `total_entries` mediumint(8) NOT NULL DEFAULT '0',
  `total_comments` mediumint(8) NOT NULL DEFAULT '0',
  `last_entry_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_comment_date` int(10) unsigned NOT NULL DEFAULT '0',
  `cat_group` varchar(255) DEFAULT NULL,
  `status_group` int(4) unsigned DEFAULT NULL,
  `deft_status` varchar(50) NOT NULL DEFAULT 'open',
  `field_group` int(4) unsigned DEFAULT NULL,
  `search_excerpt` int(4) unsigned DEFAULT NULL,
  `deft_category` varchar(60) DEFAULT NULL,
  `deft_comments` char(1) NOT NULL DEFAULT 'y',
  `channel_require_membership` char(1) NOT NULL DEFAULT 'y',
  `channel_max_chars` int(5) unsigned DEFAULT NULL,
  `channel_html_formatting` char(4) NOT NULL DEFAULT 'all',
  `channel_allow_img_urls` char(1) NOT NULL DEFAULT 'y',
  `channel_auto_link_urls` char(1) NOT NULL DEFAULT 'n',
  `channel_notify` char(1) NOT NULL DEFAULT 'n',
  `channel_notify_emails` varchar(255) DEFAULT NULL,
  `comment_url` varchar(80) DEFAULT NULL,
  `comment_system_enabled` char(1) NOT NULL DEFAULT 'y',
  `comment_require_membership` char(1) NOT NULL DEFAULT 'n',
  `comment_use_captcha` char(1) NOT NULL DEFAULT 'n',
  `comment_moderate` char(1) NOT NULL DEFAULT 'n',
  `comment_max_chars` int(5) unsigned DEFAULT '5000',
  `comment_timelock` int(5) unsigned NOT NULL DEFAULT '0',
  `comment_require_email` char(1) NOT NULL DEFAULT 'y',
  `comment_text_formatting` char(5) NOT NULL DEFAULT 'xhtml',
  `comment_html_formatting` char(4) NOT NULL DEFAULT 'safe',
  `comment_allow_img_urls` char(1) NOT NULL DEFAULT 'n',
  `comment_auto_link_urls` char(1) NOT NULL DEFAULT 'y',
  `comment_notify` char(1) NOT NULL DEFAULT 'n',
  `comment_notify_authors` char(1) NOT NULL DEFAULT 'n',
  `comment_notify_emails` varchar(255) DEFAULT NULL,
  `comment_expiration` int(4) unsigned NOT NULL DEFAULT '0',
  `search_results_url` varchar(80) DEFAULT NULL,
  `show_button_cluster` char(1) NOT NULL DEFAULT 'y',
  `rss_url` varchar(80) DEFAULT NULL,
  `enable_versioning` char(1) NOT NULL DEFAULT 'n',
  `max_revisions` smallint(4) unsigned NOT NULL DEFAULT '10',
  `default_entry_title` varchar(100) DEFAULT NULL,
  `url_title_prefix` varchar(80) DEFAULT NULL,
  `live_look_template` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`channel_id`),
  KEY `cat_group` (`cat_group`),
  KEY `status_group` (`status_group`),
  KEY `field_group` (`field_group`),
  KEY `channel_name` (`channel_name`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `exp_channels`
-- ----------------------------
BEGIN;
INSERT INTO `exp_channels` VALUES ('1', '1', 'ch_pages', 'Pages', 'http://everydaystash.dev/', '', 'en', '4', '0', '1403099160', '0', '', '1', 'open', '4', '9', '', 'n', 'y', null, 'all', 'y', 'n', 'n', '', '', 'y', 'n', 'n', 'n', '5000', '0', 'y', 'xhtml', 'safe', 'n', 'y', 'n', 'n', null, '0', '', 'n', '', 'n', '10', '', '', '0'), ('2', '1', 'ch_team', 'Team', 'http://everydaystash.dev/', '', 'en', '6', '0', '1402877100', '0', '', '1', 'open', '1', null, '', 'n', 'y', null, 'all', 'y', 'n', 'n', '', '', 'y', 'n', 'n', 'n', '5000', '0', 'y', 'xhtml', 'safe', 'n', 'y', 'n', 'n', null, '0', '', 'n', '', 'n', '10', '', '', '0'), ('3', '1', 'ch_portfolio', 'Portfolio', 'http://everydaystash.dev/', null, 'en', '7', '0', '1402879860', '0', '', '1', 'open', '3', null, null, 'y', 'y', null, 'all', 'y', 'n', 'n', null, null, 'y', 'n', 'n', 'n', '5000', '0', 'y', 'xhtml', 'safe', 'n', 'y', 'n', 'n', null, '0', null, 'y', null, 'n', '10', '', '', '0'), ('4', '1', 'ch_services', 'Services', 'http://everydaystash.dev/', null, 'en', '6', '0', '1402877520', '0', '', '1', 'open', '2', null, null, 'y', 'y', null, 'all', 'y', 'n', 'n', null, null, 'y', 'n', 'n', 'n', '5000', '0', 'y', 'xhtml', 'safe', 'n', 'y', 'n', 'n', null, '0', null, 'y', null, 'n', '10', '', '', '0'), ('5', '1', 'ch_blog', 'Blog', 'http://everydaystash.dev/', null, 'en', '10', '0', '1402876921', '0', '1', '1', 'open', '4', null, null, 'y', 'y', null, 'all', 'y', 'n', 'n', null, null, 'y', 'n', 'n', 'n', '5000', '0', 'y', 'xhtml', 'safe', 'n', 'y', 'n', 'n', null, '0', null, 'y', null, 'n', '10', '', '', '0');
COMMIT;

-- ----------------------------
--  Table structure for `exp_content_types`
-- ----------------------------
DROP TABLE IF EXISTS `exp_content_types`;
CREATE TABLE `exp_content_types` (
  `content_type_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`content_type_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `exp_content_types`
-- ----------------------------
BEGIN;
INSERT INTO `exp_content_types` VALUES ('1', 'grid'), ('2', 'channel');
COMMIT;

-- ----------------------------
--  Table structure for `exp_cp_log`
-- ----------------------------
DROP TABLE IF EXISTS `exp_cp_log`;
CREATE TABLE `exp_cp_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `member_id` int(10) unsigned NOT NULL,
  `username` varchar(32) NOT NULL,
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `act_date` int(10) NOT NULL,
  `action` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `exp_cp_log`
-- ----------------------------
BEGIN;
INSERT INTO `exp_cp_log` VALUES ('33', '1', '1', 'stash', '127.0.0.1', '1403223970', 'Logged out');
COMMIT;

-- ----------------------------
--  Table structure for `exp_cp_search_index`
-- ----------------------------
DROP TABLE IF EXISTS `exp_cp_search_index`;
CREATE TABLE `exp_cp_search_index` (
  `search_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `controller` varchar(20) DEFAULT NULL,
  `method` varchar(50) DEFAULT NULL,
  `language` varchar(20) DEFAULT NULL,
  `access` varchar(50) DEFAULT NULL,
  `keywords` text,
  PRIMARY KEY (`search_id`),
  FULLTEXT KEY `keywords` (`keywords`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `exp_developer_log`
-- ----------------------------
DROP TABLE IF EXISTS `exp_developer_log`;
CREATE TABLE `exp_developer_log` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `timestamp` int(10) unsigned NOT NULL,
  `viewed` char(1) NOT NULL DEFAULT 'n',
  `description` text,
  `function` varchar(100) DEFAULT NULL,
  `line` int(10) unsigned DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `deprecated_since` varchar(10) DEFAULT NULL,
  `use_instead` varchar(100) DEFAULT NULL,
  `template_id` int(10) unsigned NOT NULL DEFAULT '0',
  `template_name` varchar(100) DEFAULT NULL,
  `template_group` varchar(100) DEFAULT NULL,
  `addon_module` varchar(100) DEFAULT NULL,
  `addon_method` varchar(100) DEFAULT NULL,
  `snippets` text,
  `hash` char(32) NOT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `exp_developer_log`
-- ----------------------------
BEGIN;
INSERT INTO `exp_developer_log` VALUES ('11', '1403223967', 'n', null, 'add_to_head()', '339', '/Users/pelias/Dropbox/Code/Repositories/GIT/presentations/eecms-every-day-stash-02/public/assets/ee/add-ons/developer/acc.developer.php', '2.8', 'CP::add_to_foot() for scripts', '0', null, null, null, null, null, 'a90c5503618d459b9d5aaae42502f846');
COMMIT;

-- ----------------------------
--  Table structure for `exp_email_cache`
-- ----------------------------
DROP TABLE IF EXISTS `exp_email_cache`;
CREATE TABLE `exp_email_cache` (
  `cache_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `cache_date` int(10) unsigned NOT NULL DEFAULT '0',
  `total_sent` int(6) unsigned NOT NULL,
  `from_name` varchar(70) NOT NULL,
  `from_email` varchar(75) NOT NULL,
  `recipient` text NOT NULL,
  `cc` text NOT NULL,
  `bcc` text NOT NULL,
  `recipient_array` mediumtext NOT NULL,
  `subject` varchar(120) NOT NULL,
  `message` mediumtext NOT NULL,
  `plaintext_alt` mediumtext NOT NULL,
  `mailinglist` char(1) NOT NULL DEFAULT 'n',
  `mailtype` varchar(6) NOT NULL,
  `text_fmt` varchar(40) NOT NULL,
  `wordwrap` char(1) NOT NULL DEFAULT 'y',
  `priority` char(1) NOT NULL DEFAULT '3',
  PRIMARY KEY (`cache_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `exp_email_cache_mg`
-- ----------------------------
DROP TABLE IF EXISTS `exp_email_cache_mg`;
CREATE TABLE `exp_email_cache_mg` (
  `cache_id` int(6) unsigned NOT NULL,
  `group_id` smallint(4) NOT NULL,
  PRIMARY KEY (`cache_id`,`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `exp_email_cache_ml`
-- ----------------------------
DROP TABLE IF EXISTS `exp_email_cache_ml`;
CREATE TABLE `exp_email_cache_ml` (
  `cache_id` int(6) unsigned NOT NULL,
  `list_id` smallint(4) NOT NULL,
  PRIMARY KEY (`cache_id`,`list_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `exp_email_console_cache`
-- ----------------------------
DROP TABLE IF EXISTS `exp_email_console_cache`;
CREATE TABLE `exp_email_console_cache` (
  `cache_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `cache_date` int(10) unsigned NOT NULL DEFAULT '0',
  `member_id` int(10) unsigned NOT NULL,
  `member_name` varchar(50) NOT NULL,
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `recipient` varchar(75) NOT NULL,
  `recipient_name` varchar(50) NOT NULL,
  `subject` varchar(120) NOT NULL,
  `message` mediumtext NOT NULL,
  PRIMARY KEY (`cache_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `exp_entry_versioning`
-- ----------------------------
DROP TABLE IF EXISTS `exp_entry_versioning`;
CREATE TABLE `exp_entry_versioning` (
  `version_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(10) unsigned NOT NULL,
  `channel_id` int(4) unsigned NOT NULL,
  `author_id` int(10) unsigned NOT NULL,
  `version_date` int(10) NOT NULL,
  `version_data` mediumtext NOT NULL,
  PRIMARY KEY (`version_id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `exp_extensions`
-- ----------------------------
DROP TABLE IF EXISTS `exp_extensions`;
CREATE TABLE `exp_extensions` (
  `extension_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(50) NOT NULL DEFAULT '',
  `method` varchar(50) NOT NULL DEFAULT '',
  `hook` varchar(50) NOT NULL DEFAULT '',
  `settings` text NOT NULL,
  `priority` int(2) NOT NULL DEFAULT '10',
  `version` varchar(10) NOT NULL DEFAULT '',
  `enabled` char(1) NOT NULL DEFAULT 'y',
  PRIMARY KEY (`extension_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `exp_extensions`
-- ----------------------------
BEGIN;
INSERT INTO `exp_extensions` VALUES ('3', 'Stash_ext', 'template_fetch_template', 'template_fetch_template', '', '10', '2.5.3', 'y'), ('4', 'Stash_ext', 'template_post_parse', 'template_post_parse', '', '10', '2.5.3', 'y'), ('5', 'Superfish_admin_ext', 'cp_menu_array', 'cp_menu_array', 'a:0:{}', '10', '0.1', 'y'), ('6', 'Low_seg2cat_ext', 'sessions_end', 'sessions_end', 'a:6:{s:9:\"all_sites\";s:1:\"n\";s:15:\"category_groups\";a:0:{}s:11:\"uri_pattern\";s:0:\"\";s:16:\"set_all_segments\";s:1:\"y\";s:17:\"ignore_pagination\";s:1:\"n\";s:16:\"parse_file_paths\";s:1:\"n\";}', '5', '2.8.1', 'y'), ('7', 'Low_seg2cat_ext', 'template_fetch_template', 'template_fetch_template', 'a:6:{s:9:\"all_sites\";s:1:\"n\";s:15:\"category_groups\";a:0:{}s:11:\"uri_pattern\";s:0:\"\";s:16:\"set_all_segments\";s:1:\"y\";s:17:\"ignore_pagination\";s:1:\"n\";s:16:\"parse_file_paths\";s:1:\"n\";}', '5', '2.8.1', 'y');
COMMIT;

-- ----------------------------
--  Table structure for `exp_field_formatting`
-- ----------------------------
DROP TABLE IF EXISTS `exp_field_formatting`;
CREATE TABLE `exp_field_formatting` (
  `formatting_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(10) unsigned NOT NULL,
  `field_fmt` varchar(40) NOT NULL,
  PRIMARY KEY (`formatting_id`)
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `exp_field_formatting`
-- ----------------------------
BEGIN;
INSERT INTO `exp_field_formatting` VALUES ('47', '12', 'markdown'), ('46', '12', 'br'), ('45', '12', 'none'), ('5', '2', 'none'), ('6', '2', 'br'), ('7', '2', 'markdown'), ('8', '2', 'xhtml'), ('9', '3', 'none'), ('10', '3', 'br'), ('11', '3', 'markdown'), ('12', '3', 'xhtml'), ('13', '4', 'none'), ('14', '4', 'br'), ('15', '4', 'markdown'), ('16', '4', 'xhtml'), ('17', '5', 'none'), ('18', '5', 'br'), ('19', '5', 'markdown'), ('20', '5', 'xhtml'), ('21', '6', 'none'), ('22', '6', 'br'), ('23', '6', 'markdown'), ('24', '6', 'xhtml'), ('25', '7', 'none'), ('26', '7', 'br'), ('27', '7', 'markdown'), ('28', '7', 'xhtml'), ('29', '8', 'none'), ('30', '8', 'br'), ('31', '8', 'markdown'), ('32', '8', 'xhtml'), ('33', '9', 'none'), ('34', '9', 'br'), ('35', '9', 'markdown'), ('36', '9', 'xhtml'), ('37', '10', 'none'), ('38', '10', 'br'), ('39', '10', 'markdown'), ('40', '10', 'xhtml'), ('41', '11', 'none'), ('42', '11', 'br'), ('43', '11', 'markdown'), ('44', '11', 'xhtml'), ('48', '12', 'xhtml');
COMMIT;

-- ----------------------------
--  Table structure for `exp_field_groups`
-- ----------------------------
DROP TABLE IF EXISTS `exp_field_groups`;
CREATE TABLE `exp_field_groups` (
  `group_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_name` varchar(50) NOT NULL,
  PRIMARY KEY (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `exp_field_groups`
-- ----------------------------
BEGIN;
INSERT INTO `exp_field_groups` VALUES ('1', '1', 'Team fields'), ('2', '1', 'Services fields'), ('3', '1', 'Portfolio fields'), ('4', '1', 'Shared fields');
COMMIT;

-- ----------------------------
--  Table structure for `exp_fieldtypes`
-- ----------------------------
DROP TABLE IF EXISTS `exp_fieldtypes`;
CREATE TABLE `exp_fieldtypes` (
  `fieldtype_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `version` varchar(12) NOT NULL,
  `settings` text,
  `has_global_settings` char(1) DEFAULT 'n',
  PRIMARY KEY (`fieldtype_id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `exp_fieldtypes`
-- ----------------------------
BEGIN;
INSERT INTO `exp_fieldtypes` VALUES ('12', 'select', '1.0', 'YTowOnt9', 'n'), ('2', 'text', '1.0', 'YTowOnt9', 'n'), ('3', 'textarea', '1.0', 'YTowOnt9', 'n'), ('15', 'date', '1.0', 'YTowOnt9', 'n'), ('5', 'file', '1.0', 'YTowOnt9', 'n'), ('6', 'grid', '1.0', 'YTowOnt9', 'n'), ('14', 'checkboxes', '1.0', 'YTowOnt9', 'n'), ('13', 'multi_select', '1.0', 'YTowOnt9', 'n'), ('10', 'relationship', '1.0', 'YTowOnt9', 'n'), ('16', 'radio', '1.0', 'YTowOnt9', 'n');
COMMIT;

-- ----------------------------
--  Table structure for `exp_file_categories`
-- ----------------------------
DROP TABLE IF EXISTS `exp_file_categories`;
CREATE TABLE `exp_file_categories` (
  `file_id` int(10) unsigned DEFAULT NULL,
  `cat_id` int(10) unsigned DEFAULT NULL,
  `sort` int(10) unsigned DEFAULT '0',
  `is_cover` char(1) DEFAULT 'n',
  KEY `file_id` (`file_id`),
  KEY `cat_id` (`cat_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `exp_file_dimensions`
-- ----------------------------
DROP TABLE IF EXISTS `exp_file_dimensions`;
CREATE TABLE `exp_file_dimensions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `upload_location_id` int(4) unsigned DEFAULT NULL,
  `title` varchar(255) DEFAULT '',
  `short_name` varchar(255) DEFAULT '',
  `resize_type` varchar(50) DEFAULT '',
  `width` int(10) DEFAULT '0',
  `height` int(10) DEFAULT '0',
  `watermark_id` int(4) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `upload_location_id` (`upload_location_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `exp_file_watermarks`
-- ----------------------------
DROP TABLE IF EXISTS `exp_file_watermarks`;
CREATE TABLE `exp_file_watermarks` (
  `wm_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `wm_name` varchar(80) DEFAULT NULL,
  `wm_type` varchar(10) DEFAULT 'text',
  `wm_image_path` varchar(100) DEFAULT NULL,
  `wm_test_image_path` varchar(100) DEFAULT NULL,
  `wm_use_font` char(1) DEFAULT 'y',
  `wm_font` varchar(30) DEFAULT NULL,
  `wm_font_size` int(3) unsigned DEFAULT NULL,
  `wm_text` varchar(100) DEFAULT NULL,
  `wm_vrt_alignment` varchar(10) DEFAULT 'top',
  `wm_hor_alignment` varchar(10) DEFAULT 'left',
  `wm_padding` int(3) unsigned DEFAULT NULL,
  `wm_opacity` int(3) unsigned DEFAULT NULL,
  `wm_hor_offset` int(4) unsigned DEFAULT NULL,
  `wm_vrt_offset` int(4) unsigned DEFAULT NULL,
  `wm_x_transp` int(4) DEFAULT NULL,
  `wm_y_transp` int(4) DEFAULT NULL,
  `wm_font_color` varchar(7) DEFAULT NULL,
  `wm_use_drop_shadow` char(1) DEFAULT 'y',
  `wm_shadow_distance` int(3) unsigned DEFAULT NULL,
  `wm_shadow_color` varchar(7) DEFAULT NULL,
  PRIMARY KEY (`wm_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `exp_files`
-- ----------------------------
DROP TABLE IF EXISTS `exp_files`;
CREATE TABLE `exp_files` (
  `file_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned DEFAULT '1',
  `title` varchar(255) DEFAULT NULL,
  `upload_location_id` int(4) unsigned DEFAULT '0',
  `rel_path` varchar(255) DEFAULT NULL,
  `mime_type` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_size` int(10) DEFAULT '0',
  `description` text,
  `credit` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `uploaded_by_member_id` int(10) unsigned DEFAULT '0',
  `upload_date` int(10) DEFAULT NULL,
  `modified_by_member_id` int(10) unsigned DEFAULT '0',
  `modified_date` int(10) DEFAULT NULL,
  `file_hw_original` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`file_id`),
  KEY `upload_location_id` (`upload_location_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `exp_files`
-- ----------------------------
BEGIN;
INSERT INTO `exp_files` VALUES ('3', '1', 'fpo-1280-dark.gif', '4', '/Users/pelias/Dropbox/Code/Repositories/GIT/presentations/eecms-every-day-stash-02/public/assets/uploads/portfolio/fpo-1280-dark.gif', 'image/gif', 'fpo-1280-dark.gif', '4567', null, null, null, '1', '1402878620', '1', '1402878620', '720 1280'), ('5', '1', 'fpo-1280-red.gif', '4', '/Users/pelias/Dropbox/Code/Repositories/GIT/presentations/eecms-every-day-stash-02/public/assets/uploads/portfolio/fpo-1280-red.gif', 'image/gif', 'fpo-1280-red.gif', '4567', null, null, null, '1', '1402879228', '1', '1402879228', '720 1280'), ('6', '1', 'fpo-1280-med.gif', '4', '/Users/pelias/Dropbox/Code/Repositories/GIT/presentations/eecms-every-day-stash-02/public/assets/uploads/portfolio/fpo-1280-med.gif', 'image/gif', 'fpo-1280-med.gif', '4567', null, null, null, '1', '1402879307', '1', '1402879307', '720 1280'), ('8', '1', 'fpo-1280-light.gif', '4', '/Users/pelias/Dropbox/Code/Repositories/GIT/presentations/eecms-every-day-stash-02/public/assets/uploads/portfolio/fpo-1280-light.gif', 'image/gif', 'fpo-1280-light.gif', '4567', null, null, null, '1', '1402879553', '1', '1402879553', '720 1280'), ('9', '1', 'fpo-1280-dark.gif', '1', '/Users/pelias/Dropbox/Code/Repositories/GIT/presentations/eecms-every-day-stash-02/public/assets/uploads/site/fpo-1280-dark.gif', 'image/gif', 'fpo-1280-dark.gif', '4567', null, null, null, '1', '1402880011', '1', '1402880011', '720 1280'), ('10', '1', 'fpo-1280-med.gif', '1', '/Users/pelias/Dropbox/Code/Repositories/GIT/presentations/eecms-every-day-stash-02/public/assets/uploads/site/fpo-1280-med.gif', 'image/gif', 'fpo-1280-med.gif', '4567', null, null, null, '1', '1402880050', '1', '1402880050', '720 1280'), ('11', '1', 'fpo-1280-red.gif', '1', '/Users/pelias/Dropbox/Code/Repositories/GIT/presentations/eecms-every-day-stash-02/public/assets/uploads/site/fpo-1280-red.gif', 'image/gif', 'fpo-1280-red.gif', '4567', null, null, null, '1', '1402880095', '1', '1402880095', '720 1280'), ('12', '1', 'fpo-1280-light.gif', '1', '/Users/pelias/Dropbox/Code/Repositories/GIT/presentations/eecms-every-day-stash-02/public/assets/uploads/site/fpo-1280-light.gif', 'image/gif', 'fpo-1280-light.gif', '4567', null, null, null, '1', '1402880184', '1', '1402880184', '720 1280'), ('13', '1', 'fpo-100-red.gif', '3', '/Users/pelias/Dropbox/Code/Repositories/GIT/presentations/eecms-every-day-stash-02/public/assets/uploads/services/fpo-100-red.gif', 'image/gif', 'fpo-100-red.gif', '481', null, null, null, '1', '1402880464', '1', '1402880464', '100 100'), ('14', '1', 'fpo-100-dark.gif', '3', '/Users/pelias/Dropbox/Code/Repositories/GIT/presentations/eecms-every-day-stash-02/public/assets/uploads/services/fpo-100-dark.gif', 'image/gif', 'fpo-100-dark.gif', '481', null, null, null, '1', '1402880492', '1', '1402880492', '100 100'), ('16', '1', 'fpo-100-med.gif', '3', '/Users/pelias/Dropbox/Code/Repositories/GIT/presentations/eecms-every-day-stash-02/public/assets/uploads/services/fpo-100-med.gif', 'image/gif', 'fpo-100-med.gif', '481', null, null, null, '1', '1402880527', '1', '1402880527', '100 100'), ('17', '1', 'fpo-100-light.gif', '3', '/Users/pelias/Dropbox/Code/Repositories/GIT/presentations/eecms-every-day-stash-02/public/assets/uploads/services/fpo-100-light.gif', 'image/gif', 'fpo-100-light.gif', '481', null, null, null, '1', '1402880551', '1', '1402880551', '100 100'), ('18', '1', 'fpo-250-dark.gif', '2', '/Users/pelias/Dropbox/Code/Repositories/GIT/presentations/eecms-every-day-stash-02/public/assets/uploads/team/fpo-250-dark.gif', 'image/gif', 'fpo-250-dark.gif', '1249', null, null, null, '1', '1402880612', '1', '1402880612', '250 250'), ('19', '1', 'fpo-250-light.gif', '2', '/Users/pelias/Dropbox/Code/Repositories/GIT/presentations/eecms-every-day-stash-02/public/assets/uploads/team/fpo-250-light.gif', 'image/gif', 'fpo-250-light.gif', '1249', null, null, null, '1', '1402880673', '1', '1402880673', '250 250'), ('20', '1', 'fpo-250-red.gif', '2', '/Users/pelias/Dropbox/Code/Repositories/GIT/presentations/eecms-every-day-stash-02/public/assets/uploads/team/fpo-250-red.gif', 'image/gif', 'fpo-250-red.gif', '1249', null, null, null, '1', '1402880731', '1', '1402880731', '250 250'), ('21', '1', 'fpo-250-med.gif', '2', '/Users/pelias/Dropbox/Code/Repositories/GIT/presentations/eecms-every-day-stash-02/public/assets/uploads/team/fpo-250-med.gif', 'image/gif', 'fpo-250-med.gif', '1249', null, null, null, '1', '1402880749', '1', '1402880749', '250 250');
COMMIT;

-- ----------------------------
--  Table structure for `exp_global_variables`
-- ----------------------------
DROP TABLE IF EXISTS `exp_global_variables`;
CREATE TABLE `exp_global_variables` (
  `variable_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `variable_name` varchar(50) NOT NULL,
  `variable_data` text NOT NULL,
  PRIMARY KEY (`variable_id`),
  KEY `variable_name` (`variable_name`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `exp_grid_columns`
-- ----------------------------
DROP TABLE IF EXISTS `exp_grid_columns`;
CREATE TABLE `exp_grid_columns` (
  `col_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(10) unsigned DEFAULT NULL,
  `content_type` varchar(50) DEFAULT NULL,
  `col_order` int(3) unsigned DEFAULT NULL,
  `col_type` varchar(50) DEFAULT NULL,
  `col_label` varchar(50) DEFAULT NULL,
  `col_name` varchar(32) DEFAULT NULL,
  `col_instructions` text,
  `col_required` char(1) DEFAULT NULL,
  `col_search` char(1) DEFAULT NULL,
  `col_width` int(3) unsigned DEFAULT NULL,
  `col_settings` text,
  PRIMARY KEY (`col_id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `exp_grid_columns`
-- ----------------------------
BEGIN;
INSERT INTO `exp_grid_columns` VALUES ('1', '8', 'channel', '1', 'text', 'Caption', 'caption', '', 'n', 'n', '0', '{\"field_fmt\":\"none\",\"field_content_type\":\"all\",\"field_text_direction\":\"ltr\",\"field_maxl\":\"256\",\"field_required\":\"n\"}'), ('2', '8', 'channel', '0', 'file', 'Image', 'image', 'Select or upload an image', 'n', 'n', '0', '{\"field_content_type\":\"image\",\"allowed_directories\":\"4\",\"show_existing\":\"y\",\"num_existing\":\"\",\"field_required\":\"n\"}');
COMMIT;

-- ----------------------------
--  Table structure for `exp_html_buttons`
-- ----------------------------
DROP TABLE IF EXISTS `exp_html_buttons`;
CREATE TABLE `exp_html_buttons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `member_id` int(10) NOT NULL DEFAULT '0',
  `tag_name` varchar(32) NOT NULL,
  `tag_open` varchar(120) NOT NULL,
  `tag_close` varchar(120) NOT NULL,
  `accesskey` varchar(32) NOT NULL,
  `tag_order` int(3) unsigned NOT NULL,
  `tag_row` char(1) NOT NULL DEFAULT '1',
  `classname` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `exp_html_buttons`
-- ----------------------------
BEGIN;
INSERT INTO `exp_html_buttons` VALUES ('1', '1', '0', 'b', '<strong>', '</strong>', 'b', '1', '1', 'btn_b'), ('2', '1', '0', 'i', '<em>', '</em>', 'i', '2', '1', 'btn_i'), ('3', '1', '0', 'blockquote', '<blockquote>', '</blockquote>', 'q', '3', '1', 'btn_blockquote'), ('4', '1', '0', 'a', '<a href=\"[![Link:!:http://]!]\"(!( title=\"[![Title]!]\")!)>', '</a>', 'a', '4', '1', 'btn_a'), ('5', '1', '0', 'img', '<img src=\"[![Link:!:http://]!]\" alt=\"[![Alternative text]!]\" />', '', '', '5', '1', 'btn_img');
COMMIT;

-- ----------------------------
--  Table structure for `exp_layout_publish`
-- ----------------------------
DROP TABLE IF EXISTS `exp_layout_publish`;
CREATE TABLE `exp_layout_publish` (
  `layout_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `member_group` int(4) unsigned NOT NULL DEFAULT '0',
  `channel_id` int(4) unsigned NOT NULL DEFAULT '0',
  `field_layout` text,
  PRIMARY KEY (`layout_id`),
  KEY `site_id` (`site_id`),
  KEY `member_group` (`member_group`),
  KEY `channel_id` (`channel_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `exp_member_bulletin_board`
-- ----------------------------
DROP TABLE IF EXISTS `exp_member_bulletin_board`;
CREATE TABLE `exp_member_bulletin_board` (
  `bulletin_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender_id` int(10) unsigned NOT NULL,
  `bulletin_group` int(8) unsigned NOT NULL,
  `bulletin_date` int(10) unsigned NOT NULL,
  `hash` varchar(10) NOT NULL DEFAULT '',
  `bulletin_expires` int(10) unsigned NOT NULL DEFAULT '0',
  `bulletin_message` text NOT NULL,
  PRIMARY KEY (`bulletin_id`),
  KEY `sender_id` (`sender_id`),
  KEY `hash` (`hash`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `exp_member_data`
-- ----------------------------
DROP TABLE IF EXISTS `exp_member_data`;
CREATE TABLE `exp_member_data` (
  `member_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `exp_member_data`
-- ----------------------------
BEGIN;
INSERT INTO `exp_member_data` VALUES ('1');
COMMIT;

-- ----------------------------
--  Table structure for `exp_member_fields`
-- ----------------------------
DROP TABLE IF EXISTS `exp_member_fields`;
CREATE TABLE `exp_member_fields` (
  `m_field_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `m_field_name` varchar(32) NOT NULL,
  `m_field_label` varchar(50) NOT NULL,
  `m_field_description` text NOT NULL,
  `m_field_type` varchar(12) NOT NULL DEFAULT 'text',
  `m_field_list_items` text NOT NULL,
  `m_field_ta_rows` tinyint(2) DEFAULT '8',
  `m_field_maxl` smallint(3) NOT NULL,
  `m_field_width` varchar(6) NOT NULL,
  `m_field_search` char(1) NOT NULL DEFAULT 'y',
  `m_field_required` char(1) NOT NULL DEFAULT 'n',
  `m_field_public` char(1) NOT NULL DEFAULT 'y',
  `m_field_reg` char(1) NOT NULL DEFAULT 'n',
  `m_field_cp_reg` char(1) NOT NULL DEFAULT 'n',
  `m_field_fmt` char(5) NOT NULL DEFAULT 'none',
  `m_field_order` int(3) unsigned NOT NULL,
  PRIMARY KEY (`m_field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `exp_member_groups`
-- ----------------------------
DROP TABLE IF EXISTS `exp_member_groups`;
CREATE TABLE `exp_member_groups` (
  `group_id` smallint(4) unsigned NOT NULL,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_title` varchar(100) NOT NULL,
  `group_description` text NOT NULL,
  `is_locked` char(1) NOT NULL DEFAULT 'y',
  `can_view_offline_system` char(1) NOT NULL DEFAULT 'n',
  `can_view_online_system` char(1) NOT NULL DEFAULT 'y',
  `can_access_cp` char(1) NOT NULL DEFAULT 'y',
  `can_access_content` char(1) NOT NULL DEFAULT 'n',
  `can_access_publish` char(1) NOT NULL DEFAULT 'n',
  `can_access_edit` char(1) NOT NULL DEFAULT 'n',
  `can_access_files` char(1) NOT NULL DEFAULT 'n',
  `can_access_fieldtypes` char(1) NOT NULL DEFAULT 'n',
  `can_access_design` char(1) NOT NULL DEFAULT 'n',
  `can_access_addons` char(1) NOT NULL DEFAULT 'n',
  `can_access_modules` char(1) NOT NULL DEFAULT 'n',
  `can_access_extensions` char(1) NOT NULL DEFAULT 'n',
  `can_access_accessories` char(1) NOT NULL DEFAULT 'n',
  `can_access_plugins` char(1) NOT NULL DEFAULT 'n',
  `can_access_members` char(1) NOT NULL DEFAULT 'n',
  `can_access_admin` char(1) NOT NULL DEFAULT 'n',
  `can_access_sys_prefs` char(1) NOT NULL DEFAULT 'n',
  `can_access_content_prefs` char(1) NOT NULL DEFAULT 'n',
  `can_access_tools` char(1) NOT NULL DEFAULT 'n',
  `can_access_comm` char(1) NOT NULL DEFAULT 'n',
  `can_access_utilities` char(1) NOT NULL DEFAULT 'n',
  `can_access_data` char(1) NOT NULL DEFAULT 'n',
  `can_access_logs` char(1) NOT NULL DEFAULT 'n',
  `can_admin_channels` char(1) NOT NULL DEFAULT 'n',
  `can_admin_upload_prefs` char(1) NOT NULL DEFAULT 'n',
  `can_admin_design` char(1) NOT NULL DEFAULT 'n',
  `can_admin_members` char(1) NOT NULL DEFAULT 'n',
  `can_delete_members` char(1) NOT NULL DEFAULT 'n',
  `can_admin_mbr_groups` char(1) NOT NULL DEFAULT 'n',
  `can_admin_mbr_templates` char(1) NOT NULL DEFAULT 'n',
  `can_ban_users` char(1) NOT NULL DEFAULT 'n',
  `can_admin_modules` char(1) NOT NULL DEFAULT 'n',
  `can_admin_templates` char(1) NOT NULL DEFAULT 'n',
  `can_edit_categories` char(1) NOT NULL DEFAULT 'n',
  `can_delete_categories` char(1) NOT NULL DEFAULT 'n',
  `can_view_other_entries` char(1) NOT NULL DEFAULT 'n',
  `can_edit_other_entries` char(1) NOT NULL DEFAULT 'n',
  `can_assign_post_authors` char(1) NOT NULL DEFAULT 'n',
  `can_delete_self_entries` char(1) NOT NULL DEFAULT 'n',
  `can_delete_all_entries` char(1) NOT NULL DEFAULT 'n',
  `can_view_other_comments` char(1) NOT NULL DEFAULT 'n',
  `can_edit_own_comments` char(1) NOT NULL DEFAULT 'n',
  `can_delete_own_comments` char(1) NOT NULL DEFAULT 'n',
  `can_edit_all_comments` char(1) NOT NULL DEFAULT 'n',
  `can_delete_all_comments` char(1) NOT NULL DEFAULT 'n',
  `can_moderate_comments` char(1) NOT NULL DEFAULT 'n',
  `can_send_email` char(1) NOT NULL DEFAULT 'n',
  `can_send_cached_email` char(1) NOT NULL DEFAULT 'n',
  `can_email_member_groups` char(1) NOT NULL DEFAULT 'n',
  `can_email_mailinglist` char(1) NOT NULL DEFAULT 'n',
  `can_email_from_profile` char(1) NOT NULL DEFAULT 'n',
  `can_view_profiles` char(1) NOT NULL DEFAULT 'n',
  `can_edit_html_buttons` char(1) NOT NULL DEFAULT 'n',
  `can_delete_self` char(1) NOT NULL DEFAULT 'n',
  `mbr_delete_notify_emails` varchar(255) DEFAULT NULL,
  `can_post_comments` char(1) NOT NULL DEFAULT 'n',
  `exclude_from_moderation` char(1) NOT NULL DEFAULT 'n',
  `can_search` char(1) NOT NULL DEFAULT 'n',
  `search_flood_control` mediumint(5) unsigned NOT NULL,
  `can_send_private_messages` char(1) NOT NULL DEFAULT 'n',
  `prv_msg_send_limit` smallint(5) unsigned NOT NULL DEFAULT '20',
  `prv_msg_storage_limit` smallint(5) unsigned NOT NULL DEFAULT '60',
  `can_attach_in_private_messages` char(1) NOT NULL DEFAULT 'n',
  `can_send_bulletins` char(1) NOT NULL DEFAULT 'n',
  `include_in_authorlist` char(1) NOT NULL DEFAULT 'n',
  `include_in_memberlist` char(1) NOT NULL DEFAULT 'y',
  `include_in_mailinglists` char(1) NOT NULL DEFAULT 'y',
  PRIMARY KEY (`group_id`,`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `exp_member_groups`
-- ----------------------------
BEGIN;
INSERT INTO `exp_member_groups` VALUES ('1', '1', 'Super Admins', '', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', '', 'y', 'y', 'y', '0', 'y', '20', '60', 'y', 'y', 'y', 'y', 'y'), ('2', '1', 'Banned', '', 'y', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', '', 'n', 'n', 'n', '60', 'n', '20', '60', 'n', 'n', 'n', 'n', 'n'), ('3', '1', 'Guests', '', 'y', 'n', 'y', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'y', 'n', 'n', 'n', 'n', '', 'y', 'n', 'y', '15', 'n', '20', '60', 'n', 'n', 'n', 'n', 'n'), ('4', '1', 'Pending', '', 'y', 'n', 'y', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'y', 'n', 'n', 'n', 'n', '', 'y', 'n', 'y', '15', 'n', '20', '60', 'n', 'n', 'n', 'n', 'n'), ('5', '1', 'Members', '', 'y', 'n', 'y', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'y', 'y', 'y', 'n', '', 'y', 'n', 'y', '10', 'y', '20', '60', 'y', 'n', 'n', 'y', 'y');
COMMIT;

-- ----------------------------
--  Table structure for `exp_member_homepage`
-- ----------------------------
DROP TABLE IF EXISTS `exp_member_homepage`;
CREATE TABLE `exp_member_homepage` (
  `member_id` int(10) unsigned NOT NULL,
  `recent_entries` char(1) NOT NULL DEFAULT 'l',
  `recent_entries_order` int(3) unsigned NOT NULL DEFAULT '0',
  `recent_comments` char(1) NOT NULL DEFAULT 'l',
  `recent_comments_order` int(3) unsigned NOT NULL DEFAULT '0',
  `recent_members` char(1) NOT NULL DEFAULT 'n',
  `recent_members_order` int(3) unsigned NOT NULL DEFAULT '0',
  `site_statistics` char(1) NOT NULL DEFAULT 'r',
  `site_statistics_order` int(3) unsigned NOT NULL DEFAULT '0',
  `member_search_form` char(1) NOT NULL DEFAULT 'n',
  `member_search_form_order` int(3) unsigned NOT NULL DEFAULT '0',
  `notepad` char(1) NOT NULL DEFAULT 'r',
  `notepad_order` int(3) unsigned NOT NULL DEFAULT '0',
  `bulletin_board` char(1) NOT NULL DEFAULT 'r',
  `bulletin_board_order` int(3) unsigned NOT NULL DEFAULT '0',
  `pmachine_news_feed` char(1) NOT NULL DEFAULT 'n',
  `pmachine_news_feed_order` int(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `exp_member_homepage`
-- ----------------------------
BEGIN;
INSERT INTO `exp_member_homepage` VALUES ('1', 'l', '1', 'l', '2', 'n', '0', 'r', '1', 'n', '0', 'r', '2', 'r', '0', 'l', '0');
COMMIT;

-- ----------------------------
--  Table structure for `exp_member_search`
-- ----------------------------
DROP TABLE IF EXISTS `exp_member_search`;
CREATE TABLE `exp_member_search` (
  `search_id` varchar(32) NOT NULL,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `search_date` int(10) unsigned NOT NULL,
  `keywords` varchar(200) NOT NULL,
  `fields` varchar(200) NOT NULL,
  `member_id` int(10) unsigned NOT NULL,
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `total_results` int(8) unsigned NOT NULL,
  `query` text NOT NULL,
  PRIMARY KEY (`search_id`),
  KEY `member_id` (`member_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `exp_members`
-- ----------------------------
DROP TABLE IF EXISTS `exp_members`;
CREATE TABLE `exp_members` (
  `member_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` smallint(4) NOT NULL DEFAULT '0',
  `username` varchar(50) NOT NULL,
  `screen_name` varchar(50) NOT NULL,
  `password` varchar(128) NOT NULL,
  `salt` varchar(128) NOT NULL DEFAULT '',
  `unique_id` varchar(40) NOT NULL,
  `crypt_key` varchar(40) DEFAULT NULL,
  `authcode` varchar(10) DEFAULT NULL,
  `email` varchar(75) NOT NULL,
  `url` varchar(150) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `occupation` varchar(80) DEFAULT NULL,
  `interests` varchar(120) DEFAULT NULL,
  `bday_d` int(2) DEFAULT NULL,
  `bday_m` int(2) DEFAULT NULL,
  `bday_y` int(4) DEFAULT NULL,
  `aol_im` varchar(50) DEFAULT NULL,
  `yahoo_im` varchar(50) DEFAULT NULL,
  `msn_im` varchar(50) DEFAULT NULL,
  `icq` varchar(50) DEFAULT NULL,
  `bio` text,
  `signature` text,
  `avatar_filename` varchar(120) DEFAULT NULL,
  `avatar_width` int(4) unsigned DEFAULT NULL,
  `avatar_height` int(4) unsigned DEFAULT NULL,
  `photo_filename` varchar(120) DEFAULT NULL,
  `photo_width` int(4) unsigned DEFAULT NULL,
  `photo_height` int(4) unsigned DEFAULT NULL,
  `sig_img_filename` varchar(120) DEFAULT NULL,
  `sig_img_width` int(4) unsigned DEFAULT NULL,
  `sig_img_height` int(4) unsigned DEFAULT NULL,
  `ignore_list` text,
  `private_messages` int(4) unsigned NOT NULL DEFAULT '0',
  `accept_messages` char(1) NOT NULL DEFAULT 'y',
  `last_view_bulletins` int(10) NOT NULL DEFAULT '0',
  `last_bulletin_date` int(10) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `join_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_visit` int(10) unsigned NOT NULL DEFAULT '0',
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `total_entries` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `total_comments` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `total_forum_topics` mediumint(8) NOT NULL DEFAULT '0',
  `total_forum_posts` mediumint(8) NOT NULL DEFAULT '0',
  `last_entry_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_comment_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_forum_post_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_email_date` int(10) unsigned NOT NULL DEFAULT '0',
  `in_authorlist` char(1) NOT NULL DEFAULT 'n',
  `accept_admin_email` char(1) NOT NULL DEFAULT 'y',
  `accept_user_email` char(1) NOT NULL DEFAULT 'y',
  `notify_by_default` char(1) NOT NULL DEFAULT 'y',
  `notify_of_pm` char(1) NOT NULL DEFAULT 'y',
  `display_avatars` char(1) NOT NULL DEFAULT 'y',
  `display_signatures` char(1) NOT NULL DEFAULT 'y',
  `parse_smileys` char(1) NOT NULL DEFAULT 'y',
  `smart_notifications` char(1) NOT NULL DEFAULT 'y',
  `language` varchar(50) NOT NULL,
  `timezone` varchar(50) NOT NULL,
  `time_format` char(2) NOT NULL DEFAULT '12',
  `date_format` varchar(8) NOT NULL DEFAULT '%n/%j/%y',
  `include_seconds` char(1) NOT NULL DEFAULT 'n',
  `cp_theme` varchar(32) DEFAULT NULL,
  `profile_theme` varchar(32) DEFAULT NULL,
  `forum_theme` varchar(32) DEFAULT NULL,
  `tracker` text,
  `template_size` varchar(2) NOT NULL DEFAULT '28',
  `notepad` text,
  `notepad_size` varchar(2) NOT NULL DEFAULT '18',
  `quick_links` text,
  `quick_tabs` text,
  `show_sidebar` char(1) NOT NULL DEFAULT 'n',
  `pmember_id` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`member_id`),
  KEY `group_id` (`group_id`),
  KEY `unique_id` (`unique_id`),
  KEY `password` (`password`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `exp_members`
-- ----------------------------
BEGIN;
INSERT INTO `exp_members` VALUES ('1', '1', 'stash', 'Administrator', '2b98db3c9f7dfe35e246f795bfb245e0fd130402a69784f964ab568bee2e2e464c480f6d8be3c9897980552373374d4702496e114b5dcf608efb484ceb00d941', '6(K!gbWVZ\\Zrfud5&iU*\'qUSXm*:ms_]9}3}CPRPB-BN#?<zT]=^D\\aNrZyu)4qbG\\BIgGwocpR]8{V*?+WW=.PK!I;s3|TEI#\\y]s\'nv!D<<hwj~;8PI-uzD8.$erqO', 'fa506bd6c4b9516d7bde337227068fb49d64fe36', 'fe3d4dc59e0d59a50e33452944c94a4ad6c619ac', null, 'wearequickpixel@gmail.com', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', 'y', '0', '0', '127.0.0.1', '1402870081', '1403193155', '1403223949', '19', '0', '0', '0', '1403099253', '0', '0', '0', 'n', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'english', 'America/Los_Angeles', '12', '%n/%j/%y', 'n', null, null, null, null, '28', null, '18', '', null, 'n', '0');
COMMIT;

-- ----------------------------
--  Table structure for `exp_message_attachments`
-- ----------------------------
DROP TABLE IF EXISTS `exp_message_attachments`;
CREATE TABLE `exp_message_attachments` (
  `attachment_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender_id` int(10) unsigned NOT NULL DEFAULT '0',
  `message_id` int(10) unsigned NOT NULL DEFAULT '0',
  `attachment_name` varchar(50) NOT NULL DEFAULT '',
  `attachment_hash` varchar(40) NOT NULL DEFAULT '',
  `attachment_extension` varchar(20) NOT NULL DEFAULT '',
  `attachment_location` varchar(150) NOT NULL DEFAULT '',
  `attachment_date` int(10) unsigned NOT NULL DEFAULT '0',
  `attachment_size` int(10) unsigned NOT NULL DEFAULT '0',
  `is_temp` char(1) NOT NULL DEFAULT 'y',
  PRIMARY KEY (`attachment_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `exp_message_copies`
-- ----------------------------
DROP TABLE IF EXISTS `exp_message_copies`;
CREATE TABLE `exp_message_copies` (
  `copy_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `message_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sender_id` int(10) unsigned NOT NULL DEFAULT '0',
  `recipient_id` int(10) unsigned NOT NULL DEFAULT '0',
  `message_received` char(1) NOT NULL DEFAULT 'n',
  `message_read` char(1) NOT NULL DEFAULT 'n',
  `message_time_read` int(10) unsigned NOT NULL DEFAULT '0',
  `attachment_downloaded` char(1) NOT NULL DEFAULT 'n',
  `message_folder` int(10) unsigned NOT NULL DEFAULT '1',
  `message_authcode` varchar(10) NOT NULL DEFAULT '',
  `message_deleted` char(1) NOT NULL DEFAULT 'n',
  `message_status` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`copy_id`),
  KEY `message_id` (`message_id`),
  KEY `recipient_id` (`recipient_id`),
  KEY `sender_id` (`sender_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `exp_message_data`
-- ----------------------------
DROP TABLE IF EXISTS `exp_message_data`;
CREATE TABLE `exp_message_data` (
  `message_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender_id` int(10) unsigned NOT NULL DEFAULT '0',
  `message_date` int(10) unsigned NOT NULL DEFAULT '0',
  `message_subject` varchar(255) NOT NULL DEFAULT '',
  `message_body` text NOT NULL,
  `message_tracking` char(1) NOT NULL DEFAULT 'y',
  `message_attachments` char(1) NOT NULL DEFAULT 'n',
  `message_recipients` varchar(200) NOT NULL DEFAULT '',
  `message_cc` varchar(200) NOT NULL DEFAULT '',
  `message_hide_cc` char(1) NOT NULL DEFAULT 'n',
  `message_sent_copy` char(1) NOT NULL DEFAULT 'n',
  `total_recipients` int(5) unsigned NOT NULL DEFAULT '0',
  `message_status` varchar(25) NOT NULL DEFAULT '',
  PRIMARY KEY (`message_id`),
  KEY `sender_id` (`sender_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `exp_message_folders`
-- ----------------------------
DROP TABLE IF EXISTS `exp_message_folders`;
CREATE TABLE `exp_message_folders` (
  `member_id` int(10) unsigned NOT NULL DEFAULT '0',
  `folder1_name` varchar(50) NOT NULL DEFAULT 'InBox',
  `folder2_name` varchar(50) NOT NULL DEFAULT 'Sent',
  `folder3_name` varchar(50) NOT NULL DEFAULT '',
  `folder4_name` varchar(50) NOT NULL DEFAULT '',
  `folder5_name` varchar(50) NOT NULL DEFAULT '',
  `folder6_name` varchar(50) NOT NULL DEFAULT '',
  `folder7_name` varchar(50) NOT NULL DEFAULT '',
  `folder8_name` varchar(50) NOT NULL DEFAULT '',
  `folder9_name` varchar(50) NOT NULL DEFAULT '',
  `folder10_name` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `exp_message_folders`
-- ----------------------------
BEGIN;
INSERT INTO `exp_message_folders` VALUES ('1', 'InBox', 'Sent', '', '', '', '', '', '', '', '');
COMMIT;

-- ----------------------------
--  Table structure for `exp_message_listed`
-- ----------------------------
DROP TABLE IF EXISTS `exp_message_listed`;
CREATE TABLE `exp_message_listed` (
  `listed_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(10) unsigned NOT NULL DEFAULT '0',
  `listed_member` int(10) unsigned NOT NULL DEFAULT '0',
  `listed_description` varchar(100) NOT NULL DEFAULT '',
  `listed_type` varchar(10) NOT NULL DEFAULT 'blocked',
  PRIMARY KEY (`listed_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `exp_module_member_groups`
-- ----------------------------
DROP TABLE IF EXISTS `exp_module_member_groups`;
CREATE TABLE `exp_module_member_groups` (
  `group_id` smallint(4) unsigned NOT NULL,
  `module_id` mediumint(5) unsigned NOT NULL,
  PRIMARY KEY (`group_id`,`module_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `exp_modules`
-- ----------------------------
DROP TABLE IF EXISTS `exp_modules`;
CREATE TABLE `exp_modules` (
  `module_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `module_name` varchar(50) NOT NULL,
  `module_version` varchar(12) NOT NULL,
  `has_cp_backend` char(1) NOT NULL DEFAULT 'n',
  `has_publish_fields` char(1) NOT NULL DEFAULT 'n',
  PRIMARY KEY (`module_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `exp_modules`
-- ----------------------------
BEGIN;
INSERT INTO `exp_modules` VALUES ('1', 'Jquery', '1.0', 'n', 'n'), ('2', 'Channel', '2.0.1', 'n', 'n'), ('6', 'File', '1.0.0', 'n', 'n'), ('7', 'Stash', '2.5.3', 'n', 'n');
COMMIT;

-- ----------------------------
--  Table structure for `exp_online_users`
-- ----------------------------
DROP TABLE IF EXISTS `exp_online_users`;
CREATE TABLE `exp_online_users` (
  `online_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `member_id` int(10) NOT NULL DEFAULT '0',
  `in_forum` char(1) NOT NULL DEFAULT 'n',
  `name` varchar(50) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `date` int(10) unsigned NOT NULL DEFAULT '0',
  `anon` char(1) NOT NULL,
  PRIMARY KEY (`online_id`),
  KEY `date` (`date`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `exp_password_lockout`
-- ----------------------------
DROP TABLE IF EXISTS `exp_password_lockout`;
CREATE TABLE `exp_password_lockout` (
  `lockout_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `login_date` int(10) unsigned NOT NULL,
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `username` varchar(50) NOT NULL,
  PRIMARY KEY (`lockout_id`),
  KEY `login_date` (`login_date`),
  KEY `ip_address` (`ip_address`),
  KEY `user_agent` (`user_agent`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `exp_password_lockout`
-- ----------------------------
BEGIN;
INSERT INTO `exp_password_lockout` VALUES ('8', '1403214037', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2059.2 Safari/537.36', 'quickpixel'), ('7', '1403213747', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2059.2 Safari/537.36', 'quickpixel');
COMMIT;

-- ----------------------------
--  Table structure for `exp_relationships`
-- ----------------------------
DROP TABLE IF EXISTS `exp_relationships`;
CREATE TABLE `exp_relationships` (
  `relationship_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `child_id` int(10) unsigned NOT NULL DEFAULT '0',
  `field_id` int(10) unsigned NOT NULL DEFAULT '0',
  `grid_field_id` int(10) unsigned NOT NULL DEFAULT '0',
  `grid_col_id` int(10) unsigned NOT NULL DEFAULT '0',
  `grid_row_id` int(10) unsigned NOT NULL DEFAULT '0',
  `order` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`relationship_id`),
  KEY `parent_id` (`parent_id`),
  KEY `child_id` (`child_id`),
  KEY `field_id` (`field_id`),
  KEY `grid_row_id` (`grid_row_id`)
) ENGINE=MyISAM AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `exp_relationships`
-- ----------------------------
BEGIN;
INSERT INTO `exp_relationships` VALUES ('15', '23', '21', '7', '0', '0', '0', '2'), ('14', '23', '20', '7', '0', '0', '0', '1'), ('18', '24', '19', '7', '0', '0', '0', '3'), ('17', '24', '18', '7', '0', '0', '0', '2'), ('16', '24', '17', '7', '0', '0', '0', '1'), ('21', '25', '19', '7', '0', '0', '0', '3'), ('20', '25', '22', '7', '0', '0', '0', '1'), ('19', '25', '21', '7', '0', '0', '0', '2'), ('22', '26', '17', '7', '0', '0', '0', '1'), ('23', '26', '18', '7', '0', '0', '0', '2'), ('24', '26', '19', '7', '0', '0', '0', '3'), ('25', '27', '21', '7', '0', '0', '0', '1'), ('44', '28', '18', '7', '0', '0', '0', '2'), ('43', '28', '17', '7', '0', '0', '0', '1'), ('28', '29', '21', '7', '0', '0', '0', '1'), ('29', '29', '22', '7', '0', '0', '0', '2'), ('35', '1', '29', '11', '0', '0', '0', '0'), ('31', '9', '23', '11', '0', '0', '0', '0'), ('33', '2', '28', '11', '0', '0', '0', '0'), ('34', '3', '26', '11', '0', '0', '0', '0'), ('51', '30', '25', '11', '0', '0', '0', '3'), ('50', '30', '26', '11', '0', '0', '0', '2'), ('49', '30', '24', '11', '0', '0', '0', '1'), ('42', '32', '29', '11', '0', '0', '0', '1');
COMMIT;

-- ----------------------------
--  Table structure for `exp_remember_me`
-- ----------------------------
DROP TABLE IF EXISTS `exp_remember_me`;
CREATE TABLE `exp_remember_me` (
  `remember_me_id` varchar(40) NOT NULL DEFAULT '0',
  `member_id` int(10) DEFAULT '0',
  `ip_address` varchar(45) DEFAULT '0',
  `user_agent` varchar(120) DEFAULT '',
  `admin_sess` tinyint(1) DEFAULT '0',
  `site_id` int(4) DEFAULT '1',
  `expiration` int(10) DEFAULT '0',
  `last_refresh` int(10) DEFAULT '0',
  PRIMARY KEY (`remember_me_id`),
  KEY `member_id` (`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `exp_reset_password`
-- ----------------------------
DROP TABLE IF EXISTS `exp_reset_password`;
CREATE TABLE `exp_reset_password` (
  `reset_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(10) unsigned NOT NULL,
  `resetcode` varchar(12) NOT NULL,
  `date` int(10) NOT NULL,
  PRIMARY KEY (`reset_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `exp_revision_tracker`
-- ----------------------------
DROP TABLE IF EXISTS `exp_revision_tracker`;
CREATE TABLE `exp_revision_tracker` (
  `tracker_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(10) unsigned NOT NULL,
  `item_table` varchar(20) NOT NULL,
  `item_field` varchar(20) NOT NULL,
  `item_date` int(10) NOT NULL,
  `item_author_id` int(10) unsigned NOT NULL,
  `item_data` mediumtext NOT NULL,
  PRIMARY KEY (`tracker_id`),
  KEY `item_id` (`item_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `exp_security_hashes`
-- ----------------------------
DROP TABLE IF EXISTS `exp_security_hashes`;
CREATE TABLE `exp_security_hashes` (
  `hash_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` int(10) unsigned NOT NULL,
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `hash` varchar(40) NOT NULL,
  PRIMARY KEY (`hash_id`),
  KEY `session_id` (`session_id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `exp_security_hashes`
-- ----------------------------
BEGIN;
INSERT INTO `exp_security_hashes` VALUES ('16', '1403206180', '6e9eb03f782e421e8fcd64d4527f8737897a7592', 'd934eb40bd06af130384789378869ef123330f46');
COMMIT;

-- ----------------------------
--  Table structure for `exp_sessions`
-- ----------------------------
DROP TABLE IF EXISTS `exp_sessions`;
CREATE TABLE `exp_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `member_id` int(10) NOT NULL DEFAULT '0',
  `admin_sess` tinyint(1) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `fingerprint` varchar(40) NOT NULL,
  `sess_start` int(10) unsigned NOT NULL DEFAULT '0',
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`session_id`),
  KEY `member_id` (`member_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `exp_sites`
-- ----------------------------
DROP TABLE IF EXISTS `exp_sites`;
CREATE TABLE `exp_sites` (
  `site_id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `site_label` varchar(100) NOT NULL DEFAULT '',
  `site_name` varchar(50) NOT NULL DEFAULT '',
  `site_description` text,
  `site_system_preferences` mediumtext NOT NULL,
  `site_mailinglist_preferences` text NOT NULL,
  `site_member_preferences` text NOT NULL,
  `site_template_preferences` text NOT NULL,
  `site_channel_preferences` text NOT NULL,
  `site_bootstrap_checksums` text NOT NULL,
  PRIMARY KEY (`site_id`),
  KEY `site_name` (`site_name`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `exp_sites`
-- ----------------------------
BEGIN;
INSERT INTO `exp_sites` VALUES ('1', 'Everyday Stash', 'default_site', null, 'YTo4ODp7czoxMDoic2l0ZV9pbmRleCI7czo5OiJpbmRleC5waHAiO3M6ODoic2l0ZV91cmwiO3M6MjU6Imh0dHA6Ly9ldmVyeWRheXN0YXNoLmRldi8iO3M6MTY6InRoZW1lX2ZvbGRlcl91cmwiO3M6MzI6Imh0dHA6Ly9ldmVyeWRheXN0YXNoLmRldi90aGVtZXMvIjtzOjE1OiJ3ZWJtYXN0ZXJfZW1haWwiO3M6MjU6IndlYXJlcXVpY2twaXhlbEBnbWFpbC5jb20iO3M6MTQ6IndlYm1hc3Rlcl9uYW1lIjtzOjA6IiI7czoyMDoiY2hhbm5lbF9ub21lbmNsYXR1cmUiO3M6NzoiY2hhbm5lbCI7czoxMDoibWF4X2NhY2hlcyI7czozOiIxNTAiO3M6MTE6ImNhcHRjaGFfdXJsIjtzOjQxOiJodHRwOi8vZXZlcnlkYXlzdGFzaC5kZXYvaW1hZ2VzL2NhcHRjaGFzLyI7czoxMjoiY2FwdGNoYV9wYXRoIjtzOjE6Ii8iO3M6MTI6ImNhcHRjaGFfZm9udCI7czoxOiJ5IjtzOjEyOiJjYXB0Y2hhX3JhbmQiO3M6MToieSI7czoyMzoiY2FwdGNoYV9yZXF1aXJlX21lbWJlcnMiO3M6MToibiI7czoxNzoiZW5hYmxlX2RiX2NhY2hpbmciO3M6MToibiI7czoxODoiZW5hYmxlX3NxbF9jYWNoaW5nIjtzOjE6Im4iO3M6MTg6ImZvcmNlX3F1ZXJ5X3N0cmluZyI7czoxOiJuIjtzOjEzOiJzaG93X3Byb2ZpbGVyIjtzOjE6Im4iO3M6MTg6InRlbXBsYXRlX2RlYnVnZ2luZyI7czoxOiJuIjtzOjE1OiJpbmNsdWRlX3NlY29uZHMiO3M6MToibiI7czoxMzoiY29va2llX2RvbWFpbiI7czowOiIiO3M6MTE6ImNvb2tpZV9wYXRoIjtzOjA6IiI7czoyMDoid2Vic2l0ZV9zZXNzaW9uX3R5cGUiO3M6MToiYyI7czoxNToiY3Bfc2Vzc2lvbl90eXBlIjtzOjI6ImNzIjtzOjIxOiJhbGxvd191c2VybmFtZV9jaGFuZ2UiO3M6MToieSI7czoxODoiYWxsb3dfbXVsdGlfbG9naW5zIjtzOjE6InkiO3M6MTY6InBhc3N3b3JkX2xvY2tvdXQiO3M6MToieSI7czoyNToicGFzc3dvcmRfbG9ja291dF9pbnRlcnZhbCI7czoxOiIxIjtzOjIwOiJyZXF1aXJlX2lwX2Zvcl9sb2dpbiI7czoxOiJ5IjtzOjIyOiJyZXF1aXJlX2lwX2Zvcl9wb3N0aW5nIjtzOjE6InkiO3M6MjQ6InJlcXVpcmVfc2VjdXJlX3Bhc3N3b3JkcyI7czoxOiJuIjtzOjE5OiJhbGxvd19kaWN0aW9uYXJ5X3B3IjtzOjE6InkiO3M6MjM6Im5hbWVfb2ZfZGljdGlvbmFyeV9maWxlIjtzOjA6IiI7czoxNzoieHNzX2NsZWFuX3VwbG9hZHMiO3M6MToieSI7czoxNToicmVkaXJlY3RfbWV0aG9kIjtzOjg6InJlZGlyZWN0IjtzOjk6ImRlZnRfbGFuZyI7czo3OiJlbmdsaXNoIjtzOjg6InhtbF9sYW5nIjtzOjI6ImVuIjtzOjEyOiJzZW5kX2hlYWRlcnMiO3M6MToieSI7czoxMToiZ3ppcF9vdXRwdXQiO3M6MToibiI7czoxMzoibG9nX3JlZmVycmVycyI7czoxOiJuIjtzOjEzOiJtYXhfcmVmZXJyZXJzIjtzOjM6IjUwMCI7czoxMToiZGF0ZV9mb3JtYXQiO3M6ODoiJW4vJWovJXkiO3M6MTE6InRpbWVfZm9ybWF0IjtzOjI6IjEyIjtzOjEzOiJzZXJ2ZXJfb2Zmc2V0IjtzOjA6IiI7czoyMToiZGVmYXVsdF9zaXRlX3RpbWV6b25lIjtzOjE5OiJBbWVyaWNhL0xvc19BbmdlbGVzIjtzOjEzOiJtYWlsX3Byb3RvY29sIjtzOjQ6Im1haWwiO3M6MTE6InNtdHBfc2VydmVyIjtzOjA6IiI7czoxMzoic210cF91c2VybmFtZSI7czowOiIiO3M6MTM6InNtdHBfcGFzc3dvcmQiO3M6MDoiIjtzOjExOiJlbWFpbF9kZWJ1ZyI7czoxOiJuIjtzOjEzOiJlbWFpbF9jaGFyc2V0IjtzOjU6InV0Zi04IjtzOjE1OiJlbWFpbF9iYXRjaG1vZGUiO3M6MToibiI7czoxNjoiZW1haWxfYmF0Y2hfc2l6ZSI7czowOiIiO3M6MTE6Im1haWxfZm9ybWF0IjtzOjU6InBsYWluIjtzOjk6IndvcmRfd3JhcCI7czoxOiJ5IjtzOjIyOiJlbWFpbF9jb25zb2xlX3RpbWVsb2NrIjtzOjE6IjUiO3M6MjI6ImxvZ19lbWFpbF9jb25zb2xlX21zZ3MiO3M6MToieSI7czo4OiJjcF90aGVtZSI7czo3OiJkZWZhdWx0IjtzOjIxOiJlbWFpbF9tb2R1bGVfY2FwdGNoYXMiO3M6MToibiI7czoxNjoibG9nX3NlYXJjaF90ZXJtcyI7czoxOiJ5IjtzOjE5OiJkZW55X2R1cGxpY2F0ZV9kYXRhIjtzOjE6InkiO3M6MjQ6InJlZGlyZWN0X3N1Ym1pdHRlZF9saW5rcyI7czoxOiJuIjtzOjE2OiJlbmFibGVfY2Vuc29yaW5nIjtzOjE6Im4iO3M6MTQ6ImNlbnNvcmVkX3dvcmRzIjtzOjA6IiI7czoxODoiY2Vuc29yX3JlcGxhY2VtZW50IjtzOjA6IiI7czoxMDoiYmFubmVkX2lwcyI7czowOiIiO3M6MTM6ImJhbm5lZF9lbWFpbHMiO3M6MDoiIjtzOjE2OiJiYW5uZWRfdXNlcm5hbWVzIjtzOjA6IiI7czoxOToiYmFubmVkX3NjcmVlbl9uYW1lcyI7czowOiIiO3M6MTA6ImJhbl9hY3Rpb24iO3M6ODoicmVzdHJpY3QiO3M6MTE6ImJhbl9tZXNzYWdlIjtzOjM0OiJUaGlzIHNpdGUgaXMgY3VycmVudGx5IHVuYXZhaWxhYmxlIjtzOjE1OiJiYW5fZGVzdGluYXRpb24iO3M6MjE6Imh0dHA6Ly93d3cueWFob28uY29tLyI7czoxNjoiZW5hYmxlX2Vtb3RpY29ucyI7czoxOiJ5IjtzOjEyOiJlbW90aWNvbl91cmwiO3M6NDA6Imh0dHA6Ly9ldmVyeWRheXN0YXNoLmRldi9pbWFnZXMvc21pbGV5cy8iO3M6MTk6InJlY291bnRfYmF0Y2hfdG90YWwiO3M6NDoiMTAwMCI7czoxNzoibmV3X3ZlcnNpb25fY2hlY2siO3M6MToieSI7czoxNzoiZW5hYmxlX3Rocm90dGxpbmciO3M6MToibiI7czoxNzoiYmFuaXNoX21hc2tlZF9pcHMiO3M6MToieSI7czoxNDoibWF4X3BhZ2VfbG9hZHMiO3M6MjoiMTAiO3M6MTM6InRpbWVfaW50ZXJ2YWwiO3M6MToiOCI7czoxMjoibG9ja291dF90aW1lIjtzOjI6IjMwIjtzOjE1OiJiYW5pc2htZW50X3R5cGUiO3M6NzoibWVzc2FnZSI7czoxNDoiYmFuaXNobWVudF91cmwiO3M6MDoiIjtzOjE4OiJiYW5pc2htZW50X21lc3NhZ2UiO3M6NTA6IllvdSBoYXZlIGV4Y2VlZGVkIHRoZSBhbGxvd2VkIHBhZ2UgbG9hZCBmcmVxdWVuY3kuIjtzOjE3OiJlbmFibGVfc2VhcmNoX2xvZyI7czoxOiJ5IjtzOjE5OiJtYXhfbG9nZ2VkX3NlYXJjaGVzIjtzOjM6IjUwMCI7czoxNzoidGhlbWVfZm9sZGVyX3BhdGgiO3M6MToiLyI7czoxMDoiaXNfc2l0ZV9vbiI7czoxOiJ5IjtzOjExOiJydGVfZW5hYmxlZCI7czoxOiJuIjtzOjIyOiJydGVfZGVmYXVsdF90b29sc2V0X2lkIjtzOjE6IjEiO30=', 'YTozOntzOjE5OiJtYWlsaW5nbGlzdF9lbmFibGVkIjtzOjE6InkiO3M6MTg6Im1haWxpbmdsaXN0X25vdGlmeSI7czoxOiJuIjtzOjI1OiJtYWlsaW5nbGlzdF9ub3RpZnlfZW1haWxzIjtzOjA6IiI7fQ==', 'YTo0NDp7czoxMDoidW5fbWluX2xlbiI7czoxOiI0IjtzOjEwOiJwd19taW5fbGVuIjtzOjE6IjUiO3M6MjU6ImFsbG93X21lbWJlcl9yZWdpc3RyYXRpb24iO3M6MToibiI7czoyNToiYWxsb3dfbWVtYmVyX2xvY2FsaXphdGlvbiI7czoxOiJ5IjtzOjE4OiJyZXFfbWJyX2FjdGl2YXRpb24iO3M6NToiZW1haWwiO3M6MjM6Im5ld19tZW1iZXJfbm90aWZpY2F0aW9uIjtzOjE6Im4iO3M6MjM6Im1icl9ub3RpZmljYXRpb25fZW1haWxzIjtzOjA6IiI7czoyNDoicmVxdWlyZV90ZXJtc19vZl9zZXJ2aWNlIjtzOjE6InkiO3M6MjI6InVzZV9tZW1iZXJzaGlwX2NhcHRjaGEiO3M6MToibiI7czoyMDoiZGVmYXVsdF9tZW1iZXJfZ3JvdXAiO3M6MToiNSI7czoxNToicHJvZmlsZV90cmlnZ2VyIjtzOjY6Im1lbWJlciI7czoxMjoibWVtYmVyX3RoZW1lIjtzOjc6ImRlZmF1bHQiO3M6MTQ6ImVuYWJsZV9hdmF0YXJzIjtzOjE6InkiO3M6MjA6ImFsbG93X2F2YXRhcl91cGxvYWRzIjtzOjE6Im4iO3M6MTA6ImF2YXRhcl91cmwiO3M6NDA6Imh0dHA6Ly9ldmVyeWRheXN0YXNoLmRldi9pbWFnZXMvYXZhdGFycy8iO3M6MTE6ImF2YXRhcl9wYXRoIjtzOjE6Ii8iO3M6MTY6ImF2YXRhcl9tYXhfd2lkdGgiO3M6MzoiMTAwIjtzOjE3OiJhdmF0YXJfbWF4X2hlaWdodCI7czozOiIxMDAiO3M6MTM6ImF2YXRhcl9tYXhfa2IiO3M6MjoiNTAiO3M6MTM6ImVuYWJsZV9waG90b3MiO3M6MToibiI7czo5OiJwaG90b191cmwiO3M6NDY6Imh0dHA6Ly9ldmVyeWRheXN0YXNoLmRldi9pbWFnZXMvbWVtYmVyX3Bob3Rvcy8iO3M6MTA6InBob3RvX3BhdGgiO3M6MToiLyI7czoxNToicGhvdG9fbWF4X3dpZHRoIjtzOjM6IjEwMCI7czoxNjoicGhvdG9fbWF4X2hlaWdodCI7czozOiIxMDAiO3M6MTI6InBob3RvX21heF9rYiI7czoyOiI1MCI7czoxNjoiYWxsb3dfc2lnbmF0dXJlcyI7czoxOiJ5IjtzOjEzOiJzaWdfbWF4bGVuZ3RoIjtzOjM6IjUwMCI7czoyMToic2lnX2FsbG93X2ltZ19ob3RsaW5rIjtzOjE6Im4iO3M6MjA6InNpZ19hbGxvd19pbWdfdXBsb2FkIjtzOjE6Im4iO3M6MTE6InNpZ19pbWdfdXJsIjtzOjU0OiJodHRwOi8vZXZlcnlkYXlzdGFzaC5kZXYvaW1hZ2VzL3NpZ25hdHVyZV9hdHRhY2htZW50cy8iO3M6MTI6InNpZ19pbWdfcGF0aCI7czoxOiIvIjtzOjE3OiJzaWdfaW1nX21heF93aWR0aCI7czozOiI0ODAiO3M6MTg6InNpZ19pbWdfbWF4X2hlaWdodCI7czoyOiI4MCI7czoxNDoic2lnX2ltZ19tYXhfa2IiO3M6MjoiMzAiO3M6MTk6InBydl9tc2dfdXBsb2FkX3BhdGgiO3M6MToiLyI7czoyMzoicHJ2X21zZ19tYXhfYXR0YWNobWVudHMiO3M6MToiMyI7czoyMjoicHJ2X21zZ19hdHRhY2hfbWF4c2l6ZSI7czozOiIyNTAiO3M6MjA6InBydl9tc2dfYXR0YWNoX3RvdGFsIjtzOjM6IjEwMCI7czoxOToicHJ2X21zZ19odG1sX2Zvcm1hdCI7czo0OiJzYWZlIjtzOjE4OiJwcnZfbXNnX2F1dG9fbGlua3MiO3M6MToieSI7czoxNzoicHJ2X21zZ19tYXhfY2hhcnMiO3M6NDoiNjAwMCI7czoxOToibWVtYmVybGlzdF9vcmRlcl9ieSI7czoxMToidG90YWxfcG9zdHMiO3M6MjE6Im1lbWJlcmxpc3Rfc29ydF9vcmRlciI7czo0OiJkZXNjIjtzOjIwOiJtZW1iZXJsaXN0X3Jvd19saW1pdCI7czoyOiIyMCI7fQ==', 'YTo3OntzOjIyOiJlbmFibGVfdGVtcGxhdGVfcm91dGVzIjtzOjE6InkiO3M6MTE6InN0cmljdF91cmxzIjtzOjE6InkiO3M6ODoic2l0ZV80MDQiO3M6MDoiIjtzOjE5OiJzYXZlX3RtcGxfcmV2aXNpb25zIjtzOjE6Im4iO3M6MTg6Im1heF90bXBsX3JldmlzaW9ucyI7czoxOiI1IjtzOjE1OiJzYXZlX3RtcGxfZmlsZXMiO3M6MToibiI7czoxODoidG1wbF9maWxlX2Jhc2VwYXRoIjtzOjE6Ii8iO30=', 'YTo5OntzOjIxOiJpbWFnZV9yZXNpemVfcHJvdG9jb2wiO3M6MzoiZ2QyIjtzOjE4OiJpbWFnZV9saWJyYXJ5X3BhdGgiO3M6MDoiIjtzOjE2OiJ0aHVtYm5haWxfcHJlZml4IjtzOjU6InRodW1iIjtzOjE0OiJ3b3JkX3NlcGFyYXRvciI7czo0OiJkYXNoIjtzOjE3OiJ1c2VfY2F0ZWdvcnlfbmFtZSI7czoxOiJuIjtzOjIyOiJyZXNlcnZlZF9jYXRlZ29yeV93b3JkIjtzOjg6ImNhdGVnb3J5IjtzOjIzOiJhdXRvX2NvbnZlcnRfaGlnaF9hc2NpaSI7czoxOiJuIjtzOjIyOiJuZXdfcG9zdHNfY2xlYXJfY2FjaGVzIjtzOjE6InkiO3M6MjM6ImF1dG9fYXNzaWduX2NhdF9wYXJlbnRzIjtzOjE6InkiO30=', 'YToxOntzOjk5OiIvVXNlcnMvcGVsaWFzL0Ryb3Bib3gvQ29kZS9SZXBvc2l0b3JpZXMvR0lUL3ByZXNlbnRhdGlvbnMvZWVjbXMtZXZlcnktZGF5LXN0YXNoLTAyL3B1YmxpYy9pbmRleC5waHAiO3M6MzI6IjYxOTU3ZjI0MzI5MDk0Njg1M2JmYTc1NGQyMzc3NjgwIjt9');
COMMIT;

-- ----------------------------
--  Table structure for `exp_snippets`
-- ----------------------------
DROP TABLE IF EXISTS `exp_snippets`;
CREATE TABLE `exp_snippets` (
  `snippet_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) NOT NULL,
  `snippet_name` varchar(75) NOT NULL,
  `snippet_contents` text,
  PRIMARY KEY (`snippet_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `exp_specialty_templates`
-- ----------------------------
DROP TABLE IF EXISTS `exp_specialty_templates`;
CREATE TABLE `exp_specialty_templates` (
  `template_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `enable_template` char(1) NOT NULL DEFAULT 'y',
  `template_name` varchar(50) NOT NULL,
  `data_title` varchar(80) NOT NULL,
  `template_data` text NOT NULL,
  PRIMARY KEY (`template_id`),
  KEY `template_name` (`template_name`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `exp_specialty_templates`
-- ----------------------------
BEGIN;
INSERT INTO `exp_specialty_templates` VALUES ('1', '1', 'y', 'offline_template', '', '<html>\n<head>\n\n<title>System Offline</title>\n\n<style type=\"text/css\">\n\nbody {\nbackground-color:	#ffffff;\nmargin:				50px;\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size:			11px;\ncolor:				#000;\nbackground-color:	#fff;\n}\n\na {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-weight:		bold;\nletter-spacing:		.09em;\ntext-decoration:	none;\ncolor:			  #330099;\nbackground-color:	transparent;\n}\n\na:visited {\ncolor:				#330099;\nbackground-color:	transparent;\n}\n\na:hover {\ncolor:				#000;\ntext-decoration:	underline;\nbackground-color:	transparent;\n}\n\n#content  {\nborder:				#999999 1px solid;\npadding:			22px 25px 14px 25px;\n}\n\nh1 {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-weight:		bold;\nfont-size:			14px;\ncolor:				#000;\nmargin-top: 		0;\nmargin-bottom:		14px;\n}\n\np {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size: 			12px;\nfont-weight: 		normal;\nmargin-top: 		12px;\nmargin-bottom: 		14px;\ncolor: 				#000;\n}\n</style>\n\n</head>\n\n<body>\n\n<div id=\"content\">\n\n<h1>System Offline</h1>\n\n<p>This site is currently offline</p>\n\n</div>\n\n</body>\n\n</html>'), ('2', '1', 'y', 'message_template', '', '<html>\n<head>\n\n<title>{title}</title>\n\n<meta http-equiv=\'content-type\' content=\'text/html; charset={charset}\' />\n\n{meta_refresh}\n\n<style type=\"text/css\">\n\nbody {\nbackground-color:	#ffffff;\nmargin:				50px;\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size:			11px;\ncolor:				#000;\nbackground-color:	#fff;\n}\n\na {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nletter-spacing:		.09em;\ntext-decoration:	none;\ncolor:			  #330099;\nbackground-color:	transparent;\n}\n\na:visited {\ncolor:				#330099;\nbackground-color:	transparent;\n}\n\na:active {\ncolor:				#ccc;\nbackground-color:	transparent;\n}\n\na:hover {\ncolor:				#000;\ntext-decoration:	underline;\nbackground-color:	transparent;\n}\n\n#content  {\nborder:				#000 1px solid;\nbackground-color: 	#DEDFE3;\npadding:			22px 25px 14px 25px;\n}\n\nh1 {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-weight:		bold;\nfont-size:			14px;\ncolor:				#000;\nmargin-top: 		0;\nmargin-bottom:		14px;\n}\n\np {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size: 			12px;\nfont-weight: 		normal;\nmargin-top: 		12px;\nmargin-bottom: 		14px;\ncolor: 				#000;\n}\n\nul {\nmargin-bottom: 		16px;\n}\n\nli {\nlist-style:			square;\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size: 			12px;\nfont-weight: 		normal;\nmargin-top: 		8px;\nmargin-bottom: 		8px;\ncolor: 				#000;\n}\n\n</style>\n\n</head>\n\n<body>\n\n<div id=\"content\">\n\n<h1>{heading}</h1>\n\n{content}\n\n<p>{link}</p>\n\n</div>\n\n</body>\n\n</html>'), ('3', '1', 'y', 'admin_notify_reg', 'Notification of new member registration', 'New member registration site: {site_name}\n\nScreen name: {name}\nUser name: {username}\nEmail: {email}\n\nYour control panel URL: {control_panel_url}'), ('4', '1', 'y', 'admin_notify_entry', 'A new channel entry has been posted', 'A new entry has been posted in the following channel:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nPosted by: {name}\nEmail: {email}\n\nTo read the entry please visit:\n{entry_url}\n'), ('5', '1', 'y', 'admin_notify_mailinglist', 'Someone has subscribed to your mailing list', 'A new mailing list subscription has been accepted.\n\nEmail Address: {email}\nMailing List: {mailing_list}'), ('6', '1', 'y', 'admin_notify_comment', 'You have just received a comment', 'You have just received a comment for the following channel:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nLocated at:\n{comment_url}\n\nPosted by: {name}\nEmail: {email}\nURL: {url}\nLocation: {location}\n\n{comment}'), ('7', '1', 'y', 'mbr_activation_instructions', 'Enclosed is your activation code', 'Thank you for your new member registration.\n\nTo activate your new account, please visit the following URL:\n\n{unwrap}{activation_url}{/unwrap}\n\nThank You!\n\n{site_name}\n\n{site_url}'), ('8', '1', 'y', 'forgot_password_instructions', 'Login information', '{name},\n\nTo reset your password, please go to the following page:\n\n{reset_url}\n\nThen log in with your username: {username}\n\nIf you do not wish to reset your password, ignore this message. It will expire in 24 hours.\n\n{site_name}\n{site_url}'), ('9', '1', 'y', 'validated_member_notify', 'Your membership account has been activated', '{name},\n\nYour membership account has been activated and is ready for use.\n\nThank You!\n\n{site_name}\n{site_url}'), ('10', '1', 'y', 'decline_member_validation', 'Your membership account has been declined', '{name},\n\nWe\'re sorry but our staff has decided not to validate your membership.\n\n{site_name}\n{site_url}'), ('11', '1', 'y', 'mailinglist_activation_instructions', 'Email Confirmation', 'Thank you for joining the \"{mailing_list}\" mailing list!\n\nPlease click the link below to confirm your email.\n\nIf you do not want to be added to our list, ignore this email.\n\n{unwrap}{activation_url}{/unwrap}\n\nThank You!\n\n{site_name}'), ('12', '1', 'y', 'comment_notification', 'Someone just responded to your comment', '{name_of_commenter} just responded to the entry you subscribed to at:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nYou can see the comment at the following URL:\n{comment_url}\n\n{comment}\n\nTo stop receiving notifications for this comment, click here:\n{notification_removal_url}'), ('13', '1', 'y', 'comments_opened_notification', 'New comments have been added', 'Responses have been added to the entry you subscribed to at:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nYou can see the comments at the following URL:\n{comment_url}\n\n{comments}\n{comment}\n{/comments}\n\nTo stop receiving notifications for this entry, click here:\n{notification_removal_url}'), ('14', '1', 'y', 'private_message_notification', 'Someone has sent you a Private Message', '\n{recipient_name},\n\n{sender_name} has just sent you a Private Message titled ‘{message_subject}’.\n\nYou can see the Private Message by logging in and viewing your inbox at:\n{site_url}\n\nContent:\n\n{message_content}\n\nTo stop receiving notifications of Private Messages, turn the option off in your Email Settings.\n\n{site_name}\n{site_url}'), ('15', '1', 'y', 'pm_inbox_full', 'Your private message mailbox is full', '{recipient_name},\n\n{sender_name} has just attempted to send you a Private Message,\nbut your inbox is full, exceeding the maximum of {pm_storage_limit}.\n\nPlease log in and remove unwanted messages from your inbox at:\n{site_url}');
COMMIT;

-- ----------------------------
--  Table structure for `exp_stash`
-- ----------------------------
DROP TABLE IF EXISTS `exp_stash`;
CREATE TABLE `exp_stash` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `session_id` varchar(40) DEFAULT NULL,
  `bundle_id` int(11) unsigned NOT NULL DEFAULT '1',
  `key_name` varchar(255) NOT NULL,
  `key_label` varchar(255) DEFAULT NULL,
  `created` int(10) unsigned NOT NULL,
  `expire` int(10) unsigned NOT NULL DEFAULT '0',
  `parameters` mediumtext,
  PRIMARY KEY (`id`),
  KEY `bundle_id` (`bundle_id`),
  KEY `key_session` (`key_name`,`session_id`),
  KEY `key_name` (`key_name`),
  KEY `site_id` (`site_id`),
  CONSTRAINT `exp_stash_fk` FOREIGN KEY (`bundle_id`) REFERENCES `exp_stash_bundles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `exp_stash`
-- ----------------------------
BEGIN;
INSERT INTO `exp_stash` VALUES ('7', '1', '_global', '2', 'models:md_page_fields', 'models:md_page_fields', '1403217460', '1403303860', '{!-- ===========================================================================\n  FILE: public/assets/ee/views/stash/models/md_page_fields.html\n  TYPE: Stash Model\n  DEPENDENCIES: Stash\n  DESCRIPTION: Global page entry variables\n============================================================================ --}\n  {exp:stash:set}\n\n    {!-- Moar abstractions --}\n    {stash:embed:models:md_global_fields\n      parse=\"no\"\n      process=\"start\"\n    }\n\n    {!-- Grab the shared custom field group\'s fields --}\n    {stash:embed:models:md_shared_fields\n      parse=\"no\"\n      process=\"start\"\n    }\n\n  {/exp:stash:set}\n\n  {!-- Set lists from looping field types --}\n  {exp:stash:set_list\n    name=\"featured_work\"\n    parse_tags=\"yes\"\n    parse_depth=\"2\"\n  }\n\n    {!-- This is a Relationship field --}\n    {cf_shared_featured_work}\n      {stash:channel_name}{cf_shared_featured_work:channel_name}{/stash:channel_name}\n      {stash:entry_id}{cf_shared_featured_work:entry_id}{/stash:entry_id}\n      {stash:title}{cf_shared_featured_work:title}{/stash:title}\n      {stash:content}{cf_shared_featured_work:cf_port_description}{/stash:content}\n\n      {!-- Nested Grid field --}\n      {exp:stash:set_list:nested\n        name=\"featured_gallery\"\n        context=\"{cf_shared_featured_work:entry_id}\"\n        parse_tags=\"yes\"\n      }\n        {cf_shared_featured_work:cf_port_gallery}\n          {stash:caption}{cf_port_gallery:caption}{/stash:caption}\n          {stash:image}{cf_port_gallery:image}{/stash:image}\n        {/cf_shared_featured_work:cf_port_gallery}\n      {/exp:stash:set_list:nested}\n    {/cf_shared_featured_work}\n\n  {/exp:stash:set_list}'), ('9', '1', '_global', '2', 'snippets:sn_global_fields', 'snippets:sn_global_fields', '1403216525', '1403302925', '{!-- ===========================================================================\n  FILE: public/assets/ee/views/stash/snippets/sn_global_fields.html\n  TYPE: Stash Model\n  DEPENDENCIES: Stash\n  DESCRIPTION: Global fields used across channel entries\n============================================================================ --}\n{stash:channel_name}{channel_name}{/stash:channel_name}\n{stash:author}{author}{/stash:author}\n{stash:entry_date}{entry_date format=\"%F %d, %Y\"}{/stash:entry_date}\n{stash:entry_id}{entry_id}{/stash:entry_id}\n{stash:url_title}{url_title}{/stash:url_title}\n{stash:title}{title}{/stash:title}'), ('11', '1', '_global', '2', 'partials:_global_header', 'partials:_global_header', '1403223237', '1403309637', '{!-- ===========================================================================\n  FILE: public/assets/ee/views/stash/partials/_global_header.html\n  TYPE: Template Partial\n  DEPENDENCIES: Stash\n  DESCRIPTION: Global header shared across the site\n============================================================================ --}\n<!DOCTYPE html>\n<html>\n  <head>\n    <title>\n      {if {exp:stash:not_empty name=\"title\"}}\n        {stash:title} |\n      {/if}\n      {if {exp:stash:not_empty name=\"seo_title\"}}\n        {stash:seo_title} |\n      {/if}\n      {site_name}\n    </title>\n    <link rel=\"stylesheet\" href=\"/assets/css/main.css\">\n  </head>\n  <body>\n    <header id=\"top\" class=\"page-header\">\n      <h1 class=\"logo\">\n        <a href=\"{site_url}\">{site_name}</a>\n      </h1>\n      <nav>\n        {stash:embed:snippets:sn_navigation\n          parse=\"no\"\n          process=\"start\"\n        }\n      </nav>\n    </header>\n\n    <hr>\n\n'), ('12', '1', '_global', '2', 'partials:_global_footer', 'partials:_global_footer', '1403223190', '1403309590', '{!-- ===========================================================================\n  FILE: public/assets/ee/views/stash/partials/_global_footer.html\n  TYPE: Template Partial\n  DEPENDENCIES:\n  DESCRIPTION: Global footer shared across the site\n============================================================================ --}\n    <hr>\n\n    <footer class=\"page-footer\" role=\"contentinfo\">\n      <p class=\"copyright\">Copyright &copy; {current_time format=\"%Y\"} {site_name}. All rights reserved.</p>\n\n      {stash:embed:snippets:sn_navigation\n        parse=\"no\"\n        process=\"start\"\n      }\n\n      <a href=\"#top\">^ Back to Top</a>\n    </footer> <!-- /END .page-footer -->\n\n    {!-- === Global JavaScript ============================================= --}\n    <script src=\"/assets/js/main.js\"></script>\n  </body>\n</html>'), ('13', '1', '_global', '2', 'snippets:sn_navigation', 'snippets:sn_navigation', '1403200068', '1403286468', '{!-- ===========================================================================\n  FILE: public/assets/ee/views/stash/snippets/sn_navigation.html\n  TYPE: Stash Snippet\n  DEPENDENCIES: Stash\n  DESCRIPTION: Global navigation items. This could be a list, NavEE/Structure tag, etc.\n============================================================================ --}\n<ul>\n  <li><a href=\"{site_url}about\">About</a></li>\n  <li><a href=\"{site_url}services\">Services</a></li>\n  <li><a href=\"{site_url}work\">Work</a></li>\n  <li><a href=\"{site_url}blog\">Blog</a></li>\n</ul>'), ('14', '1', '_global', '2', 'models:md_global_fields', 'models:md_global_fields', '1403216821', '1403303221', '{!-- ===========================================================================\n  FILE: public/assets/ee/views/stash/snippets/sn_global_fields.html\n  TYPE: Stash Model\n  DEPENDENCIES: Stash\n  DESCRIPTION: Global fields used across channel entries\n============================================================================ --}\n{stash:channel_name}{channel_name}{/stash:channel_name}\n{stash:entry_id}{entry_id}{/stash:entry_id}\n{stash:url_title}{url_title}{/stash:url_title}\n{stash:title}{title}{/stash:title}\n{stash:author}{author}{/stash:author}\n{stash:entry_date}{entry_date format=\"%F %d, %Y\"}{/stash:entry_date}'), ('15', '1', '_global', '2', 'models:md_shared_fields', 'models:md_shared_fields', '1403219752', '1403306152', '{!-- ===========================================================================\n  FILE: public/assets/ee/views/stash/models/md_shared_fields.html\n  TYPE: Stash Model\n  DEPENDENCIES: Stash\n  DESCRIPTION: Global fields used across channel entries\n============================================================================ --}\n{stash:categories}{categories backspace=\"2\"}{category_name}, {/categories}{/stash:categories}\n{stash:teaser}{cf_shared_teaser}{/stash:teaser}\n{stash:image}{cf_shared_image}{/stash:image}\n{stash:content}{cf_shared_body}{/stash:content}\n'), ('16', '1', '_global', '2', 'snippets:sn_featured_work_band', 'snippets:sn_featured_work_band', '1403220396', '1403306796', '{!-- ===========================================================================\n  FILE: public/assets/ee/views/stash/snippets/sn_featured_work_band.html\n  TYPE: Stash Snippet\n  DEPENDENCIES: Stash\n  DESCRIPTION: Featured Work band found on content entries\n============================================================================ --}\n{exp:stash:get_list\n  name=\"featured_work\"\n  compress=\"yes\"\n  prefix=\"list\"\n  orderby=\"random\"\n}\n  {if list:no_results}\n    <p class=\"notice\">Sorry, we can\'t display any Featured Work.</p>\n  {/if}\n\n  {if list:count == 1}\n    <ul>\n  {/if}\n      <li>\n        {if list:title}\n          <h2>{list:title}</h2>\n        {/if}\n\n        {if list:content}\n          {list:content}\n        {/if}\n\n        {exp:stash:get_list:nested\n          name=\"featured_gallery\"\n          context=\"{list:entry_id}\"\n          compress=\"yes\"\n          prefix=\"nested\"\n          limit=\"1\"\n          sort=\"asc\"\n        }\n          {if nested:no_results}\n            <p class=\"notice\">Sorry, we can\'t display an Image Gallery.</p>\n          {/if}\n\n          {if nested:caption}\n            <h3>{nested:caption}</h3>\n          {/if}\n\n          {if nested:image}\n            <img src=\"{nested:image}\" alt=\"{nested:caption}\" width=\"425\">\n          {/if}\n        {/exp:stash:get_list:nested}\n      </li>\n  {if list:count == list:total_results}\n    </ul>\n  {/if}\n{/exp:stash:get_list}'), ('17', '1', '_global', '2', 'snippets:sn_html_page_entry', 'snippets:sn_html_page_entry', '1403220416', '1403306816', '{!-- ===========================================================================\n  FILE: public/assets/ee/views/stash/snippets/sn_html_page_entry.html\n  TYPE: Stash Snippet\n  DEPENDENCIES: Stash\n  DESCRIPTION: HTML output for page entries\n============================================================================ --}\n{if {exp:stash:not_empty name=\"title\"}}\n  <h1>{stash:title}</h1>\n{/if}\n\n{if {exp:stash:not_empty name=\"content\"}}\n  {stash:content}\n{/if}\n\n{if {exp:stash:not_empty name=\"image\"}}\n  <img src=\"{stash:image}\" alt=\"Featured Image\" width=\"640\">\n{/if}'), ('18', '1', '_global', '2', 'layouts:base', 'layouts:base', '1403218541', '1403304941', '{!-- ===========================================================================\n  FILE: public/assets/ee/views/stash/layouts/base.html\n  TYPE: Stash Layout\n  DEPENDENCIES: Stash\n  DESCRIPTION: Base site layout\n============================================================================ --}\n{stash:embed:partials:_global_header\n  parse=\"no\"\n  process=\"start\"\n}\n  <div class=\"page-wrapper\">\n\n    {if {exp:stash:not_empty name=\"content-primary\"}}\n      <main class=\"content-primary\">\n        {stash:content-primary}\n      </main>\n    {/if}\n\n    {if {exp:stash:not_empty name=\"content-secondary\"}}\n      <section class=\"content-secondary\">\n        {stash:content-secondary}\n      </section>\n    {/if}\n\n    {if {exp:stash:not_empty name=\"content-featured\"}}\n      <div class=\"content-featured\">\n        {stash:content-featured}\n      </div>\n    {/if}\n\n  </div> <!-- /END .page-wrapper -->\n\n{stash:embed:partials:_global_footer\n  parse=\"no\"\n  process=\"start\"\n}');
COMMIT;

-- ----------------------------
--  Table structure for `exp_stash_bundles`
-- ----------------------------
DROP TABLE IF EXISTS `exp_stash_bundles`;
CREATE TABLE `exp_stash_bundles` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `bundle_name` varchar(255) NOT NULL,
  `bundle_label` varchar(255) DEFAULT NULL,
  `is_locked` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `bundle` (`bundle_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `exp_stash_bundles`
-- ----------------------------
BEGIN;
INSERT INTO `exp_stash_bundles` VALUES ('1', 'default', 'Default', '1'), ('2', 'templates', 'Templates', '1'), ('3', 'static', 'Static', '1');
COMMIT;

-- ----------------------------
--  Table structure for `exp_stats`
-- ----------------------------
DROP TABLE IF EXISTS `exp_stats`;
CREATE TABLE `exp_stats` (
  `stat_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `total_members` mediumint(7) NOT NULL DEFAULT '0',
  `recent_member_id` int(10) NOT NULL DEFAULT '0',
  `recent_member` varchar(50) NOT NULL,
  `total_entries` mediumint(8) NOT NULL DEFAULT '0',
  `total_forum_topics` mediumint(8) NOT NULL DEFAULT '0',
  `total_forum_posts` mediumint(8) NOT NULL DEFAULT '0',
  `total_comments` mediumint(8) NOT NULL DEFAULT '0',
  `last_entry_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_forum_post_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_comment_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_visitor_date` int(10) unsigned NOT NULL DEFAULT '0',
  `most_visitors` mediumint(7) NOT NULL DEFAULT '0',
  `most_visitor_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_cache_clear` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`stat_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `exp_stats`
-- ----------------------------
BEGIN;
INSERT INTO `exp_stats` VALUES ('1', '1', '1', '1', 'Administrator', '33', '0', '0', '0', '1403099160', '0', '0', '0', '0', '0', '1403477655');
COMMIT;

-- ----------------------------
--  Table structure for `exp_status_groups`
-- ----------------------------
DROP TABLE IF EXISTS `exp_status_groups`;
CREATE TABLE `exp_status_groups` (
  `group_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_name` varchar(50) NOT NULL,
  PRIMARY KEY (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `exp_status_groups`
-- ----------------------------
BEGIN;
INSERT INTO `exp_status_groups` VALUES ('1', '1', 'Statuses');
COMMIT;

-- ----------------------------
--  Table structure for `exp_status_no_access`
-- ----------------------------
DROP TABLE IF EXISTS `exp_status_no_access`;
CREATE TABLE `exp_status_no_access` (
  `status_id` int(6) unsigned NOT NULL,
  `member_group` smallint(4) unsigned NOT NULL,
  PRIMARY KEY (`status_id`,`member_group`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `exp_statuses`
-- ----------------------------
DROP TABLE IF EXISTS `exp_statuses`;
CREATE TABLE `exp_statuses` (
  `status_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(4) unsigned NOT NULL,
  `status` varchar(50) NOT NULL,
  `status_order` int(3) unsigned NOT NULL,
  `highlight` varchar(30) NOT NULL,
  PRIMARY KEY (`status_id`),
  KEY `group_id` (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `exp_statuses`
-- ----------------------------
BEGIN;
INSERT INTO `exp_statuses` VALUES ('1', '1', '1', 'open', '1', '009933'), ('2', '1', '1', 'closed', '2', '990000');
COMMIT;

-- ----------------------------
--  Table structure for `exp_template_groups`
-- ----------------------------
DROP TABLE IF EXISTS `exp_template_groups`;
CREATE TABLE `exp_template_groups` (
  `group_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_name` varchar(50) NOT NULL,
  `group_order` int(3) unsigned NOT NULL,
  `is_site_default` char(1) NOT NULL DEFAULT 'n',
  PRIMARY KEY (`group_id`),
  KEY `site_id` (`site_id`),
  KEY `group_name_idx` (`group_name`),
  KEY `group_order_idx` (`group_order`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `exp_template_groups`
-- ----------------------------
BEGIN;
INSERT INTO `exp_template_groups` VALUES ('1', '1', 'site', '1', 'y'), ('2', '1', 'about', '2', 'n'), ('3', '1', 'services', '3', 'n'), ('4', '1', 'work', '4', 'n'), ('5', '1', 'blog', '5', 'n'), ('6', '1', 'test', '6', 'n');
COMMIT;

-- ----------------------------
--  Table structure for `exp_template_member_groups`
-- ----------------------------
DROP TABLE IF EXISTS `exp_template_member_groups`;
CREATE TABLE `exp_template_member_groups` (
  `group_id` smallint(4) unsigned NOT NULL,
  `template_group_id` mediumint(5) unsigned NOT NULL,
  PRIMARY KEY (`group_id`,`template_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `exp_template_no_access`
-- ----------------------------
DROP TABLE IF EXISTS `exp_template_no_access`;
CREATE TABLE `exp_template_no_access` (
  `template_id` int(6) unsigned NOT NULL,
  `member_group` smallint(4) unsigned NOT NULL,
  PRIMARY KEY (`template_id`,`member_group`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `exp_template_routes`
-- ----------------------------
DROP TABLE IF EXISTS `exp_template_routes`;
CREATE TABLE `exp_template_routes` (
  `route_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `template_id` int(10) unsigned NOT NULL,
  `route` varchar(512) DEFAULT NULL,
  `route_parsed` varchar(512) DEFAULT NULL,
  `route_required` char(1) NOT NULL DEFAULT 'n',
  PRIMARY KEY (`route_id`),
  KEY `template_id` (`template_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `exp_templates`
-- ----------------------------
DROP TABLE IF EXISTS `exp_templates`;
CREATE TABLE `exp_templates` (
  `template_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(6) unsigned NOT NULL,
  `template_name` varchar(50) NOT NULL,
  `save_template_file` char(1) NOT NULL DEFAULT 'n',
  `template_type` varchar(16) NOT NULL DEFAULT 'webpage',
  `template_data` mediumtext,
  `template_notes` text,
  `edit_date` int(10) NOT NULL DEFAULT '0',
  `last_author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cache` char(1) NOT NULL DEFAULT 'n',
  `refresh` int(6) unsigned NOT NULL DEFAULT '0',
  `no_auth_bounce` varchar(50) NOT NULL DEFAULT '',
  `enable_http_auth` char(1) NOT NULL DEFAULT 'n',
  `allow_php` char(1) NOT NULL DEFAULT 'n',
  `php_parse_location` char(1) NOT NULL DEFAULT 'o',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`template_id`),
  KEY `group_id` (`group_id`),
  KEY `template_name` (`template_name`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `exp_templates`
-- ----------------------------
BEGIN;
INSERT INTO `exp_templates` VALUES ('1', '1', '1', 'index', 'y', 'webpage', '{!-- ===========================================================================\n  FILE: public/assets/ee/views/templates/default_site/site.group/index.html\n  TYPE: View-Model\n  DEPENDENCIES: Stash, Grid, Relationships\n  DESCRIPTION: Homepage template\n============================================================================ --}\n{!-- Let\'s trigger 404s ==================================================== --}\n{if segment_1 != \"\"}\n    {redirect=\"404\"}\n{/if}\n\n\n\n{!-- Set the layout ======================================================== --}\n{stash:embed:layouts:base}\n\n\n\n{!-- Set variables ========================================================= --}\n\n\n\n{!-- Models ================================================================ --}\n{!--\n  Shared page fields model found at:\n  ./public/assets/ee/views/stash/models/md_page_fields.html\n--}\n{stash:embed:models:md_page_fields\n  stash:url_title=\"homepage\"\n  parse=\"no\"\n  process=\"start\"\n}\n\n{!--\n  We\'re only showing this on the homepage so we don\'t need to abstract it\n --}\n{!-- Grab the page teasers --}\n{exp:stash:set_list\n  name=\"page_teasers\"\n  parse_tags=\"yes\"\n}\n\n  {exp:channel:entries\n    channel=\"ch_pages\"\n    disable=\"categories|category_fields|member_data|pagination\"\n    status=\"open\"\n    dynamic=\"no\"\n  }\n    {stash:embed:snippets:sn_global_fields\n      parse=\"no\"\n      process=\"start\"\n    }\n    {stash:teaser}{cf_shared_teaser}{/stash:teaser}\n  {/exp:channel:entries}\n\n{/exp:stash:set_list}\n\n\n\n{!-- Views ================================================================= --}\n{!-- Page Content: content-primary --}\n{exp:stash:set name=\"content-primary\"}\n\n  {!--\n    HTML snippet to display page entry fields:\n    ./public/assets/ee/views/stash/snippets/sn_html_page_entry.html\n  --}\n  {stash:embed:snippets:sn_html_page_entry\n    parse=\"no\"\n    process=\"start\"\n  }\n\n{/exp:stash:set}\n\n\n{!-- Page Content: content-secondary --}\n{exp:stash:set name=\"content-secondary\"}\n\n  {!--\n    We\'re only showing this on the homepage so we don\'t need to abstract it yet\n    ./public/assets/ee/views/stash/models/md_page_fields.html\n   --}\n  {if {exp:stash:not_empty name=\"page_teasers\"}}\n    {exp:stash:get_list\n      name=\"page_teasers\"\n      match=\"#^((?!.*(home)).*)$#\"\n      against=\"url_title\"\n      compress=\"yes\"\n      prefix=\"list\"\n    }\n      {if list:no_results}\n        <p class=\"notice\">Sorry, we can\'t display any Page Teasers.</p>\n      {/if}\n\n      {if list:count == 1}\n        <ul>\n      {/if}\n          <li>\n            {if list:title}\n              <h2><a href=\"{path=\'{list:url_title}\'}\">{list:title}</a></h2>\n            {/if}\n            {if list:teaser}\n              {list:teaser}\n            {/if}\n          </li>\n      {if list:count == list:total_results}\n        </ul>\n      {/if}\n    {/exp:stash:get_list}\n  {/if}\n\n{/exp:stash:set}\n\n\n{!-- Page Content: content-featured --}\n{exp:stash:set name=\"content-featured\"}\n\n  {!--\n    Featured work variables from:\n    ./public/assets/ee/views/stash/models/md_page_fields.html\n   --}\n  {if {exp:stash:not_empty name=\"featured_work\"}}\n    {stash:embed:snippets:sn_featured_work_band\n      parse=\"no\"\n      process=\"start\"\n    }\n  {/if}\n\n{/exp:stash:set}\n\n\n{!-- Page Content: content-secondary --}\n{exp:stash:set name=\"content-secondary\"}\n\n{/exp:stash:set}\n\n\n{!-- Page Content: content-featured --}\n{exp:stash:set name=\"content-featured\"}\n\n{/exp:stash:set}', '', '1403193187', '1', 'n', '0', '', 'n', 'n', 'o', '0'), ('3', '1', '2', 'index', 'y', 'webpage', '{!-- ===========================================================================\n  FILE: public/assets/ee/views/templates/default_site/about.group/index.html\n  TYPE: View-Model\n  DEPENDENCIES: Stash, Grid, Relationships\n  DESCRIPTION: About page template\n============================================================================ --}\n{!-- Let\'s trigger 404s ==================================================== --}\n{if segment_2 != \"\"}\n  {redirect=\"404\"}\n{/if}\n\n\n\n{!-- Set the layout ======================================================== --}\n{stash:embed:layouts:base}\n\n\n\n{!-- Set variables ========================================================= --}\n\n\n\n{!-- Models ================================================================ --}\n{!--\n  Shared page fields model found at:\n  ./public/assets/ee/views/stash/models/md_page_fields.html\n--}\n{stash:embed:models:md_page_fields\n  stash:url_title=\"{last_segment}\"\n  parse=\"no\"\n  process=\"start\"\n}\n\n\n{!-- Views ================================================================= --}\n{!-- Page Content: content-primary --}\n{exp:stash:set name=\"content-primary\"}\n\n  {!--\n    HTML snippet to display page entry fields:\n    ./public/assets/ee/views/stash/snippets/sn_html_page_entry.html\n  --}\n  {stash:embed:snippets:sn_html_page_entry\n    parse=\"no\"\n    process=\"start\"\n  }\n\n{/exp:stash:set}\n\n\n{!-- Page Content: content-secondary --}\n{exp:stash:set name=\"content-secondary\"}\n\n{/exp:stash:set}\n\n\n{!-- Page Content: content-featured --}\n{exp:stash:set name=\"content-featured\"}\n\n{/exp:stash:set}', '', '1403193187', '1', 'n', '0', '', 'n', 'n', 'o', '0'), ('4', '1', '3', 'index', 'y', 'webpage', '{!-- ===========================================================================\n  FILE: public/assets/ee/views/templates/default_site/services.group/index.html\n  TYPE: View-Model\n  DEPENDENCIES: Stash, Grid, Relationships\n  DESCRIPTION: Services template\n============================================================================ --}\n{!-- Let\'s trigger 404s ==================================================== --}\n{if segment_2 != \"\"}\n  {redirect=\"404\"}\n{/if}\n\n\n\n{!-- Set the layout ======================================================== --}\n{stash:embed:layouts:base}\n\n\n{!-- Set variables ========================================================= --}\n\n\n\n{!-- Models ================================================================ --}\n{!--\n  Shared page fields model found at:\n  ./public/assets/ee/views/stash/models/md_page_fields.html\n--}\n{stash:embed:models:md_page_fields\n  stash:url_title=\"{last_segment}\"\n  parse=\"no\"\n  process=\"start\"\n}\n\n{!--\n  We\'re only showing this on the Services page so we don\'t need to abstract it\n --}\n{!-- Grab the services listing --}\n{exp:stash:set_list\n  name=\"services\"\n  parse_tags=\"yes\"\n}\n\n  {exp:channel:entries\n    channel=\"ch_services\"\n    disable=\"categories|category_fields|member_data|pagination\"\n    status=\"open\"\n    dynamic=\"no\"\n  }\n    {stash:embed:snippets:sn_global_fields\n      parse=\"no\"\n      process=\"start\"\n    }\n    {stash:service_icon}{cf_service_icon}{/stash:service_icon}\n    {stash:service_description}{cf_service_description}{/stash:service_description}\n  {/exp:channel:entries}\n\n{/exp:stash:set_list}\n\n\n\n{!-- Views ================================================================= --}\n{!-- Page Content: content-primary --}\n{exp:stash:set name=\"content-primary\"}\n\n  {!--\n    HTML snippet to display page entry fields:\n    ./public/assets/ee/views/stash/snippets/sn_html_page_entry.html\n  --}\n  {stash:embed:snippets:sn_html_page_entry\n    parse=\"no\"\n    process=\"start\"\n  }\n\n{/exp:stash:set}\n\n\n{!-- Page Content: content-secondary --}\n{exp:stash:set name=\"content-secondary\"}\n\n  {!--\n    We\'re only showing this on the Services so we don\'t need to abstract it yet\n    ./public/assets/ee/views/stash/models/md_page_fields.html\n   --}\n  {if {exp:stash:not_empty name=\"services\"}}\n    {exp:stash:get_list\n      name=\"services\"\n      compress=\"yes\"\n      prefix=\"list\"\n    }\n      {if list:no_results}\n        <p class=\"notice\">Sorry, we can\'t display any Work Categories.</p>\n      {/if}\n\n      {if list:count == 1}\n        <ul>\n      {/if}\n          <li>\n            {if list:service_icon}\n              <img src=\"{list:service_icon}\" alt=\"{list:title} Icon\">\n            {/if}\n            {if list:title}\n              <h2>{list:title}</h2>\n            {/if}\n\n            {if list:service_description}\n              {list:service_description}\n            {/if}\n          </li>\n      {if list:count == list:total_results}\n        </ul>\n      {/if}\n    {/exp:stash:get_list}\n  {/if}\n\n{/exp:stash:set}\n\n\n{!-- Page Content: content-featured --}\n{exp:stash:set name=\"content-featured\"}\n\n{/exp:stash:set}', '', '1403193187', '1', 'n', '0', '', 'n', 'n', 'o', '0'), ('5', '1', '4', 'index', 'y', 'webpage', '{!-- ===========================================================================\n  FILE: public/assets/ee/views/templates/default_site/work.group/index.html\n  TYPE: Routing Template\n  DEPENDENCIES: Stash, Switchee\n  DESCRIPTION:  Work landing page template to display either listing/landing page\n                or detail page\n============================================================================ --}\n{exp:switchee variable=\"{segment_2}\" parse=\"inward\"}\n  {!--\n    Detect pagination or empty segment_2 for the listing page\n  --}\n  {case value=\"#^P(\\d+)$#|\'\'\"}\n    {embed=\"work/_listing\"}\n  {/case}\n\n  {!--\n    Detail page\n  --}\n  {case default=\"yes\"}\n    {embed=\"work/_detail\"}\n  {/case}\n\n{/exp:switchee}', '', '1403155392', '1', 'n', '0', '', 'n', 'n', 'o', '0'), ('6', '1', '5', 'index', 'y', 'webpage', '{!-- ===========================================================================\n  FILE: public/assets/ee/views/templates/default_site/blog.group/index.html\n  TYPE: Routing Template\n  DEPENDENCIES: Stash, Switchee\n  DESCRIPTION:  Blog landing page template to display either listing/landing page\n                or detail page\n============================================================================ --}\n{exp:switchee variable=\"{segment_2}\" parse=\"inward\"}\n  {!--\n    Detect pagination or empty segment_2 for the listing page\n  --}\n  {case value=\"#^P(\\d+)$#|\'\'\"}\n    {embed=\"blog/_listing\"}\n  {/case}\n\n  {!--\n    Detail page\n  --}\n  {case default=\"yes\"}\n    {embed=\"blog/_detail\"}\n  {/case}\n\n{/exp:switchee}', '', '1403155392', '1', 'n', '0', '', 'n', 'n', 'o', '0'), ('7', '1', '1', '404', 'y', 'webpage', '<h1>404, Yo</h1>', '', '1403124875', '1', 'n', '0', '', 'n', 'n', 'o', '0'), ('14', '1', '6', 'test', 'y', 'webpage', '{exp:channel:entries\n  channel=\"ch_pages\"\n  limit=\"1\"\n  require_entry=\"yes\"\n  disable=\"categories|category_fields|member_data|pagination\"\n  status=\"open\"\n  url_title=\"homepage\"\n  dynamic=\"no\"\n}\n\n  {exp:stash:set}\n    {stash:channel_name}{channel_name}{/stash:channel_name}\n    {stash:entry_id}{entry_id}{/stash:entry_id}\n    {stash:title}{title}{/stash:title}\n    {stash:content}{cf_shared_body}{/stash:content}\n    {stash:image}{cf_shared_image}{/stash:image}\n  {/exp:stash:set}\n\n  {!-- Set lists from looping fieldtypes --}\n  {exp:stash:set_list\n    name=\"featured_work\"\n    parse_tags=\"yes\"\n    parse_depth=\"2\"\n  }\n    {!-- This is a Relationship field --}\n    {cf_shared_featured_work}\n      {stash:channel_name}{cf_shared_featured_work:channel_name}{/stash:channel_name}\n      {stash:entry_id}{cf_shared_featured_work:entry_id}{/stash:entry_id}\n      {stash:title}{cf_shared_featured_work:title}{/stash:title}\n      {stash:content}{cf_shared_featured_work:cf_port_description}{/stash:content}\n      {!-- Nested Grid field --}\n      {exp:stash:set_list:nested\n        name=\"featured_gallery\"\n        context=\"{cf_shared_featured_work:entry_id}\"\n        parse_tags=\"yes\"\n      }\n        {cf_port_gallery}\n          {stash:caption}{cf_port_gallery:caption}{/stash:caption}\n          {stash:image}{cf_port_gallery:image}{/stash:image}\n        {/cf_port_gallery}\n      {/exp:stash:set_list:nested}\n    {/cf_shared_featured_work}\n  {/exp:stash:set_list}\n\n{/exp:channel:entries}', null, '1403193161', '1', 'n', '0', '', 'n', 'n', 'o', '0'), ('9', '1', '4', '_listing', 'y', 'webpage', '{!-- ===========================================================================\n  FILE: public/assets/ee/views/templates/default_site/work.group/_listing.html\n  TYPE: View-Model\n  DEPENDENCIES: Stash, Grid\n  DESCRIPTION: Work listing template\n============================================================================ --}\n{!-- Let\'s trigger 404s ==================================================== --}\n{if segment_3 != \"\"}\n    {redirect=\"404\"}\n{/if}\n\n\n\n{!-- Set the layout ======================================================== --}\n{stash:embed:layouts:base}\n\n\n\n{!-- Set variables ========================================================= --}\n\n\n\n{!-- Models ================================================================ --}\n{!--\n  We\'re only showing the portfolio listing on the Portfolio/Work listing/landing page so we don\'t need to abstract it\n --}\n{!-- Grab the Portfolio Items --}\n{exp:stash:set_list\n  name=\"portfolio_listing\"\n  parse_tags=\"yes\"\n  parse_depth=\"2\"\n}\n\n  {exp:channel:entries\n    channel=\"ch_portfolio\"\n    disable=\"categories|category_fields|member_data|pagination\"\n    status=\"open\"\n    dynamic=\"no\"\n  }\n    {stash:embed:snippets:sn_global_fields\n      parse=\"no\"\n      process=\"start\"\n    }\n    {stash:content}{cf_port_description}{/stash:content}\n\n    {!-- Nested Grid field --}\n    {exp:stash:set_list:nested\n      name=\"portfolio_gallery\"\n      context=\"{entry_id}\"\n      parse_tags=\"yes\"\n    }\n      {cf_port_gallery}\n        {stash:port_caption}{cf_port_gallery:caption}{/stash:port_caption}\n        {stash:port_image}{cf_port_gallery:image}{/stash:port_image}\n      {/cf_port_gallery}\n    {/exp:stash:set_list:nested}\n  {/exp:channel:entries}\n\n{/exp:stash:set_list}\n\n\n{!-- Views ================================================================= --}\n{!-- Page Content: content-primary --}\n{exp:stash:set name=\"content-primary\"}\n\n  {if {exp:stash:not_empty name=\"portfolio_listing\"}}\n    {exp:stash:get_list\n      name=\"portfolio_listing\"\n      prefix=\"list\"\n      compress=\"yes\"\n    }\n      {if list:no_results}\n        <p class=\"notice\">Sorry, we can\'t display any Portfolio Samples.</p>\n      {/if}\n\n      {if list:count == 1}\n        <ul>\n      {/if}\n          <li>\n            {!--\n              Check to see if the nested list is empty by assigning the context to it\n            --}\n            {if {exp:stash:not_empty\n              name=\"portfolio_gallery\"\n              context=\"{list:entry_id}\"}\n            }\n              {exp:stash:get_list:nested\n                name=\"portfolio_gallery\"\n                context=\"{list:entry_id}\"\n                prefix=\"nested\"\n                limit=\"1\"\n                sort=\"asc\"\n                compress=\"yes\"\n              }\n                {if nested:no_results}\n                  <p class=\"notice\">Sorry, we can\'t display an Image Gallery.</p>\n                {/if}\n\n                {if list:content}\n                  <p>{exp:streeng allowed=\"none\" words=\"10\"}{list:content}{/exp:streeng}</p>\n                {/if}\n\n                {if nested:port_caption}\n                  <p>{nested:port_caption}</p>\n                {/if}\n\n                {if nested:port_image}\n                  <img src=\"{nested:port_image}\" alt=\"{nested:port_caption}\">\n                {/if}\n              {/exp:stash:get_list:nested}\n            {/if}\n\n            {if list:title}\n              <h2><a href=\"{path=\'work/{list:url_title}\'}\">{list:title}</a></h2>\n            {/if}\n          </li>\n      {if list:count == list:total_results}\n        </ul>\n      {/if}\n    {/exp:stash:get_list}\n  {/if}\n\n{/exp:stash:set}', null, '1403193187', '1', 'n', '0', '', 'n', 'n', 'o', '0'), ('10', '1', '6', 'index', 'y', 'webpage', '<h1>Portfolio</h1>\n\n{exp:channel:entries\n  channel=\"ch_portfolio\"\n  disable=\"categories|category_fields|member_data|pagination\"\n  status=\"open\"\n  limit=\"1\"\n  dynamic=\"no\"\n}\n  {channel_name} / {entry_id} / {url_title}\n  <br>\n\n  <h1>{title}</h1>\n\n  {cf_port_description}\n\n  {cf_port_gallery limit=\"1\"}\n    {cf_port_gallery:field_row_count} / {cf_port_gallery:caption}\n    <br>\n    {cf_port_gallery:image}\n    <br>\n  {/cf_port_gallery}\n\n  <hr>\n\n{/exp:channel:entries}\n\n<hr>\n\n<h1>Blog</h1>\n\n{exp:channel:entries\n  channel=\"ch_blog\"\n  limit=\"1\"\n  require_entry=\"yes\"\n  status=\"open\"\n  disable=\"category_fields|member_data|pagination\"\n  dynamic=\"no\"\n  url_title=\"viverra-ac-pulvinar-luctus\"\n}\n  {!-- Trigger 404\'s --}\n  {if no_results}\n    {redirect=\"404\"}\n  {/if}\n\n  {channel_name} / {entry_id}\n  <br>\n\n  <h2>{title} – {url_title}</h2>\n\n  <p>\n    {author} / {entry_date format=\"%F %d, %Y\"}\n    <br>\n    {categories backspace=\"2\"}{category_name}, {/categories}\n  </p>\n\n  <p><b>{cf_shared_teaser}</b></p>\n\n  {cf_shared_image}\n\n  {cf_shared_body}\n\n  <hr>\n\n  {!-- Nested Relationship field --}\n  {cf_shared_featured_work}\n    <h3>{cf_shared_featured_work:entry_id} / {cf_shared_featured_work:title} {cf_shared_featured_work:url_title}</h3>\n\n    {cf_shared_featured_work:cf_port_description}\n\n    {!-- Nested Grid field --}\n    {cf_shared_featured_work:cf_port_gallery}\n      {cf_port_gallery:image} / {cf_port_gallery:caption}\n    {/cf_shared_featured_work:cf_port_gallery}\n  {/cf_shared_featured_work}\n\n  <hr>\n{/exp:channel:entries}', '', '1403157583', '1', 'n', '0', '', 'n', 'n', 'o', '0'), ('11', '1', '4', '_detail', 'y', 'webpage', '{!-- ===========================================================================\n  FILE: public/assets/ee/views/templates/default_site/work.group/_detail.html\n  TYPE: View-Model\n  DEPENDENCIES: Stash, Grid, Relationships\n  DESCRIPTION: Work detail template\n============================================================================ --}\n{!-- Let\'s trigger 404s ==================================================== --}\n{if segment_3 != \"\"}\n    {redirect=\"404\"}\n{/if}\n\n\n\n{!-- Set the layout ======================================================== --}\n{stash:embed:layouts:base}\n\n\n\n{!-- Set variables ========================================================= --}\n\n\n\n{!-- Models ================================================================ --}\n{exp:channel:entries\n  channel=\"ch_portfolio\"\n  limit=\"1\"\n  require_entry=\"yes\"\n  disable=\"categories|category_fields|member_data|pagination\"\n  status=\"open\"\n  url_title=\"{segment_2}\"\n  dynamic=\"no\"\n}\n  {!-- Trigger 404\'s --}\n    {if no_results}\n      {redirect=\"404\"}\n    {/if}\n\n  {exp:stash:set}\n    {!-- Moar abstractions --}\n    {stash:embed:snippets:sn_global_fields\n      parse=\"no\"\n      process=\"start\"\n    }\n    {stash:content}{cf_port_description}{/stash:content}\n  {/exp:stash:set}\n\n  {!-- Set lists from looping fieldtypes --}\n  {!-- Grid field --}\n  {exp:stash:set_list\n    name=\"portfolio_gallery\"\n    parse_tags=\"yes\"\n  }\n    {cf_port_gallery}\n      {stash:caption}{cf_port_gallery:caption}{/stash:caption}\n      {stash:image}{cf_port_gallery:image}{/stash:image}\n    {/cf_port_gallery}\n  {/exp:stash:set_list}\n\n  {!-- Relationship field --}\n  {exp:stash:set_list\n    name=\"portfolio_categories\"\n    parse_tags=\"yes\"\n  }\n    {cf_port_services}\n      {stash:service_icon}{cf_port_services:cf_service_icon}{/stash:service_icon}\n      {stash:service_title}{cf_port_services:title}{/stash:service_title}\n      {stash:service_description}{cf_port_services:cf_service_description}{/stash:service_description}\n    {/cf_port_services}\n  {/exp:stash:set_list}\n\n{/exp:channel:entries}\n\n\n{!-- Views ================================================================= --}\n{!-- Page Content: content-primary --}\n{exp:stash:set name=\"content-primary\"}\n\n  {if {exp:stash:not_empty name=\"title\"}}\n    <h1>{stash:title}</h1>\n  {/if}\n\n  {if {exp:stash:not_empty name=\"content\"}}\n    {stash:content}\n  {/if}\n\n  {if {exp:stash:not_empty name=\"portfolio_gallery\"}}\n    {exp:stash:get_list\n      name=\"portfolio_gallery\"\n      compress=\"yes\"\n      prefix=\"list\"\n    }\n      {if list:no_results}\n        <p class=\"notice\">Sorry, we can\'t display any Portfolio Gallery Items.</p>\n      {/if}\n\n      {if list:count == 1}\n        <ul>\n      {/if}\n          <li>\n            {if list:caption}\n              <p>{list:caption}</p>\n            {/if}\n\n            {if list:image}\n              <img src=\"{list:image}\" alt=\"{list:caption}\">\n            {/if}\n          </li>\n      {if list:count == list:total_results}\n        </ul>\n      {/if}\n    {/exp:stash:get_list}\n  {/if}\n\n  {if {exp:stash:not_empty name=\"portfolio_categories\"}}\n    {exp:stash:get_list\n      name=\"portfolio_categories\"\n      compress=\"yes\"\n      prefix=\"list\"\n    }\n      {if list:no_results}\n        <p class=\"notice\">Sorry, we can\'t display any Portfolio Categories.</p>\n      {/if}\n\n      {if list:count == 1}\n        <ul>\n      {/if}\n          <li>\n            {if list:service_icon AND list:service_title}\n              <img src=\"{list:service_icon}\" alt=\"{list:service_title}\" width=\"20\">\n            {/if}\n\n            {if list:service_title}\n              {list:service_title}\n            {/if}\n          </li>\n      {if list:count == list:total_results}\n        </ul>\n      {/if}\n    {/exp:stash:get_list}\n  {/if}\n\n{/exp:stash:set}', null, '1403193187', '1', 'n', '0', '', 'n', 'n', 'o', '0'), ('12', '1', '5', '_listing', 'y', 'webpage', '{!-- ===========================================================================\n  FILE: public/assets/ee/views/templates/default_site/blog.group/_listing.html\n  TYPE: View-Model\n  DEPENDENCIES: Stash, Grid\n  DESCRIPTION: Blog listing template\n============================================================================ --}\n{!-- Let\'s trigger 404s ==================================================== --}\n{if segment_3 != \"\"}\n  {redirect=\"404\"}\n{/if}\n\n\n\n{!-- Set the layout ======================================================== --}\n{stash:embed:layouts:base}\n\n\n\n{!-- Set variables ========================================================= --}\n\n\n\n{!-- Models ================================================================ --}\n{!-- Grab the Portfolio Items --}\n{exp:stash:set_list\n  name=\"blog\"\n  parse_tags=\"yes\"\n  parse_depth=\"2\"\n}\n\n  {exp:channel:entries\n    channel=\"ch_blog\"\n    status=\"open\"\n    disable=\"category_fields|member_data|pagination\"\n    dynamic=\"no\"\n  }\n    {stash:embed:snippets:sn_global_fields\n      parse=\"no\"\n      process=\"start\"\n    }\n    {stash:author}{author}{/stash:author}\n    {stash:entry_date}{entry_date format=\"%F %d, %Y\"}{/stash:entry_date}\n    {stash:categories}{categories backspace=\"2\"}{category_name}, {/categories}{/stash:categories}\n    {stash:teaser}{cf_shared_teaser}{/stash:teaser}\n    {stash:featured_image}{cf_shared_image}{/stash:featured_image}\n    {stash:content}{cf_shared_body}{/stash:content}\n  {/exp:channel:entries}\n\n{/exp:stash:set_list}\n\n\n{!-- Views ================================================================= --}\n{!-- Page Content: content-primary --}\n{exp:stash:set name=\"content-primary\"}\n\n  {if {exp:stash:not_empty name=\"blog\"}}\n    {exp:stash:get_list\n      name=\"blog\"\n      prefix=\"list\"\n      compress=\"yes\"\n    }\n      {if list:no_results}\n        <p class=\"notice\">Sorry, we can\'t display any Blog Posts.</p>\n      {/if}\n\n      {if list:count == 1}\n        <ul>\n      {/if}\n          <li>\n            {if list:title}\n              <h2><a href=\"{path=\'blog/{list:url_title}\'}\">{list:title}</a></h2>\n            {/if}\n\n            <div clas=\"blog-meta\">\n              {if list:author}{list:author}{/if} | {if list:entry_date}{list:entry_date}{/if}\n              <br>\n              {if list:categories}{list:categories}{/if}\n            </div>\n\n            {if list:teaser}\n              {list:teaser}\n            {if:else}\n              <p>{exp:streeng allowed=\"none\" words=\"10\"}{list:content}{/exp:streeng}</p>\n            {/if}\n\n            {if list:featured_image}\n              <img src=\"{list:featured_image}\" alt=\"{list:title}\">\n            {/if}\n          </li>\n      {if list:count == list:total_results}\n        </ul>\n      {/if}\n    {/exp:stash:get_list}\n  {/if}\n\n{/exp:stash:set}\n\n\n{!-- Page Content: content-secondary --}\n{exp:stash:set name=\"content-secondary\"}\n\n{/exp:stash:set}\n\n\n{!-- Page Content: content-featured --}\n{exp:stash:set name=\"content-featured\"}\n\n{/exp:stash:set}', null, '1403193187', '1', 'n', '0', '', 'n', 'n', 'o', '0'), ('13', '1', '5', '_detail', 'y', 'webpage', '{!-- ===========================================================================\n  FILE: public/assets/ee/views/templates/default_site/blog.group/_detail.html\n  TYPE: View-Model\n  DEPENDENCIES: Stash, Grid, Relationship\n  DESCRIPTION: Blog detail template\n============================================================================ --}\n{!-- Let\'s trigger 404s ==================================================== --}\n{if segment_3 != \"\"}\n  {redirect=\"404\"}\n{/if}\n\n\n\n{!-- Set the layout ======================================================== --}\n{stash:embed:layouts:base}\n\n\n\n{!-- Set variables ========================================================= --}\n\n\n\n{!-- Models ================================================================ --}\n{!-- Grab the blog Items --}\n{exp:stash:set_list\n  name=\"blog\"\n  parse_tags=\"yes\"\n  parse_depth=\"2\"\n}\n\n  {exp:channel:entries\n    channel=\"ch_blog\"\n    limit=\"1\"\n    require_entry=\"yes\"\n    url_title=\"{segment_2}\"\n    status=\"open\"\n    disable=\"category_fields|member_data|pagination\"\n    dynamic=\"no\"\n  }\n    {!-- Trigger 404\'s --}\n    {if no_results}\n      {redirect=\"404\"}\n    {/if}\n\n    {stash:embed:snippets:sn_global_fields\n      parse=\"no\"\n      process=\"start\"\n    }\n    {stash:author}{author}{/stash:author}\n    {stash:entry_date}{entry_date format=\"%F %d, %Y\"}{/stash:entry_date}\n    {stash:categories}{categories backspace=\"2\"}{category_name}, {/categories}{/stash:categories}\n    {stash:teaser}{cf_shared_teaser}{/stash:teaser}\n    {stash:featured_image}{cf_shared_image}{/stash:featured_image}\n    {stash:content}{cf_shared_body}{/stash:content}\n\n    {!-- Nested Relationship field --}\n    {exp:stash:set_list:nested\n      name=\"featured_project\"\n      context=\"{entry_id}\"\n      parse_tags=\"yes\"\n    }\n\n      {cf_shared_featured_work}\n\n        {stash:work_entry_id}{cf_shared_featured_work:entry_id}{/stash:work_entry_id}\n        {stash:title}{cf_shared_featured_work:title}{/stash:title}\n        {stash:url_title}{cf_shared_featured_work:url_title}{/stash:url_title}\n        {stash:description}{cf_shared_featured_work:cf_port_description}{/stash:description}\n\n        {!-- Nested Grid field --}\n        {exp:stash:set_list:nested:doh\n          name=\"project_image\"\n          context=\"{cf_shared_featured_work:entry_id}\"\n          parse_tags=\"yes\"\n        }\n          {cf_shared_featured_work:cf_port_gallery}\n            {stash:gallery_image}{cf_port_gallery:image}{/stash:gallery_image}\n            {stash:gallery_caption}{cf_port_gallery:caption}{/stash:gallery_caption}\n          {/cf_shared_featured_work:cf_port_gallery}\n        {/exp:stash:set_list:nested:doh}\n      {/cf_shared_featured_work}\n    {/exp:stash:set_list:nested}\n  {/exp:channel:entries}\n\n{/exp:stash:set_list}\n\n\n{!-- Views ================================================================= --}\n{!-- Page Content: content-primary --}\n{exp:stash:set name=\"content-primary\"}\n\n  {if {exp:stash:not_empty name=\"blog\"}}\n    {exp:stash:get_list\n      name=\"blog\"\n      prefix=\"list\"\n      compress=\"yes\"\n    }\n      {if list:no_results}\n        <p class=\"notice\">Sorry, we can\'t display any Blog Posts.</p>\n      {/if}\n\n      {if list:count == 1}\n        <ul>\n      {/if}\n          <li>\n            {if list:title}\n              <h2><a href=\"{path=\'blog/{list:url_title}\'}\">{list:title}</a> – {list:entry_id}</h2>\n            {/if}\n\n            <div clas=\"blog-meta\">\n              {if list:author}{list:author}{/if} | {if list:entry_date}{list:entry_date}{/if}\n              <br>\n              {if list:categories}{list:categories}{/if}\n            </div>\n\n            {if list:content}\n              {list:content}\n            {/if}\n\n            {if list:featured_image}\n              <img src=\"{list:featured_image}\" alt=\"{list:title}\">\n            {/if}\n\n            {!--\n              Check to see if the nested list is empty by assigning the context to it\n            --}\n            {if {exp:stash:not_empty\n              name=\"featured_project\"\n              context=\"{list:entry_id}\"}\n            }\n              {exp:stash:get_list:nested\n                name=\"featured_project\"\n                context=\"{list:entry_id}\"\n                prefix=\"nested\"\n                compress=\"yes\"\n              }\n                {if nested:no_results}\n                  <p class=\"notice\">Sorry, we can\'t display a Featured Project.</p>\n                {/if}\n\n                {if nested:title}\n                  <h3>{nested:title} - {nested:work_entry_id}</h3>\n                {/if}\n\n                {if nested:description}\n                  <h4>{exp:streeng allowed=\"none\" words=\"10\"}{nested:description}{/exp:streeng}</h4>\n                {/if}\n\n                {exp:stash:get_list:nested:doh\n                  name=\"project_image\"\n                  context=\"{nested:work_entry_id}\"\n                  prefix=\"nested\"\n                  limit=\"1\"\n                  sort=\"asc\"\n                  compress=\"yes\"\n                }\n                  {if nested:no_results}\n                    <p class=\"notice\">Sorry, we can\'t display a Featured Project Image.</p>\n                  {/if}\n\n                  {nested:gallery_image}\n                  {nested:gallery_caption}\n                  <hr>\n                {/exp:stash:get_list:nested:doh}\n              {/exp:stash:get_list:nested}\n            {/if}\n          </li>\n      {if list:count == list:total_results}\n        </ul>\n      {/if}\n    {/exp:stash:get_list}\n\n{/exp:stash:set}\n\n\n{!-- Page Content: content-secondary --}\n{exp:stash:set name=\"content-secondary\"}\n\n{/exp:stash:set}\n\n\n{!-- Page Content: content-featured --}\n{exp:stash:set name=\"content-featured\"}\n\n{/exp:stash:set}', null, '1403193187', '1', 'n', '0', '', 'n', 'n', 'o', '0');
COMMIT;

-- ----------------------------
--  Table structure for `exp_throttle`
-- ----------------------------
DROP TABLE IF EXISTS `exp_throttle`;
CREATE TABLE `exp_throttle` (
  `throttle_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` int(10) unsigned NOT NULL,
  `locked_out` char(1) NOT NULL DEFAULT 'n',
  PRIMARY KEY (`throttle_id`),
  KEY `ip_address` (`ip_address`),
  KEY `last_activity` (`last_activity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `exp_upload_no_access`
-- ----------------------------
DROP TABLE IF EXISTS `exp_upload_no_access`;
CREATE TABLE `exp_upload_no_access` (
  `upload_id` int(6) unsigned NOT NULL,
  `upload_loc` varchar(3) NOT NULL,
  `member_group` smallint(4) unsigned NOT NULL,
  PRIMARY KEY (`upload_id`,`member_group`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `exp_upload_prefs`
-- ----------------------------
DROP TABLE IF EXISTS `exp_upload_prefs`;
CREATE TABLE `exp_upload_prefs` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `name` varchar(50) NOT NULL,
  `server_path` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(100) NOT NULL,
  `allowed_types` varchar(3) NOT NULL DEFAULT 'img',
  `max_size` varchar(16) DEFAULT NULL,
  `max_height` varchar(6) DEFAULT NULL,
  `max_width` varchar(6) DEFAULT NULL,
  `properties` varchar(120) DEFAULT NULL,
  `pre_format` varchar(120) DEFAULT NULL,
  `post_format` varchar(120) DEFAULT NULL,
  `file_properties` varchar(120) DEFAULT NULL,
  `file_pre_format` varchar(120) DEFAULT NULL,
  `file_post_format` varchar(120) DEFAULT NULL,
  `cat_group` varchar(255) DEFAULT NULL,
  `batch_location` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `exp_upload_prefs`
-- ----------------------------
BEGIN;
INSERT INTO `exp_upload_prefs` VALUES ('1', '1', 'Site Uploads', '/Users/pelias/Dropbox/Code/Repositories/GIT/presentations/eecms-every-day-stash-02/public/assets/uploads/site/', 'http://everydaystash.dev/assets/uploads/site/', 'all', '', '', '', '', '', '', '', '', '', '', null), ('2', '1', 'Team Images', '/Users/pelias/Dropbox/Code/Repositories/GIT/presentations/eecms-every-day-stash-02/public/uploads/team/', 'http://everydaystash.dev/uploads/team/', 'img', '', '', '', '', '', '', '', '', '', '', null), ('3', '1', 'Services Images', '/Users/pelias/Dropbox/Code/Repositories/GIT/presentations/eecms-every-day-stash-02/public/uploads/services/', 'http://everydaystash.dev/uploads/services/', 'img', '', '', '', '', '', '', '', '', '', '', null), ('4', '1', 'Portfolio Images', '/Users/pelias/Dropbox/Code/Repositories/GIT/presentations/eecms-every-day-stash-02/public/uploads/portfolio/', 'http://everydaystash.dev/uploads/portfolio/', 'img', '', '', '', '', '', '', '', '', '', '', null);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;

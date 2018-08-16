<?php
# This file was automatically generated by the MediaWiki 1.27.1
# installer. If you make manual changes, please keep track in case you
# need to recreate them later.
#
# See includes/DefaultSettings.php for all configurable settings
# and their default values, but don't forget to make changes in _this_
# file, not there.
#
# Further documentation for configuration settings may be found at:
# https://www.mediawiki.org/wiki/Manual:Configuration_settings

# Protect against web entry
if ( !defined( 'MEDIAWIKI' ) ) {
	exit;
}

## Uncomment this to disable output compression
# $wgDisableOutputCompression = true;

$wgSitename = getenv("WIKI_NAME");
$wgOverrideHostname = "wiki.discosquad.com";
$wgMetaNamespace = "tds";

## The URL base path to the directory containing the wiki;
## defaults for all runtime URL paths are based off of this.
## For more information on customizing the URLs
## (like /w/index.php/Page_title to /wiki/Page_title) please see:
## https://www.mediawiki.org/wiki/Manual:Short_URL
$wgScriptPath = "";

$wgUsePathInfo = true;

## The protocol and server name to use in fully-qualified URLs
$wgServer = getenv("WIKI_URL");

## The URL path to static resources (images, scripts, etc.)
$wgResourceBasePath = $wgScriptPath;

## The URL path to the logo.  Make sure you change this from the default,
## or else you'll overwrite your logo when you upgrade!
$wgLogo = "$wgResourceBasePath/images/wikilogo.png";

## UPO means: this is also a user preference option

$wgEnableEmail = true;
$wgEnableUserEmail = true; # UPO

$wgEmergencyContact = "chief@beefdisciple.com";
$wgPasswordSender = "noreply@beefdisciple.com";

$wgEnotifUserTalk = false; # UPO
$wgEnotifWatchlist = false; # UPO
$wgEmailAuthentication = true;

## Database settings
$wgDBtype = "mysql";
$wgDBserver = "db";
$wgDBname = getenv("MYSQL_DATABASE");
$wgDBuser = getenv("MYSQL_USER");
$wgDBpassword = getenv("MYSQL_PASSWORD");

# MySQL specific settings
$wgDBprefix = "mw_";

# MySQL table options to use during installation or update
$wgDBTableOptions = "ENGINE=InnoDB, DEFAULT CHARSET=binary";

# Experimental charset support for MySQL 5.0.
$wgDBmysql5 = false;

## Shared memory settings
$wgMainCacheType = CACHE_NONE;
$wgMemCachedServers = [];

## To enable image uploads, make sure the 'images' directory
## is writable, then set this to true:
$wgEnableUploads = true;
#$wgUseImageMagick = false;
#$wgImageMagickConvertCommand = "/usr/bin/convert";

# InstantCommons allows wiki to use images from https://commons.wikimedia.org
$wgUseInstantCommons = false;

## If you use ImageMagick (or any other shell command) on a
## Linux server, this will need to be set to the name of an
## available UTF-8 locale
$wgShellLocale = "en_US.utf8";

## Set $wgCacheDirectory to a writable directory on the web server
## to make your wiki go slightly faster. The directory should not
## be publically accessible from the web.
#$wgCacheDirectory = "$IP/cache";

# Site language code, should be one of the list in ./languages/data/Names.php
$wgLanguageCode = "en";

$wgSecretKey = getenv("WIKI_SECRET_KEY");

# Changing this will log out all existing sessions.
$wgAuthenticationTokenVersion = "1";

# Site upgrade key. Must be set to a string (default provided) to turn on the
# web installer while LocalSettings.php is in place
$wgUpgradeKey = getenv("WIKI_UPGRADE_KEY");

## For attaching licensing metadata to pages, and displaying an
## appropriate copyright notice / icon. GNU Free Documentation
## License and Creative Commons licenses are supported so far.
$wgRightsPage = ""; # Set to the title of a wiki page that describes your license/copyright
$wgRightsUrl = "";
$wgRightsText = "";
$wgRightsIcon = "";

# Path to the GNU diff3 utility. Used for conflict resolution.
$wgDiff3 = "/usr/bin/diff3";

## Default skin: you can change the default skin. Use the internal symbolic
## names, ie 'vector', 'monobook':
$wgDefaultSkin = "vector";

# Enabled skins.
# The following skins were automatically enabled:
#wfLoadSkin( 'CologneBlue' );
#wfLoadSkin( 'Modern' );
#wfLoadSkin( 'MonoBook' );
wfLoadSkin( 'Vector' );

# Handle this via crond
$wgRunJobsAsync = false;
$wgJobRunRate = 0;

# End of automatically generated settings.
# Add more configuration options below.
$wgMaxShellMemory = 512000;

#$wgDebugLogFile = "/var/log/mediawiki.log";

wfLoadExtension('MobileFrontend');
$wgMFAutodetectMobileView = true;

wfLoadExtension('RandomImage');
$wgRandomImageNoCache = true;

wfLoadExtension('MultimediaViewer');

wfLoadExtension('YouTube');

wfLoadExtension('ParserFunctions');
$wgPFEnableStringFunctions = true;

wfLoadExtension('CategoryTree');

wfLoadExtension('MsUpload');

$GLOBALS['egMapsDefaultService'] = 'openlayers';

require_once "$IP/extensions/SlackNotifications/SlackNotifications.php";
$wgSlackIncomingWebhookUrl = getenv("SLACK_WEBHOOK_URL");
$wgSlackFromName = getenv("WIKI_NAME");
$wgWikiUrl = getenv("WIKI_URL") . '/';
$wgWikiUrlEnding = "index.php/";
$wgSlackSendMethod = "curl";
$wgSlackIncludeUserUrls = true;
$wgSlackIgnoreMinorEdits = true;
$wgSlackEmoji = "ledger";
$wgSlackIncludeDiffSize = false;
$wgSlackNotificationEditedArticle = true;
$wgSlackNotificationFileUpload = false;
$wgSlackNotificationMovedArticle = false;
$wgSlackNotificationRemovedArticle = false;
$wgSlackNotificationNewUser = false;


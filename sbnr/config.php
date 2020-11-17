<?php

//General
$SBNR_DOMAIN_PRIMARY = "divestos.org";
$SBNR_DOMAIN_WHITELIST = array($SBNR_DOMAIN_PRIMARY, "6sdlxbqgcxdbkvysoir2qvqqs5ro3fxgyl3phvuphcdyklv7rg57jhid.onion");
$SBNR_GEN_ONE_PAGE = false;
$SBNR_GEN_DARKMODE = false;
$SBNR_CAPTCHA_STANDALONE_ENABLED = false;

//Footer
$SBNR_FOOTER_LEGAL = true;
$SBNR_FOOTER_POWEREDBY = true;

//Obfuscation
$SNBR_OBF_MINIFY = true;
$SBNR_OBF_DISABLE_CACHE = false;
$SBNR_OBF_DISABLE_CLIPBOARD = false;
$SBNR_OBF_DISABLE_DEVTOOLS = false;
$SBNR_OBF_DISABLE_HIGHLIGHT = false;
$SBNR_OBF_DISABLE_RIGHT_CLICK = false;

//Analytics - Custom
$SBNR_ANALYTICS_ENABLED = false;
$SBNR_ANALYTICS_CUSTOM_PATH = "fragments/analytics.html";

//Analytics - Shadow
$SBNR_SHADOW_ENABLED = false;
$SBNR_SHADOW_BASIC = true;
$SBNR_SHADOW_INSTANCE = "https://spotco.us/shadow";
$SBNR_SHADOW_LANDSCAPE = "DivestOS";

//Security
$SBNR_CAPTCHA_WALL = false && extension_loaded('gd');
$SBNR_CAPTCHA_WALL_PAGES = array("devices");
$SBNR_SEC_HTTPS_ONLY = false; //Enable if using HTTPS
$SBNR_SEC_CLIENT_HARDENING = false; //Disable if globally added by webserver
$SBNR_SEC_FILE_UPLOADS = "Off";
$SBNR_SEC_MAX_POST_SIZE = "2K";
$SBNR_SEC_SESSION_COOKIE_NAME = "PHPSESSID";
$SBNR_SEC_CSRF_PER_REQUEST = true; //Disable if CSRF tokens are needed and users are likely to have multiple windows open

//Contact Form Handler
$SBNR_CONTACT_ENABLED = false;
$SBNR_CONTACT_CAPTCHA = true && extension_loaded('gd'); //Require a captcha to be solved
$SBNR_CONTACT_OUTPUT = "TEXT"; //Choices: TEXT, XMPP
$SBNR_CONTACT_SENDXMPP_RECEIPENT = "contact@example.tld";
$SBNR_CONTACT_SENDXMPP_CONFIG = "/var/www/secrets/sender_account.config";
$SBNR_CONTACT_TEXT_FILE = "/var/www/secrets/contact_responses-" . $SBNR_DOMAIN_PRIMARY . ".log";
$SBNR_CONTACT_GEOIP = false; //requires mod_maxminddb
$SBNR_CONTACT_MESSAGE_PREFIX_LENGTH = 3;
$SBNR_CONTACT_MAX_LENGTH_NAME = 30;
$SBNR_CONTACT_MIN_LENGTH_PHONE_NUMBER = 7; //000-0000
$SBNR_CONTACT_MAX_LENGTH_PHONE_NUMBER = 12; //1-000-000-0000
$SBNR_CONTACT_MAX_LENGTH_MESSAGE = 500;

//Payment Handler - Stripe
$SBNR_STRIPE_ENABLED = false;
$SBNR_STRIPE_KEY_PRIVATE = "";

?>

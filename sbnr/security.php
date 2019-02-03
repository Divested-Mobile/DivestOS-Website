<?php

//Disable some dangerous features
ini_set("allow_url_fopen", "Off");
ini_set("allow_url_include", "Off");
ini_set("file_uploads", $SBNR_SEC_FILE_UPLOADS);

//Hardening
ini_set("post_max_size", $SBNR_SEC_MAX_POST_SIZE);

//Harden session cookies
ini_set("session.name", $SBNR_SEC_SESSION_COOKIE_NAME);
//ini_set("session.referer_check", $SBNR_GEN_DOMAIN);
ini_set("session.cookie_httponly", "true");
ini_set("session.cookie_lifetime", "0");
ini_set("session.cookie_secure", "1");
ini_set("session.entropy_length", "64");
ini_set("session.hash_bits_per_character", "5");
ini_set("session.hash_function", "sha512");
ini_set("session.use_cookies", "1");
ini_set("session.use_only_cookies", "1");
ini_set("session.use_strict_mode", "1");
ini_set("session.use_trans_sid", "0");

//Disable error/trace reporting
ini_set("display_errors", "Off");
error_reporting(E_ERROR | E_PARSE);

//Disable cache
if($SBNR_OBF_DISABLE_CACHE) {
	header("Cache-Control: no-store, no-cache, must-revalidate, max-age=0");
	header("Cache-Control: post-check=0, pre-check=0", false);
	header("Pragma: no-cache");
}

?>

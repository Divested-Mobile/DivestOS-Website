<?php
//Copyright (c) 2017-2020 Divested Computing Group
//
//This program is free software: you can redistribute it and/or modify
//it under the terms of the GNU Lesser General Public License as published by
//the Free Software Foundation, either version 3 of the License, or
//(at your option) any later version.
//
//This program is distributed in the hope that it will be useful,
//but WITHOUT ANY WARRANTY; without even the implied warranty of
//MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//GNU Lesser General Public License for more details.
//
//You should have received a copy of the GNU Lesser General Public License
//along with this program.  If not, see <https://www.gnu.org/licenses/>.

//Disable some dangerous features
ini_set("allow_url_fopen", "Off");
ini_set("allow_url_include", "Off");
ini_set("expose_php", "Off");
ini_set("file_uploads", $SBNR_SEC_FILE_UPLOADS);

//Hardening
ini_set("post_max_size", $SBNR_SEC_MAX_POST_SIZE);

//Harden session cookies
ini_set("session.name", $SBNR_SEC_SESSION_COOKIE_NAME);
//ini_set("session.referer_check", $SBNR_DOMAIN_PRIMARY);
ini_set("session.cookie_httponly", "true");
ini_set("session.cookie_lifetime", "0");
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

//Client-side hardening
if($SBNR_SEC_CLIENT_HARDENING) {
	header('Feature-Policy: * \'none\''); //Disable all special page permissions (camera, microphone, location)
	header('Referrer-Policy: "origin-when-cross-origin"'); //Prevent sending referrer information to 3rd parties
	header('X-Content-Type-Options: "nosniff"'); //Force IE to respect headers
	header('X-Frame-Options: "DENY"'); //Prevent embedding pages
	header('X-Permitted-Cross-Domain-Policies: "none"'); //Prevent plugins from ever loading data from other domains
	header('X-Xss-Protection: "1; mode=block"'); //Basic XSS protection
	//header('Content-Security-Policy: "default-src \'none\'; script-src \'self\' \'unsafe-inline\' \'unsafe-eval\' checkout.stripe.com; style-src \'self\' \'unsafe-inline\'; img-src \'self\' data: *.stripe.com; font-src \'self\'; connect-src \'self\' checkout.stripe.com; media-src \'self\'; object-src \'none\'; child-src \'none\'; frame-src \'self\' checkout.stripe.com; worker-src \'none\'; frame-ancestors \'none\'; disown-opener; sandbox allow-forms allow-modals allow-same-origin allow-popups allow-scripts allow-downloads; reflected-xss block; manifest-src \'self\';"');
}
if($SBNR_SEC_HTTPS_ONLY) {
	ini_set("session.cookie_secure", "1");
	header('Strict-Transport-Security: max-age=86400; includeSubDomains'); //Enforce HTTPS
}

//Disable cache
if($SBNR_OBF_DISABLE_CACHE) {
	header("Cache-Control: no-store, no-cache, must-revalidate, max-age=0");
	header("Cache-Control: post-check=0, pre-check=0", false);
	header("Pragma: no-cache");
}

?>

<?php
//Copyright (c) 2021 Divested Computing Group
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

$handler = true;
$binaryOutput = true;
include "config.php";
include "security.php";
include "captcha.php";
include "utils.php";
include "pre.php";

getCaptchaAudioContent();
$_SESSION['SBNR_CAPTCHA_SPEAK'] = ""; //Unset to prevent repeat generation

?>

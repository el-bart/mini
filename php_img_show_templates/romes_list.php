<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
 "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="pl" lang="pl" dir="ltr">

<?php
// read dir content:
$elems=scandir('.');
$dirs=array();
// select only images:
foreach($elems as $elem)
{
  if(!is_dir($elem))
    continue;
  if(!preg_match('/^[0-9]{4}_[0-9]{2}_[0-9]{2}_[\da-zA-Z_-]+/', $elem))
    continue;
  $dirs[]=$elem;
}
// newest rome on top:
rsort($dirs);
?>

<head>
  <meta http-equiv="content-type" content="text/html; charset=utf-8" />
  <meta http-equiv="cache-control" content="no-cache"/>
  <meta http-equiv="PRAGMA" content="no-cache"/>
  <title>
    wedrowki
  </title>
</head>

<body>

<?php
// put title
echo("<h1>to tu... to tam... :) </h1>\n");

echo("<ul style=\"list-style-position: inside;\">\n");
foreach($dirs as $dir)
{
  $name=preg_replace("/^[0-9]{4}_[0-9]{2}_[0-9]{2}_/", "", $dir);
  $date=preg_replace("/_" . $name . "$/", "", $dir);
  $name=preg_replace("/_/", " ", $name);
  $date=preg_replace("/_/", ".", $date);
  echo("<li><a href=\"$dir\">$date $name</a></li>\n");
}
echo("</ul>\n");

// add comment on image, if present
$txt_file='comment.txt';
if( @is_file($txt_file) )
  @readfile($txt_file);
?>

<p>
<a href="http://validator.w3.org/check?uri=referer">
<img src="http://www.w3.org/Icons/valid-xhtml10" alt="Valid XHTML 1.0 Transitional" height="31" width="88" />
</a>
</p>

</body>
</html>

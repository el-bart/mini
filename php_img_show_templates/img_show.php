<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
 "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="pl" lang="pl" dir="ltr">

<?php
// read dir content:
$elems=scandir('.');
$files=array();
// select only images:
foreach($elems as $elem)
{
  if(!is_file($elem))
    continue;
  if(!preg_match('/^[\da-zA-Z_-]+\.(jpg|png|gif)$/', $elem))
    continue;
  $files[]=$elem;
}

// remember current position:
if( isset($_GET['img']) && in_array($_GET['img'], $files) )
  $now=$_GET['img'];
else
  if( count($files)>0 )
    $now=$files[0];
  else
    $now=NULL;

// find next and prev files:
$prev_tmp=NULL;
$prev=NULL;
$next=NULL;
$index=0;
$total=count($files);
$tmp=0;
foreach($files as $file)
{
  // save position of current file
  if($file==$now)
    $index=$tmp;
  ++$tmp;

  // seek next file:
  if($next==NULL)
    if($now==$prev_tmp)
      $next=$file;

  // seek prev file:
  if($prev==NULL)
    if($now==$file)
      $prev=$prev_tmp;

  $prev_tmp=$file;
}
// remmeber string with "n/m" elements
$counter=($index+1) . "/" . $total;

?>

<head>
  <meta http-equiv="content-type" content="text/html; charset=utf-8" />
  <meta http-equiv="cache-control" content="no-cache"/>
  <meta http-equiv="PRAGMA" content="no-cache"/>
  <title>
    <?php echo($counter) ?>
  </title>
</head>

<body>

<?php
// draw picture and navigations buttons:
echo("<p>");
if($prev!=NULL)
  echo("<a href=\"index.php?img=$prev\">prev</a>");
else
  echo('prev');
echo(' ' . $counter . ' ');
if($next!=NULL)
  echo("<a href=\"index.php?img=$next\">next</a>");
else
  echo('next');
echo("</p>\n");
echo("<p><img src=\"$now\" alt=\"$now\"></img></p><br/>");

// add comment on image, if present
$txt_file=$now . '.txt';
if( @is_file($txt_file) )
  @readfile($txt_file);

// draw access to all images:
echo("<hr/>\n");
echo("<p>");
foreach($files as $file)
  echo("<a href=\"index.php?img=$file\">$file</a> ");
echo("</p>\n");
?>

<p>
<a href="http://validator.w3.org/check?uri=referer">
<img src="http://www.w3.org/Icons/valid-xhtml10" alt="Valid XHTML 1.0 Transitional" height="31" width="88" />
</a>
</p>

</body>
</html>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
  <script type="text/javascript" src="{$config.install_url}/includes/jquery.js"></script>
  <script type="text/javascript" src="{$config.install_url}/includes/interface.js"></script>
  <link rel="stylesheet" type="text/css" href="{$config.install_url}/templates/style.css" />
  <title>Toplist - Rate A Site</title>
  <style type="text/css">
  html {
    height: auto;
  }
  
  body {
    background-color: #efefe6;
    margin-top: 10px;
  }
  </style>
</head>
<body>

<table cellspacing="0" cellpadding="0" width="100%" class="table-header">
<tr>
<td class="table-header-l">
</td>
<td>
<b>Rate A Site</b>
</td>
<td class="table-header-r">
</td>
</tr>
</table>


<form method="post" action="{$config.install_url}/rate.php">

<div class="table-border">
<table cellspacing="1" cellpadding="5" width="100%" class="rows">
<tr>
<td colspan="2" style="padding-bottom: 5px;">
Please select your rating for this site from the drop down selection field listed below.

<br />
<br />

<a href="{$account.site_url|htmlspecialchars}" target="_blank">{$account.title|htmlspecialchars}</a> - {$account.description|htmlspecialchars}
</td>
</tr>
{* Display any errors encountered during the submission process *}
{if $errors}
<tr>
<td colspan="2" style="padding-bottom: 5px;">
<div class="error">
Please fix the following errors:<br />
<ol style="margin: 2px; padding-left: 23px; margin-top: 5px;">
{foreach var=$error from=$errors}
<li> {$error|htmlspecialchars}<br />
{/foreach}
</ol>
</div>
</td>
</tr>
{/if}

<tr>
<td width="150" align="right">
<b>Your Rating</b>
</td>
<td>
<select name="rating">
{range start=1 end=$config.max_rating counter=$counter}
  <option value="{$counter|htmlspecialchars}"{if $counter == $rating.rating} selected="selected"{/if}>{$counter|htmlspecialchars}{if ceil($config.max_rating/2) == $counter} - Average{elseif $counter == 1} - Worst{elseif $counter == $config.max_rating} - Best{/if}</option>
{/range}
</select>
</td>
</tr>
{* Display verification code if required *}
{if $config.rate_captcha}
<tr id="verification">
<td width="150" align="right">
<b>Verification</b>
</td>
<td>
<div>
<img src="{$config.install_url}/code.php" border="0" style="vertical-align: middle;">
<input type="text" name="captcha" size="20" style="vertical-align: middle;" />
</div>
<span class="small">Copy the characters from the image into the text box for verification</span>
</td>
</tr>
{/if}
<tr>
<td align="center" colspan="2">
<button type="submit">Submit</button>
</td>
</tr>
</table>
</div>

<input type="hidden" name="id" value="{$account.username|htmlspecialchars}" />
<input type="hidden" name="r" value="dorate" />
</form>

</body>
</html>
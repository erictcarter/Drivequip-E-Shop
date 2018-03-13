<?php

$msg = "First line of text\nSecond line of text";

$msg = wordwrap($msg,70);

if 9mail("chemhere.et@gmail.com","My Subject,$msg"))
{
	echo 'sent';
}
else
{
 ech0 'Error while sending email';
}
?>
//%attributes = {"invisible":true,"preemptive":"capable"}
C_TEXT:C284($1;$0;$escaped)

C_LONGINT:C283($i)
C_BOOLEAN:C305($shouldEscape)
C_BLOB:C604($data;$byte)

$escaped:=$1

SET BLOB SIZE:C606($byte;1)

$i:=1

ARRAY LONGINT:C221($pos;0)
ARRAY LONGINT:C221($len;0)

While (Match regex:C1019("((?:%[:hex_digit:]{2})+)";$escaped;$i;$pos;$len))
	
	$hex:=Substring:C12($escaped;$pos{1};$len{1})
	
	$start:=$pos{1}
	$length:=$len{1}
	
	$hex:=Replace string:C233($hex;"%";"";*)
	
	$ii:=1
	
	SET BLOB SIZE:C606($data;0)
	
	While (Match regex:C1019("([:Hex_Digit:]{2})";$hex;$ii;$pos;$len))
		$byte{0}:=Formula from string:C1601("0x"+Substring:C12($hex;$pos{1};$len{1})).call()
		COPY BLOB:C558($byte;$data;0;BLOB size:C605($data);1)
		$ii:=$pos{1}+$len{1}
	End while 
	
	$unescaped:=Convert to text:C1012($data;"utf-8")
	
	$escaped:=Delete string:C232($escaped;$start;$length)
	$escaped:=Insert string:C231($escaped;$unescaped;$start)
	
	$i:=$start+Length:C16($unescaped)
	
End while 

$0:=$escaped
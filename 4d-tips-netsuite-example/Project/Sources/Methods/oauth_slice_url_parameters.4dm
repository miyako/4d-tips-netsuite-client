//%attributes = {"invisible":true,"preemptive":"capable"}
C_TEXT:C284($1;$URL)
C_OBJECT:C1216($0;$status)

$URL:=$1

$status:=New object:C1471("parameters";New collection:C1472;"url";$URL)

ARRAY LONGINT:C221($pos;0)
ARRAY LONGINT:C221($len;0)

If (Match regex:C1019("([^?]+)\\?(.*)";$URL;1;$pos;$len))
	
	$status.url:=Substring:C12($URL;$pos{1};$len{1})
	$parameters:=Substring:C12($URL;$pos{2};$len{2})
	
	$i:=1
	
	While (Match regex:C1019("&?([^=]+)=([^&]*)";$parameters;$i;$pos;$len))
		
		$name:=Substring:C12($parameters;$pos{1};$len{1})
		$value:=Substring:C12($parameters;$pos{2};$len{2})
		
		$value:=oauth_urldecode ($value)
		
		$status.parameters.push(New object:C1471("name";$name;"value";$value))
		
		$i:=$pos{2}+$len{2}
		
	End while 
	
End if 

$0:=$status
//%attributes = {"invisible":true,"preemptive":"capable"}
C_VARIANT:C1683($1;$form_urlencoded)
C_COLLECTION:C1488($0;$bs_parameters)

$form_urlencoded:=$1
$bs_parameters:=New collection:C1472

If (Value type:C1509($form_urlencoded)=Is text:K8:3)
	
	$escaped:=Replace string:C233($form_urlencoded;"+";"%20";*)
	
	ARRAY LONGINT:C221($pos;0)
	ARRAY LONGINT:C221($len;0)
	
	$i:=1
	
	While (Match regex:C1019("&?([^=]+)=([^&]*)";$escaped;$i;$pos;$len))
		
		$name:=Substring:C12($escaped;$pos{1};$len{1})
		$value:=Substring:C12($escaped;$pos{2};$len{2})
		
		$value:=oauth_urldecode ($value)
		
		$bs_parameters.push(New object:C1471("name";$name;"value";$value))
		
		$i:=$pos{2}+$len{2}
		
	End while 
	
End if 

$0:=$bs_parameters
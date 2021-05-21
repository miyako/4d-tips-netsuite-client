//%attributes = {"invisible":true,"preemptive":"capable"}
C_COLLECTION:C1488($1;$auth_parameters)
C_TEXT:C284($0;$oauth_authorization_header)

$auth_parameters:=$1.copy()

  //this one needs to be escaped
For each ($auth_parameter;$auth_parameters.query("name == :1";"oauth_callback"))
	$auth_parameter.value:=oauth_urlencode ($auth_parameter.value)
End for each 

$bs_parameters_quoted:=New collection:C1472
For each ($auth_parameter;$auth_parameters)
	$bs_parameters_quoted.push($auth_parameter.name+"="+"\""+$auth_parameter.value+"\"")
End for each 

$oauth_authorization_header:=$bs_parameters_quoted.join(",")

$0:="OAuth "+$oauth_authorization_header
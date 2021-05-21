//%attributes = {"invisible":true}
C_TEXT:C284($1;$HTTP_method;$2;$URL)
C_COLLECTION:C1488($3;$bs_parameters)
C_TEXT:C284($0;$bs_string)

$HTTP_method:=$1
$URL:=$2
$bs_parameters:=$3

$url_slice:=oauth_slice_url_parameters ($URL)

$URL:=$url_slice.url
$bs_parameters:=$bs_parameters.concat($url_slice.parameters)

$bs_parameters_sorted:=New collection:C1472

For each ($bs_parameter;$bs_parameters.orderBy("name asc,value asc"))
	$bs_parameters_sorted.push(oauth_urlencode ($bs_parameter.name)+"="+oauth_urlencode ($bs_parameter.value))
End for each 

$bs_string:=$bs_parameters_sorted.join("&")

C_TEXT:C284($0;$bs_string)

$bs_string:=New collection:C1472($HTTP_method;oauth_urlencode ($URL);oauth_urlencode ($bs_string)).join("&")

$0:=$bs_string
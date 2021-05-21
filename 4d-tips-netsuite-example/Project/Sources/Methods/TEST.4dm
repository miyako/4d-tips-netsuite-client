//%attributes = {}
$HTTP_method:=HTTP POST method:K71:2
$URL:="https://1234567.restlets.api.netsuite.com/app/site/hosting/restlet.nl?script=775&deploy=1"

C_VARIANT:C1683($request)
C_OBJECT:C1216($response)

$POST_FORM:=True:C214

If ($POST_FORM)
	
	$request:="username=sid+the+sloth&password=slothsecret"  // content-type:application/x-www-form-urlencoded
	
Else 
	
	$request:=New object:C1471  //content-type:application/json
	
End if 

$oauth_consumer_key:=""
$oauth_nonce:=""
$oauth_signature_method:="HMAC-SHA256"
$oauth_timestamp:=String:C10(oauth_timestamp )
$oauth_version:="1.0"
$oauth_token:=""

  //these do not go in the base string
$oauth_consumer_secret:=""
$oauth_token_secret:=""

$bs_parameters:=New collection:C1472

  //put all OAuth parameters 
$bs_parameters.push(New object:C1471("name";"oauth_consumer_key";"value";$oauth_consumer_key))
$bs_parameters.push(New object:C1471("name";"oauth_token";"value";$oauth_token))
$bs_parameters.push(New object:C1471("name";"oauth_signature_method";"value";$oauth_signature_method))
$bs_parameters.push(New object:C1471("name";"oauth_timestamp";"value";$oauth_timestamp))
$bs_parameters.push(New object:C1471("name";"oauth_nonce";"value";$oauth_nonce))
$bs_parameters.push(New object:C1471("name";"oauth_version";"value";$oauth_version))

$auth_parameters:=$bs_parameters.copy()

$bs_parameters:=$bs_parameters.concat(oauth_form_urldecode ($request))

$bs_string:=oauth_base_string ($HTTP_method;$URL;$bs_parameters)
$oauth_signature:=oauth_signature ($oauth_signature_method;$bs_string;$oauth_consumer_secret;$oauth_token_secret)

$oauth_realm:="1234567"

  //put this at the top
$auth_parameters.unshift(New object:C1471("name";"realm";"value";oauth_urlencode ($oauth_realm)))
  //put this at the bottom
$auth_parameters.push(New object:C1471("name";"oauth_signature";"value";oauth_urlencode ($oauth_signature)))

$hdr_Authorization:=oauth_authorization_header ($auth_parameters)

ARRAY TEXT:C222($hdr_names;0)
ARRAY TEXT:C222($hdr_values;0)

APPEND TO ARRAY:C911($hdr_names;"Authorization")
APPEND TO ARRAY:C911($hdr_values;$hdr_Authorization)


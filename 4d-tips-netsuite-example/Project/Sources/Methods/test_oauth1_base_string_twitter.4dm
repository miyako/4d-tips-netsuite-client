//%attributes = {"invisible":true}
/*

for reference: example of OAuth 1.0a base string

*/
$HTTP_method:=HTTP POST method:K71:2
$URL:="https://api.twitter.com/1.1/statuses/update.json"

$oauth_consumer_key:="xvz1evFS4wEEPTGEFPHBog"
$oauth_nonce:="kYjzVBB8Y0ZFabxSWbWovY3uYSQ2pTgmZeNu2VS4cg"
$oauth_signature_method:="HMAC-SHA1"
$oauth_timestamp:="1318622958"
$oauth_token:="370773112-GmHxMAgYyLbNEtIKZeRNFsMKPR9EyMZeS9weJAEb"
$oauth_version:="1.0"

  //this does not go in the base string
$oauth_consumer_secret:="kAcSOqF21Fu85e7zjz7ZN2U4ZRhfV3WpwPAoE3Z7kBw"
$oauth_token_secret:="LswwdoUaIvS8ltyTt5jkRh4J50vUPVVHtR2YPi5kE"

$bs_parameters:=New collection:C1472

  //put all OAuth parameters 
$bs_parameters.push(New object:C1471("name";"oauth_consumer_key";"value";$oauth_consumer_key))
$bs_parameters.push(New object:C1471("name";"oauth_token";"value";$oauth_token))
$bs_parameters.push(New object:C1471("name";"oauth_nonce";"value";$oauth_nonce))
$bs_parameters.push(New object:C1471("name";"oauth_timestamp";"value";$oauth_timestamp))
$bs_parameters.push(New object:C1471("name";"oauth_signature_method";"value";$oauth_signature_method))
$bs_parameters.push(New object:C1471("name";"oauth_version";"value";$oauth_version))

$auth_parameters:=$bs_parameters.copy()

  //put all GET parameters  (if any)

  //put all POST parameters (if any)

$bs_parameters.push(New object:C1471("name";"status";"value";"Hello Ladies + Gentlemen, a signed OAuth request!"))
$bs_parameters.push(New object:C1471("name";"include_entities";"value";"true"))

$bs_string:=oauth_base_string ($HTTP_method;$URL;$bs_parameters)
$oauth_signature:=oauth_signature($oauth_signature_method;$bs_string;$oauth_consumer_secret;$oauth_token_secret)

ASSERT:C1129($oauth_signature="hCtSmYh+iHYCEqBWrE7C7hYmtUk=")

/*

https://developer.twitter.com/en/docs/authentication/oauth-1-0a/creating-a-signature

*/
//%attributes = {"invisible":true,"preemptive":"capable"}
C_TEXT:C284($1;$oauth_signature_method;$2;$bs_string;$3;$oauth_consumer_secret;$4;$oauth_token_secret)
C_TEXT:C284($0;$oauth_signature)

$oauth_signature_method:=$1
$bs_string:=$2
$oauth_consumer_secret:=$3
$oauth_token_secret:=$4

$oauth_hash_key:=oauth_urlencode ($oauth_consumer_secret)+"&"+oauth_urlencode ($oauth_token_secret)

CONVERT FROM TEXT:C1011($bs_string;"utf-8";$oauth_base_string_data)
CONVERT FROM TEXT:C1011($oauth_hash_key;"utf-8";$oauth_hash_key_data)

Case of 
	: ($oauth_signature_method="HMAC@SHA@256")
		
		$oauth_signature:=HMACSHA256 ($oauth_hash_key_data;$oauth_base_string_data;Crypto BASE64)
		
	: ($oauth_signature_method="HMAC@SHA@1")
		
		$oauth_signature:=HMACSHA1 ($oauth_hash_key_data;$oauth_base_string_data;Crypto BASE64)
		
End case 

$0:=$oauth_signature
# 4d-tips-netsuite-client
Call NetSuite OAuth API with HTTP Request

#### Dependencies
 
* [`HMACSHA256`](https://github.com/miyako/4d-plugin-common-crypto)
* [`oauth_timestamp`](https://github.com/miyako/4d-tips-netsuite-client/blob/main/4d-tips-netsuite-example/Project/Sources/Methods/oauth_timestamp.4dm)  
* [`oauth_urlencode`](https://github.com/miyako/4d-tips-netsuite-client/blob/main/4d-tips-netsuite-example/Project/Sources/Methods/oauth_urlencode.4dm)  

**Note**: you can use **PHP Execute** instead of the plugin

```4d
$success:=PHP Execute("";"hash_hmac";$hash;"sha256";$source;$key)
```

#### Points of interest

* [`oauth_form_urldecode`]

Form variables need to be canonised as parameters in the base string. Note that `application/x-www-form-urlencoded` is not the same as `urlencode` used in the base string. In particular, `application/x-www-form-urlencoded` converts spaces to the plus sign (`+`), not `%20`. 

* [`oauth_base_string`]

The base string must be sorted by name and value. `urlencode` is applied to both. URL parameters (`?foo=bar`) are not included in the URL section of the base string, they are canonised in the parameters section of the base string. 

* [`oauth_signature`]

`urlencode` is applied to both `oauth_consumer_secret` and `oauth_token_secret`. Concatenate with `&`, even if `oauth_token_secret` was an empty string.

* [`oauth_authorization_header`]

`oauth_callback` is double escaped.  


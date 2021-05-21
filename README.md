# 4d-tips-netsuite-client
Call NetSuite OAuth API with HTTP Request

#### Dependencies
 
* [`HMACSHA256` (common-crypto plugin)](https://github.com/miyako/4d-plugin-common-crypto)

**Note**: you can use **PHP Execute** instead of the plugin

```4d
$success:=PHP Execute("";"hash_hmac";$hash;"sha256";$source;$key)
```

* [`oauth_timestamp`](https://github.com/miyako/4d-tips-netsuite-client/blob/main/4d-tips-netsuite-example/Project/Sources/Methods/oauth_timestamp.4dm)
* [`oauth_urlencode`](https://github.com/miyako/4d-tips-netsuite-client/blob/main/4d-tips-netsuite-example/Project/Sources/Methods/oauth_urlencode.4dm)

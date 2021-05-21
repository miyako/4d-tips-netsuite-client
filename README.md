# 4d-tips-netsuite-client
Call NetSuite OAuth API with HTTP Request

#### Dependencies
 
* [`HMACSHA256`](https://github.com/miyako/4d-plugin-common-crypto) from 4d-plugin-common-crypto

**Note**: you can use **PHP Execute** instead of the plugin

```4d
$success:=PHP Execute("";"hash_hmac";$hash;"sha256";$source;$key)
```

* [URL_Escape (Project Method in this repo)](https://github.com/miyako/4d-tips-google-service-account/blob/master/URL_Escape.txt)
* [Unix_Timestamp (Project Method in this repo)](https://github.com/miyako/4d-tips-google-service-account/blob/master/Unix_Timestamp.txt)

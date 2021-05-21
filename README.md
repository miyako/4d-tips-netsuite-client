# 4d-tips-netsuite-client
Call NetSuite OAuth API with HTTP Request

#### Dependencies

* [4d-plugin-common-crypto](https://github.com/miyako/4d-plugin-common-crypto)
  * HMACSHA256

**Note**: alternatively, you can use **PHP Execute**

```4d
$success:=PHP Execute("";"hash_hmac";$hash;"sha256";$source;$key)
```

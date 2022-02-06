# Chart variables

## Appwrite

| Parameter                           | Description                                                                                                                                                                                                                                                                                                                                                                                                                                    | Type       | Available values            | Default value        |
| ----------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------- | --------------------------- | -------------------- |
| `appwrite.env`                      | Set your server running environment.                                                                                                                                                                                                                                                                                                                                                                                                           | `string`   | `production`, `development` | `production`         |
| `appwrite.locale`                   | Set your Appwrite's locale.                                                                                                                                                                                                                                                                                                                                                                                                                    | `string`   | any supported locale        | `en`                 |
| `appwrite.sslKey`                   | This is your server private secret key that is used to encrypt all sensitive data on your server. Appwrite server encrypts all secret data on your server like webhooks, HTTP passwords, user sessions, and storage files.                                                                                                                                                                                                                     | `string`   | any non-empty string        | **Mandatory**        |
| `appwrite.domain`                   | Your Appwrite domain address.                                                                                                                                                                                                                                                                                                                                                                                                                  | `string`   | any non-empty string        | `localhost`          |
| `appwrite.options.abuse`            | Allows you to disable abuse checks and API rate limiting.                                                                                                                                                                                                                                                                                                                                                                                      | `boolean`  | `true`, `false`             | `true`               |
| `appwrite.options.forceHttps`       | Allows you to force HTTPS connection to your API. This feature redirects any HTTP call to HTTPS and adds the 'Strict-Transport-Security' header to all HTTP responses. **This feature will work only when your ports are set to default 80 and 443.**                                                                                                                                                                                          | `boolean`  | `true`, `false`             | `false`              |
| `appwrite.console.whitelist.root`   | This option allows you to disable the creation of new users on the Appwrite console. When enabled only 1 user will be able to use the registration form. New users can be added by inviting them to your project.                                                                                                                                                                                                                              | `boolean`  | `true`, `false`             | `true`               |
| `appwrite.console.whitelist.emails` | This option allows you to limit creation of new users on the Appwrite console. This option is very useful for small teams or sole developers.                                                                                                                                                                                                                                                                                                  | `string[]` | any non-empty string        | `[]`                 |
| `appwrite.console.whitelist.ips`    | This last option allows you to limit creation of users in Appwrite console for users sharing the same set of IP addresses. This option is very useful for team working with a VPN service or a company IP.                                                                                                                                                                                                                                     | `string[]` | any non-empty string        | `[]`                 |
| `appwrite.system.email.name`        | This is the sender name value that will appear on email messages sent to developers from the Appwrite console. You can use url encoded strings for spaces and special chars.                                                                                                                                                                                                                                                                   | `string`   | any non-empty string        | `"Appwrite"`         |
| `appwrite.system.email.addr`        | This is the sender email address that will appear on email messages sent to developers from the Appwrite console. You should choose an email address that is allowed to be used from your SMTP server to avoid the server email ending in the users' SPAM folders.                                                                                                                                                                             | `string`   | any non-empty string        | `"team@appwrite.io"` |
| `appwrite.system.responseFormat`    | Use this environment variable to set the default Appwrite HTTP response format to support an older version of Appwrite. This option is useful to overcome breaking changes between versions. You can also use the X-Appwrite-Response-Format HTTP request header to overwrite the response for a specific request. This variable accepts any valid Appwrite version. To use the current version format, leave the value of the variable empty. | `string`   | ---                         | `empty`              |
| `appwrite.system.securityAddress`   | This is the email address used to issue SSL certificates for custom domains or the user agent in your webhooks payload.                                                                                                                                                                                                                                                                                                                        | `string`   | any valid e-mail address    | **Mandatory**        |
| `appwrite.usageStats`               | This variable allows you to disable the collection and displaying of usage stats. When disabled, it's recommended to turn off the Worker Usage, InfluxDB and Telegraf containers for better resource usage.                                                                                                                                                                                                                                    | `boolean`  | `true`, `false`             | `true`               |

## Redis

| Parameter    | Description            | Type     | Available values                                | Default value |
| ------------ | ---------------------- | -------- | ----------------------------------------------- | ------------- |
| `redis.port` | Redis server TCP port. | `number` | any number in range 1-65535 [^privileged-ports] | `6379`        |
| `redis.user` | Redis server user.     | `string` | any string, may be empty                        | `empty`       |
| `redis.pass` | Redis server password. | `string` | any string, may be empty                        | `empty`       |

## MariaDB

| Parameter     | Description                     | Type     | Available values                                | Default value        |
| ------------- | ------------------------------- | -------- | ----------------------------------------------- | -------------------- |
| `db.port`     | MariaDB server TCP port.        | `number` | any number in range 1-65535 [^privileged-ports] | `3306`               |
| `db.schema`   | MariaDB server database schema. | `string` | any valid db name                               | `appwrite`           |
| `db.user`     | MariaDB server user name.       | `string` | any valid username                              | `user`               |
| `db.password` | MariaDB server user password.   | `string` | any non-empty string                            | `password`           |
| `db.rootPass` | MariaDB server root password.   | `string` | any non-empty string                            | `rootsecretpassword` |

## InfluxDB

| Parameter       | Description               | Type     | Available values                                | Default value |
| --------------- | ------------------------- | -------- | ----------------------------------------------- | ------------- |
| `influxdb.port` | InfluxDB server TCP port. | `number` | any number in range 1-65535 [^privileged-ports] | `8086`        |

## StatsD

| Parameter     | Description             | Type     | Available values                                | Default value |
| ------------- | ----------------------- | -------- | ----------------------------------------------- | ------------- |
| `statsd.port` | StatsD server UDP port. | `number` | any number in range 1-65535 [^privileged-ports] | `8125`        |

## SMTP

| Parameter     | Description                                                                                     | Type     | Available values | Default value |
| ------------- | ----------------------------------------------------------------------------------------------- | -------- | ---------------- | ------------- |
| `smtp.host`   | SMTP server host name address. Use an empty string to disable all mail sending from the server. | `string` | any string       | `empty`       |
| `smtp.port`   | SMTP server TCP port.                                                                           | `number` | any number       | `0`           |
| `smtp.secure` | SMTP secure connection protocol.                                                                | `string` | any string       | `empty`       |
| `smtp.user`   | SMTP server user name.                                                                          | `string` | any string       | `empty`       |
| `smtp.pass`   | SMTP server user password.                                                                      | `string` | any string       | `empty`       |

## Storage

| Parameter                   | Description                                                                      | Type      | Available values                 | Default value |
| --------------------------- | -------------------------------------------------------------------------------- | --------- | -------------------------------- | ------------- |
| `storage.limit`             | Maximum file size allowed for file upload. The default value is 10MB limitation. | `number`  | any number                       | `10Mi`        |
| `storage.antivirus.enabled` | This variable allows you to disable the internal anti-virus scans.               | `boolean` | `true`[^antivirus-note], `false` | `false`       |
| `storage.antivirus.port`    | ClamAV server TCP port.                                                          | `number`  | any number                       | `3310`        |

## Functions [^functions-note]

| Parameter              | Description                                                                                                                                                                                                                                          | Type       | Available values                        | Default value                           |
| ---------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------- | --------------------------------------- | --------------------------------------- |
| `functions.timeout`    | The maximum number of seconds allowed as a timeout value when creating a new function.                                                                                                                                                               | `number`   | any number                              | 900                                     |
| `functions.containers` | The maximum number of containers Appwrite is allowed to keep alive in the background for function environments. Running containers allow faster execution time as there is no need to recreate each container every time a function gets executed.   | `number`   | any number                              | 10                                      |
| `functions.cpus`       | The maximum number of CPU core a single cloud function is allowed to use. Please note that setting a value higher than available cores will result in a function error, which might result in an error. When it's empty, CPU limit will be disabled. | `number`   | any number                              | 1                                       |
| `functions.memory`     | The maximum amount of memory a single cloud function is allowed to use in megabytes. When it's empty, memory limit will be disabled.                                                                                                                 | `number`   | any number                              | 256Mb                                   |
| `functions.swap`       | The maximum amount of swap memory a single cloud function is allowed to use in megabytes. The default value is empty. When it's empty, swap memory limit will be disabled.                                                                           | `number`   | any number                              | 256Mb                                   |
| `functions.runtimes`   | This option allows you to limit the available environments for cloud functions.                                                                                                                                                                      | `string[]` | see [here](#functions-and-environments) | see [here](#functions-and-environments) |
| `functions.envs`       | Deprecated with 0.8.0, use 'functions.runtimes' instead!                                                                                                                                                                                             | `string[]` | see [here](#functions-and-environments) | see [here](#functions-and-environments) |

## Chart-related variables

### Ingress

| Parameter                      | Description                           | Type      | Available values | Default value |
| ------------------------------ | ------------------------------------- | --------- | ---------------- | ------------- |
| `ingress.<svc>.enabled`        | Enables Ingress for service `<svc>`   | `boolean` | `true`, `false`  | `true`        |
| `ingress.<svc>.externalPort`   | Service port                          | `number`  |                  | `80`          |
| `ingress.<svc>.annotations`    | Annotations, added to Ingress         | `{}`      | --               | `{}`          |
| `ingress.<svc>.tls.enabled`    | Enables TLS for Ingress               | `boolean` | `true`, `false`  | `true`        |
| `ingress.<svc>.tls.secretName` | Used for certificate when TLS enabled | `string`  | --               | `""`          |

where `svc` can be:

| `<svc>`  | Short description                     |
| -------- | ------------------------------------- |
| appwrite | Used for UI and API (except realtime) |
| realtime | Used only for realtime subscriptions  |

### Persistent storage

Required access modes for services

| Service                 | Access mode | Default PVC name             |
| ----------------------- | ----------- | ---------------------------- |
| `mariadb`               | RWO         | `mysql-data`                 |
| `redis`                 | RWO         | `redis-data`                 |
| `influxdb`              | RWO         | `influxdb-data`              |
| `appwrite.cache`        | RWO         | `appwrite-cache-data`        |
| `appwrite.certificates` | RWO         | `appwrite-certificates-data` |
| `appwrite.uploads`      | RWO         | `appwrite-uploads-data`      |
| `appwrite.config`       | RWO         | `appwrite-config-data`       |
| `appwrite.functions`    | RWO         | `appwrite-functions-data`    |

| Parameter                      | Description                                 | Type           | Available values                                                          | Default value      |
| ------------------------------ | ------------------------------------------- | -------------- | ------------------------------------------------------------------------- | ------------------ |
| `volumes.<svc>.enabled`        | Enables persistent storage for service pods | `boolean`      | `true`, `false`                                                           | `true`             |
| `volumes.<svc>.create`         | Enables automatic creation of PVC           | `boolean`      | `true`, `false`                                                           | `true`             |
| `volumes.<svc>.storageClass`   | StorageClass used for autoprovisioning PVC  | `StorageClass` | Any compatible StorageClass (see required access modes for volumes above) | `""`               |
| `volumes.<svc>.storageRequest` | Size of requested PV                        | `number`       | `number`                                                                  | `100Mi`            |
| `volumes.<svc>.pvcName`        | Name of PVC                                 | `boolean`      | `true`, `false`                                                           | depends on service |

## Environment variables matches

| In `.env`                            | In chart values                     |
| ------------------------------------ | ----------------------------------- |
| `_APP_ENV`                           | `appwrite.env`                      |
| `_APP_OPENSSL_KEY_V1`                | `appwrite.sslKey`                   |
| `_APP_LOCALE`                        | `appwrite.locale`                   |
| `_APP_OPTIONS_ABUSE`                 | `appwrite.options.abuse`            |
| `_APP_OPTIONS_FORCE_HTTPS`           | `appwrite.options.forceHttps`       |
| `_APP_DOMAIN`                        | `appwrite.domain`                   |
| `_APP_DOMAIN_TARGET`                 | `appwrite.domain`                   |
| `_APP_CONSOLE_WHITELIST_ROOT`        | `appwrite.console.whitelist.root`   |
| `_APP_CONSOLE_WHITELIST_EMAILS`      | `appwrite.console.whitelist.emails` |
| `_APP_CONSOLE_WHITELIST_IPS`         | `appwrite.console.whitelist.ips`    |
| `_APP_SYSTEM_EMAIL_NAME`             | `appwrite.system.email.name`        |
| `_APP_SYSTEM_EMAIL_ADDRESS`          | `appwrite.system.email.addr`        |
| `_APP_SYSTEM_RESPONSE_FORMAT`        | `appwrite.system.responseFormat`    |
| `_APP_SYSTEM_SECURITY_EMAIL_ADDRESS` | `appwrite.system.securityAddress`   |
| `_APP_USAGE_STATS`                   | `appwrite.usageStats`               |
| `_APP_REDIS_HOST`                    | calculated on installation          |
| `_APP_REDIS_PORT`                    | `redis.port`                        |
| `_APP_REDIS_USER`                    | `redis.user`                        |
| `_APP_REDIS_PASS`                    | `redis.pass`                        |
| `_APP_DB_HOST`                       | calculated on installation          |
| `_APP_DB_PORT`                       | `db.port`                           |
| `_APP_DB_SCHEMA`                     | `db.schema`                         |
| `_APP_DB_USER`                       | `db.user`                           |
| `_APP_DB_PASS`                       | `db.password`                       |
| `_APP_DB_ROOT_PASS`                  | `db.rootPass`                       |
| `_APP_INFLUXDB_PORT`                 | `influxdb.port`                     |
| `_APP_STATSD_PORT`                   | `statsd.port`                       |
| `_APP_SMTP_HOST`                     | `smtp.host`                         |
| `_APP_SMTP_PORT`                     | `smtp.port`                         |
| `_APP_SMTP_SECURE`                   | `smtp.secure`                       |
| `_APP_SMTP_USERNAME`                 | `smtp.user`                         |
| `_APP_SMTP_PASSWORD`                 | `smtp.pass`                         |
| `_APP_STORAGE_LIMIT`                 | `storage.limit`                     |
| `_APP_STORAGE_ANTIVIRUS`             | `storage.antivirus.enabled`         |
| `_APP_STORAGE_ANTIVIRUS_HOST`        | `storage.antivirus.host`            |
| `_APP_STORAGE_ANTIVIRUS_PORT`        | `storage.antivirus.port`            |
| `_APP_FUNCTIONS_TIMEOUT`             | `functions.timeout`                 |
| `_APP_FUNCTIONS_CONTAINERS`          | `functions.containers`              |
| `_APP_FUNCTIONS_CPUS`                | `functions.cpus`                    |
| `_APP_FUNCTIONS_MEMORY`              | `functions.memory`                  |
| `_APP_FUNCTIONS_MEMORY_SWAP`         | `functions.swap`                    |
| `_APP_FUNCTIONS_RUNTIMES`            | `functions.runtimes`                |
| `_APP_FUNCTIONS_ENVS`                | `functions.envs`                    |

## Notes

[^privileged-ports]: You can use port in range 1-1024 only in 'privileged' containers
[^antivirus-note]: feature not implemented in chart version `1.0.0`
[^functions-note]: functions not implemented in chart version `1.0.0`

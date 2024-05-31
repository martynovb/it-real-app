# it_real_app

***********

## Autogeneration

- generate **freezed** files
- generate **getIt** files
- generate **json** files

```
dart run build_runner build
```
***********

## Config file structure


*lib/targets/[target_name]/configs.json*

```
{
  "redirectUrl": "https...."
  "supabaseAnonKey": "eyJhbGcxxxxx",
  "supabaseUrl": "https://xxxxx.supabase.co",
  "sentryDsn": : "",
  ""stripePublishableKey": ""
}
```

***********
## Generate loclization keys file

```
dart run easy_localization:generate -S ./assets/translations --output-dir ./lib/presentation/shared/localization --output-file locale_keys.g.dart -f keys
```
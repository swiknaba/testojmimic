example app for the following issue: https://github.com/ohler55/oj_mimic_json/issues/7


adding the following gems:

```ruby
gem 'oj'
gem 'oj_mimic_json'
```

then running

```shell
bundle exec rails action_text:install
```

results in `JSON::ParserError: unexpected characters after the JSON document () at line 30, column 2 [sparse.c:642]`.


Removing `oj_mimic_json` solves the issue, hence this gem is the prime suspect.

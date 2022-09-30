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


Find a docker image here: https://hub.docker.com/layers/lud11/swiknaba/testojmimic/images/sha256-18822523defe24a7937a397acf6b0d0d5401604e4d0e527ab41dde45a120ddc7?context=repo

Quick demo: https://www.loom.com/share/3304286f50ff47c79228b58e0482eea4

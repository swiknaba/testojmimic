source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.5'

gem 'rails', '~> 6.1', '>= 6.1.4'

# rails won't boot because core dependencies were removed here to easy installation
# these are not necessary to trigger the bug described in the README

gem 'oj' # super fast JSON parsing/dumping
gem 'oj_mimic_json'


# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
# Linux containers also need this
gem 'tzinfo-data'

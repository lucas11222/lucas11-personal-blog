#!/usr/bin/env bash

set -o errexit

bundle install
chmod a+x bin/rails
bin/rails assets:precompile
bin/rails assets:clean

bin/rails db:migrate
bin/rails blog_posts:import_md

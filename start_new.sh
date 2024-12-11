#!/bin/bash

raild bundler
rails bundler up

rails tmp:clear
rails assets:clobber
rails assets:precompile

rails db:migrate
#!/bin/bash

docker build . --tag amkisko/alpine-rbenv-nodenv
docker push amkisko/alpine-rbenv-nodenv:latest


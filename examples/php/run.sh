#!/bin/bash

docker run --name=webapp -e "WEBAPP_ROOT=public" -v .:/app -p 80:80 yonh/php:alpine-apache


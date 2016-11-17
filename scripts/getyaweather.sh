#! /bin/bash

CITY=ulyanovsk
# CITY=svobodniy
curl https://p.ya.ru/$CITY > ~/.curweather 2>/dev/null

exit 0

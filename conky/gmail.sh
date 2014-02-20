#!/bin/bash

curl -s -u ${1}:${2} https://mail.google.com/mail/feed/atom | grep fullcount | sed 's/<[^0-9]*>//g'
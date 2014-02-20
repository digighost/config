#!/bin/sh

killall conky
conky -dc conkyrc
conky -dc conkyrc_calendar
conky -dci conkyrc_news

exit

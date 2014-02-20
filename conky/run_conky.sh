#!/bin/sh

killall conky
conky -dc ~/.scripts/conky/.conkyrc
conky -dc ~/.scripts/conky/.conkyrc_calendar
conky -dc ~/.scripts/conky/conkyrc_news

exit
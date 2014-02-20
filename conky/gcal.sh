#!/bin/sh
~/.scripts/conky/gcalcli/gcalcli agenda --nolineart --monday --conky --color_owner=blue --color_writer=green --color_reader=yellow --color_freebusy=white --color_date=white --color_now_marker=red --color_border=white


## calendar
~/.scripts/conky/gcalcli/gcalcli --conky calw 2 --nolineart --monday --color_owner=blue --color_writer=green --color_reader=yellow --color_freebusy=white --color_date=white --color_now_marker=red --color_border=white |
sed -e 's/|/│/g' \
	-e 's/-/─/g' \
	-e 's/+/=/g'
#!/bin/sh
find . -type f | xargs grep -rn $1

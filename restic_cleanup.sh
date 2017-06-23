#!/bin/bash

export RESTIC_PASSWORD=$2

/usr/local/bin/restic -r $1 forget --keep-last $3 --keep-daily $4 --keep-monthly $5 --keep-yearly $6


#!/bin/bash
#NOTE: configured for PHON1 computer.
restore-default-audio-settings

#start up ZEP experiment
gnome-terminal --title "ZEP Console" -x bash -c "cd bwsn; zep bwsn.zp; bash"


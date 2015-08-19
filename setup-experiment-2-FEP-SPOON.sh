#!/bin/bash
#NOTE: configured for PHON1 computer.
restore-default-audio-settings

#Selected audiodevice for noise:
export AUDIODEV=plughw:1,0

# Just make sure the volume for any noise is set correctly:
# card 0 is Xonar and used for recording / zep beeps.
amixer -c 0 sset Master 100% on

# card 1 is the onboard intel and used for playing the brown noise
amixer -c 1 sset Master 100% on
amixer -c 1 sset Front 100% on
amixer -c 1 sset PCM 100% on

# Play noise on a channel.
AUDIOFILE="BrownNoise_HighPass_25Hz.wav"
MESSAGE="Press [Enter] to start playing $AUDIOFILE and [CTRL+C] once to pause, twice to exit"
COMMAND="echo $MESSAGE && read && play $AUDIOFILE repeat 9999"
TERMINALTITLE="Noise Sound Generator at $AUDIODEV"

#USE sox ('play;') to play it via the following audiodevice
gnome-terminal --title "$TERMINALTITLE" -x bash -c "while true; do $COMMAND; done" &

#start up FEP experiment
gnome-terminal --title "FEP Console" -x bash -c "fep" &

#copy over audacity settings
cp -r audacity.cfg ~/.audacity-data/audacity.cfg
audacity &

#!/bin/zsh

if [[ "$OSTYPE" == "linux-gnu" ]]; then
	json=$( curl -X "GET" "https://api.spotify.com/v1/me/player/currently-playing" -H "Accept: application/json" -H "Content-Type: application/json" -H "Authorization: Bearer "$($DOTFILES/bin/spotify_token.sh) )
	echo `echo $json | jq .item.name | awk -F '"' '{print $2}'`" - "`echo $json | jq .item.artists | grep name | awk -F '"' '{print $4}'`
elif [[ "$OSTYPE" == "darwin"* ]]; then
	osascript -l JavaScript $DOTFILES/js/tunes.js
fi

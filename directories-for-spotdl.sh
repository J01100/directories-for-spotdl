#!/bin/bash

# get the current working directory
cwd=$(pwd)

# loop through the playlist URLs passed as arguments
for url in "$@"
do
    # create a new directory for the downloaded songs
    dir_name=$(echo "$url" | sed 's/https___open_spotify_com_playlist_//' | sed 's/[^a-zA-Z0-9]/_/g')
    mkdir "$dir_name"

    # enter the new directory
    cd "$dir_name"

    # download the songs from the playlist using spotdl
    spotdl "$url"

    # exit the new directory and return to the previous directory
    cd "$cwd"
done

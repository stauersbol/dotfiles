#!/usr/bin/env bash

images_path=~/.wallpapers/
variations=(soraforest.jpg ritual.jpg soramountain.jpg)
number=$((RANDOM % 3))
image=${variations[$number]}
wallpaper=$images_path$image
swww img "$wallpaper" --transition-type grow --transition-pos 0.9,0.1 --transition-duration 1.5 --transition-fps 90

#!/bin/bash
# JPEGs derotation with exiftool 
exiftool -Orientation=1 -n "$@"

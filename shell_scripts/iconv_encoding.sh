#!/bin/bash

IN_ENCODING="GBK"
OUT_ENCODING="UTF-8"

`iconv -f $IN_ENCODING -t $OUT_ENCODING $0 -o $1`

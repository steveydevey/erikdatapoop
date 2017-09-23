#!/bin/bash
# this is just an example of how we can convert a shitload at a time

for file in oldfiles*.txt ; do \
  iconv -f UTF-16LE -t UTF-8 ${file} ${file}_utf8 ;\
done

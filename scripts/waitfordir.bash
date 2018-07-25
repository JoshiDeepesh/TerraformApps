#!/bin/bash
sleep 180s
dirverhdp=$(ls /usr/hdp/ | head -1)
ln -s /usr/hdp/$dirverhdp /usr/hdp/2.6 > /dev/null 2>&1
echo "link created"

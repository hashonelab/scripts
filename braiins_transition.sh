#!/bin/bash

BRAIINS="/home/spacedust/braiins/main/factory_transition"

cd $BRAIINS

virtualenv --python=/usr/bin/python3 .env

source .env/bin/activate

pip install -r ./requirements.txt	

for host in $(cat braiinsiplist.txt); do

	echo "$host"

done 


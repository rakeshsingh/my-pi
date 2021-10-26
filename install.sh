#!/bin/bash

SETUP="./setup"
TEARDOWN="./teardown"


for step in `ls setup`
  do
  sh $SETUP/$step
done

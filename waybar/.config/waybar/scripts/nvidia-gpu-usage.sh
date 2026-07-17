#!/bin/sh

nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits | awk '{if (length($0) < 2) $0 = " " substr($0,1) } 1'

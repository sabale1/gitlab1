#!/bin/bash
sed "s/tagVersion/$1/g" pods.yml > php-pod.yml

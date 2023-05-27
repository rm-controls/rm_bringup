#!/bin/bash
if [[ $# -ne 1 ]];then
  echo "Please input robot name"
  exit 1
fi

cp ./$1.sh ~/environment.sh

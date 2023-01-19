#!/bin/bash

cluster=$(kubectl config current-context)

if [[ $(echo $cluster | grep "prod") ]]; then
  output="%{F#f38ba8}ﴱ $cluster %{F-}"
else 
  output="%{F#a6e3a1}ﴱ $cluster %{F-}"
fi 

echo "$output"

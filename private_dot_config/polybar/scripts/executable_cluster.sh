#!/bin/bash

namespace=$(kubectl config current-context)

if [[ $(echo $namespace | grep "prod") ]]; then
  output="%{F#f38ba8}ﴱ $namespace %{F-}"
else 
  output="%{F#a6e3a1}ﴱ $namespace%{F-}"
fi 

echo "$output"

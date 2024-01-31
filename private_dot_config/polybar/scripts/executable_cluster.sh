#!/bin/zsh
alias kubectl="/home/linuxbrew/.linuxbrew/bin/kubectl"
cluster=$(kubectl config current-context)

if [[ $(echo $cluster | grep "prod") ]]; then
  output="%{F#f38ba8}%{T8}󱃾%{T-} $cluster %{T9}%{T-}%{F-}"
else 
  output="%{F#a6e3a1}%{T8}󱃾%{T-} $cluster%{F-}"
fi 

echo "$output"

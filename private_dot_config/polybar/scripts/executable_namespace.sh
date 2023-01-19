#!/bin/bash

NS=$(kubectl config view --minify --output 'jsonpath={..namespace}')
NS=$([ ! -z "$NS" ] && echo "$NS" || echo "default")

echo "$NS"

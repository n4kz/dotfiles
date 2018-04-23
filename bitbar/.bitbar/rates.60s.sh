#!/bin/bash

set -e
set -o pipefail

source $HOME/.profile

DATA=$(curl -s https://www.banki.ru/products/currency/ajax/informer/data/ | jq '.moex[] | .value')
RATE=( $DATA )

printf "%.2f %.2f" ${RATE[0]} ${RATE[1]}

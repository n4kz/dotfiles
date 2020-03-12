#!/bin/bash

function endpoint {
	echo -n "https://iss.moex.com"
	echo -n "/iss/engines/currency/markets/selt/boards/CETS/securities/$1.json"
}

function fetch {
	echo -n $(curl -s $(endpoint $1) | jq '.marketdata.data[0][8]')
}

set -e
set -o pipefail

source $HOME/.profile

printf '%.2f %.2f' $(fetch USD000UTSTOM) $(fetch EUR_RUB__TOM)

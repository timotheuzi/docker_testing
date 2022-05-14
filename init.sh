#!/bin/bash

echo Starting team red miner...
echo ============================================================
echo Server: $SERVER
echo Algorithm: $ALGO
echo Wallet: $WALLET
echo Worker: $WORKER
echo Pass: $PASS
echo ============================================================

./teamredminer -a kawpow -o stratum+tcp://stratum.ravenminer.com:3838 -u RA9w4yJRaUoVXyfHqenu8BWUYwjiJKQ9Uv.trmtest -p x

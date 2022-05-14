#!/bin/bash

echo Starting team red miner...
echo ============================================================
echo Server: $SERVER
echo Algorithm: $ALGO
echo Wallet: $WALLET
echo Worker: $WORKER
echo Pass: $PASS
echo ============================================================
export GPU_MAX_ALLOC_PERCENT=100
export GPU_SINGLE_ALLOC_PERCENT=100
export GPU_MAX_HEAP_SIZE=100
export GPU_USE_SYNC_OBJECTS=1

./teamredminer -a kawpow -o stratum+tcp://us.ravenminer.com:3838 -u RA9w4yJRaUoVXyfHqenu8BWUYwjiJKQ9Uv.test
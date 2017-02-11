#!/bin/ash

export CONSUL_URL=$(getent hosts consul | awk '{ print $1 }'):8500
consul-template -consul=$CONSUL_URL -template="/app/nghttpx.tmpl:/app/nghttpx.conf:pkill -SIGHUP nghttpx || true" > $CONSUL_LOG_FILE &
sleep 2
nghttpx --conf /app/nghttpx.conf -s -k


#!/bin/bash

echo "Temporarizado de Estudos"

start=$(date +%s)
now=$(date +%s)
diff=$((now - start))

loop_time(){
    while true; do 
        now=$(date +%s)
        diff=$((now - start))
        printf "Tempo: %02d:%02d:%02d\n" $((diff/3600)) $((diff%3600/60)) $((diff%60)) > /tmp/timer_log
        sleep 1
        echo $start > /tmp/times ; echo $now >> /tmp/times ; echo $diff >> /tmp/times   
    done
}


if [ "$1" = "start" ]; then
    loop_time > /tmp/timer_log &
    pid=$! 
    echo $pid > /tmp/timer_pid
fi

if [ "$1" = "stop" ]; then
    echo $!
    diff=$(sed -n '3p' /tmp/times)
    printf "Cronômetro: %02d:%02d:%02d\n" $((diff/3600)) $((diff%3600/60)) $((diff%60))
    kill "$(cat /tmp/timer_pid)"
    echo "" > /tmp/timer_pid
    # kill $!
fi


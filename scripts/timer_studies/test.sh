#!/bin/bash

echo "======= Temporarizado de Estudos ======="

loop_time() {
    diff_acumulado=${1:-0}
    start=$(date +%s)

    while true; do 
        now=$(date +%s)
        diff=$((now - start + diff_acumulado))
        printf "Tempo: %02d:%02d:%02d\n" \
            $((diff/3600)) $((diff%3600/60)) $((diff%60)) > /tmp/timer_log | sed -n '1p'

        # salva infos (start atual, now atual, diff acumulado)
        echo "$start" > /tmp/times
        echo "$now"  >> /tmp/times
        echo "$diff" >> /tmp/times
        echo "Temporarizador em Execução" >> /tmp/timer_log

        sleep 1
    done
}


if [ "$1" = "start" ]; then
    loop_time 0 &
    pid=$! 
    echo $pid > /tmp/timer_pid
fi

if [ "$1" = "stop" ]; then 
    diff=$(sed -n '3p' /tmp/times)
    printf "Cronômetro: %02d:%02d:%02d\n" $((diff/3600)) $((diff%3600/60)) $((diff%60))
    kill "$(cat /tmp/timer_pid)"
    echo "" > /tmp/timer_pid
fi

if [ "$1" = "continue" ]; then
    start=$(sed -n '1p' /tmp/times)
    diff_acomulado=$(sed -n '3p' /tmp/times)

    loop_time "$diff_acomulado" &
    pid=$! 
    echo $pid > /tmp/timer_pid
fi

if [ "$1" = "status" ]; then
    sed -n '2p' /tmp/timer_log
fi

if [ "$1" = "finish" ]; then
    echo "finalizado"
    kill "$(cat /tmp/timer_pid)"
    exit 0
fi


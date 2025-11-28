#!/bin/bash

echo "======= Temporarizado de Estudos ======="

kill_process(){
    if [ "$(wc -c < /tmp/timer_pid)" -eq 0 ]; then
        echo "Sem processo para parar!"
        exit 0
    fi

    kill "$(cat /tmp/timer_pid)"
    > /tmp/timer_pid
}

loop_time() {
    # ps | grep test.sh | wc -l
    diff_acumulado=${1:-0}
    start=$(date +%s)

    while true; do 
        now=$(date +%s)
        diff=$((now - start + diff_acumulado))
        printf "Tempo: %02d:%02d:%02d\n" \
            $((diff/3600)) $((diff%3600/60)) $((diff%60)) > /tmp/timer_log | sed -n '1p'
        echo "$start" > /tmp/times
        echo "$now"  >> /tmp/times
        echo "$diff" >> /tmp/times
        echo "Status: Rodando" >> /tmp/timer_log

        sleep 1
    done
}

start(){
    loop_time 0 &
    pid=$! 
    echo $pid > /tmp/timer_pid
}

stop(){
    sed -i '1,2s/Rodando/Parado/' /tmp/timer_log 
    kill_process
}

Continue(){
    start=$(sed -n '1p' /tmp/times)
    diff_acomulado=$(awk 'NR==3' /tmp/times)
    sed -i '2s/Parado/Rodando/' /tmp/timer_log
    loop_time "$diff_acomulado" &
    pid=$! 
    echo $pid > /tmp/timer_pid
}

status(){
    sed -n '1,2p' /tmp/timer_log
}

finish(){
    STATUS=$( cat /tmp/timer_log| awk 'NR==2' | awk '{print $2}' )
    sed -i "2s/$STATUS/finalizado/" /tmp/timer_log
    kill_process
    sed -n '1,2p' /tmp/timer_log
    exit 0
}

case $1 in
    start)
        start
        ;;
    stop)
        stop
        ;;
    status)
        status
        ;;
    continue)
        Continue
        ;;
    finish)
        finish
        ;;
esac

#!/bin/bash

echo "======= Temporarizado de Estudos ======="

DIR_PROGRESS="$HOME/Relatorio_Estudos"

history(){
    if [ -f "$DIR_PROGRESS/progresso_estudos.txt" ]; then
        cat "$DIR_PROGRESS/progresso_estudos.txt"
    else
        echo "Nenhum histórico encontrado!"
    fi
}

save_progress(){
    if [ ! -d "$DIR_PROGRESS" ]; then
        mkdir "$DIR_PROGRESS"
    fi

    echo "$(awk 'NR==1' /tmp/timer_log), Data: $(date +"%d/%m/%Y %H:%M")" >> "$DIR_PROGRESS/progresso_estudos.txt"
}

kill_process(){
    if [ "$(wc -c < /tmp/timer_pid)" -eq 0 ]; then
        echo "Sem processo para parar!"
        exit 0
    fi

    kill "$(cat /tmp/timer_pid)"
    > /tmp/timer_pid
}

loop_time() {
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
    if [ -s "/tmp/timer_pid" ]; then
        echo "Já possui processo em andamento"
        exit 1
    fi
    loop_time 0 &
    pid=$! 
    echo $pid > /tmp/timer_pid
}

stop(){
    sed -i '2s/Rodando/Parado/' /tmp/timer_log 
    kill_process
}

Continue(){
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
    save_progress

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
    history)
        history
        ;;
    *)
        echo "Comando Inválido! Use os comandos abaixo:"
        echo "start  -> Para inicializar o script"
        echo "stop   -> Para parar o script"
        echo "continue -> Para continuar o script"
        echo "status  -> Para mostrar o status do script"
        echo "finish -> Para finalizar o script"
esac

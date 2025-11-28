loop_time(){
    start="$1"

    while true; do 
        now=$(date +%s)
        diff=$((now - start))
        printf "Tempo: %02d:%02d:%02d\r" $((diff/3600)) $((diff%3600/60)) $((diff%60))
        sleep 1
        echo $start > /tmp/times ; echo $now >> /tmp/times ; echo $diff >> /tmp/times 
      
    done

}

start=$(date +%s)
loop_time "$start"
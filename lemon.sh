#!/bin/sh

clock() {
    date '+%Y-%m-%d %H:%M'
}

workspace() {
    current=`xprop -root _NET_CURRENT_DESKTOP|awk '{print $3}'`
    total=`xprop -root _NET_NUMBER_OF_DESKTOPS|awk '{print $3}'`

    if [ $current -ne 0 ]; then
        for w in `seq 0 $((current - 1))`; do
            printf "·";
        done
    fi

    printf "●";

    if [ $current -ne $(($total - 1)) ]; then
        for w in `seq $((current + 2)) $total`; do
            printf "·";
        done
    fi

}

while :; do
    content=""
    content="${content}%{c}$(workspace)"
    content="${content}%{r}$(clock)"
    echo -e $content
    sleep 0.1
done

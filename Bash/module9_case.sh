#!/bin/bash
case $1 in
    start) 
        echo Service is started
        sleep 9999;;
    stop)
        kill -9 $(pgrep -o module9_case.sh)
        echo Service $(pgrep -o module9_case.sh) is stopped
        pkill sleep
        ;;
    restart)
        kill -9 $(pgrep -o module9_case.sh)
        echo Service $(pgrep -o module9_case.sh) is stopped
        pkill sleep
        echo Service is restarted   
        sleep 9999 &;;
    help) echo "Use " $0 "with [start|stop|restart|help] arguments";;
    *) echo Wrong argument! Use \"help\" argument;;
esac
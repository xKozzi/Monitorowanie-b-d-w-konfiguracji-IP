#!/bin/sh

error_count=0
attempt_count=0

while true; do
    echo ">>> $(date) - Wysyłam komendę 1"
    output1=$(xxx 'xxxxxxx name eth0 address 10.60.175.13 netmask 255.255.0.0 label eth0' 2>&1)
    attempt_count=$((attempt_count + 1))

    echo "$output1"

    if echo "$output1" | grep -q "Error: Failed to apply Ip configuration"; then
        echo "❌ Wykryto błąd w komendzie 1"
        error_count=$((error_count + 1))
    fi

    echo "Statystyki: Próby = $attempt_count | Błędy = $error_count"
    sleep 10

    echo ">>> $(date) - Wysyłam komendę 2"
    output2=$(xxx 'xxxxxxx name eth0 address 10.60.175.13 netmask 255.255.0.0 label eth0' 2>&1)
    attempt_count=$((attempt_count + 1))

    echo "$output2"

    if echo "$output2" | grep -q "Error: Failed to apply Ip configuration"; then
        echo "❌ Wykryto błąd w komendzie 2"
        error_count=$((error_count + 1))
    fi

    echo "Statystyki: Próby = $attempt_count | Błędy = $error_count"
    sleep 10
done

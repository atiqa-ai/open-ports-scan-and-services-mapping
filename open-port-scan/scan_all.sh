#!/bin/bash

TARGET_FILE="targets.txt"
SCAN_DIR="scans"
MAX_PARALLEL=4

# Check target file
if [ ! -f "$TARGET_FILE" ]; then
    echo "Error: $TARGET_FILE not found."
    exit 1
fi

mkdir -p "$SCAN_DIR"

scan_target() {

    IP="$1"
    TARGET_DIR="$SCAN_DIR/$IP"

    echo "========================================"
    echo "Starting scan for: $IP"
    echo "========================================"

    mkdir -p "$TARGET_DIR"

    # Full TCP port scan
    nmap -Pn -p- "$IP" \
        -oA "$TARGET_DIR/full-tcp"

    if [ $? -ne 0 ]; then
        echo "Error: Nmap scan failed for $IP" \
            > "$TARGET_DIR/status.txt"
        return
    fi

    # Extract open TCP ports
    OPEN_PORTS=$(grep "^[0-9].*/tcp[[:space:]]*open" \
        "$TARGET_DIR/full-tcp.nmap" |
        awk '{print $1}' |
        cut -d/ -f1 |
        paste -sd, -)

    if [ -z "$OPEN_PORTS" ]; then

        echo "No open TCP ports detected." \
            > "$TARGET_DIR/service-detection.txt"

        echo "No open ports found for $IP"

    else

        echo "Open ports: $OPEN_PORTS"

        # Service and version detection
        nmap -Pn -sV -p "$OPEN_PORTS" "$IP" \
            -oA "$TARGET_DIR/service-detection"

    fi

    echo "Scan completed: $IP"
}


# Read targets
while IFS= read -r IP
do

    # Skip empty lines
    [ -z "$IP" ] && continue

    # Basic IPv4 validation
    if [[ ! "$IP" =~ ^([0-9]{1,3}\.){3}[0-9]{1,3}$ ]]; then
        echo "Skipping invalid target: $IP"
        continue
    fi

    # Start scan in background
    scan_target "$IP" &

    # Limit parallel scans
    while [ "$(jobs -rp | wc -l)" -ge "$MAX_PARALLEL" ]
    do
        wait -n
    done

done < "$TARGET_FILE"

wait

echo
echo "========================================"
echo "All scans completed."
echo "Results saved in: $SCAN_DIR/"
echo "========================================"

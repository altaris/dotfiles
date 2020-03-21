function arpscan -d 'Prints the ARP table' -a INTERFACE
    test -z "$INTERFACE"; and set INTERFACE wlp2s0
    sudo arp-scan --interface=$INTERFACE --localnet
end

function setmac -a INTERFACE NEW_MAC
    test -z "$INTERFACE"; and set INTERFACE wlp2s0
    if test -z "$NEW_MAC"
        echo "No MAC specified"
    else
        echo "Setting $INTERFACE MAC to $NEW_MAC"
        sudo ip link set dev $INTERFACE down
        sudo ip link set dev $INTERFACE address $NEW_MAC
        sudo ip link set dev $INTERFACE up
        echo "Done"
    end
end

#!/bin/bash
multipass stop control
multipass stop worker1
multipass stop worker2
multipass delete control
multipass delete worker1
multipass delete worker2
multipass purge
nmcli connection delete multipassbr

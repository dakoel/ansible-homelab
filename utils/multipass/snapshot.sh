#!/bin/bash
multipass stop control
multipass stop worker1
multipass stop worker2
multipass snapshot -n fresh control
multipass snapshot -n fresh worker1
multipass snapshot -n fresh worker2
multipass start control
multipass start worker1
multipass start worker2

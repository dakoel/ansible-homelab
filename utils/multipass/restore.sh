#!/bin/bash
multipass stop control
multipass stop worker1
multipass stop worker2
multipass restore -d control.fresh
multipass restore -d worker1.fresh
multipass restore -d worker2.fresh
multipass start control
multipass start worker1
multipass start worker2

#!/bin/bash
expect -c "
set timeout -1
spawn bbot -t $1 -f subdomain-enum
expect \"Scan ready. Press enter to execute\" {
    send \"\r\"
}
interact"

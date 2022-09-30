#!/usr/bin/env bash
# A simple script (template) to run a playbook and send the logs per e-mail using msmtp.
# 
# Usage:
# ./run_playbook_and_send_report.sh <PLAYBOOK_NAME>
# Example:
# ./run_playbook_and_send_report.sh update_servers
# 
# Note: In this condition the playbook name has to be given without the *.yml extension.
#       Also this script must be located in a directory higher than the playbook to be run.
#       Do not forget to change all <CHANGE_ME> to your e-mail configurations.

PLAYBOOK_NAME=$1
LOG_FILE=/tmp/$PLAYBOOK_NAME.log
MAIL_HEADER="From: <CHANGE_ME>\nTo: <CHANGE_ME>\nSubject: Report: $PLAYBOOK_NAME\n\n"

rm -f $LOG_FILE
export ANSIBLE_LOG_PATH=$LOG_FILE

ansible-playbook -i ansible/inventory ansible/$PLAYBOOK_NAME.yml
cat <(echo -e $MAIL_HEADER) $LOG_FILE | msmtp -a <CHANGE_ME> <CHANGE_ME>

unset ANSIBLE_LOG_PATH

#!/usr/bin/env bash
# Utility script to run a playbook and send its log via mail. Mail header is currently hard-coded and the template only allows to send mails to yourself (same e-mail address). msmtp has to be configured.
# Also the playbook to be executed is expected to have a .yml extension (.yaml is not supported)
#
# Usage ./run_playbook_and_send_report_mail.sh <INVENTORY> <PLAYBOOK> <MAIL_ADDRESS>
# Example: ./run_playbook_and_send_report_mail.sh ansible/inventory ansible/upgrade_all.yml test@mail.com

INVENTORY_PATH=$1
PLAYBOOK_PATH=$2
MAIL=$3

PLAYBOOK_NAME=$(basename $PLAYBOOK_PATH .yml)
LOG_FILE=/tmp/$PLAYBOOK_NAME.log
MAIL_HEADER="From: Ansible <$MAIL>\nTo: <$MAIL>\nSubject: Report: $PLAYBOOK_NAME\n\n"

rm -f $LOG_FILE
export ANSIBLE_LOG_PATH=$LOG_FILE

ansible-playbook -i $INVENTORY_PATH $PLAYBOOK_PATH
cat <(echo -e $MAIL_HEADER) $LOG_FILE | msmtp $MAIL

unset ANSIBLE_LOG_PATH

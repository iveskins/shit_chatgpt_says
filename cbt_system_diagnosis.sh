#!/bin/bash

echo "Diagnosing System Problems with Cognitive Behavioral Therapy"

echo "Identifying negative thought patterns in system configurations."

top_five_offenders=$(systemd-analyze blame | head -n 5)

negative_thought=""
evidence=""
positive_thought=""

for offender in $top_five_offenders; do
  offender_name=$(echo $offender | awk '{print $2}')
  if [ "$offender_name" == "networkd-wait-online.service" ]; then
    negative_thought="I am always disconnected from the world and unable to connect to others."
    echo "Negative thought pattern detected: $negative_thought"
    echo "Challenging the negative thought pattern."
    evidence="The cause of slow boot time is likely due to network connectivity issues. This issue can be fixed by modifying the network settings."
    echo "Evidence: $evidence"
    echo "Replacing the negative thought pattern with a positive one."
    positive_thought="I am connected to the world and able to connect with others."
    echo "Positive thought: $positive_thought"

    read -p "Do you want to write changes to system configurations to improve network connectivity? [y/n] " answer

    if [ "$answer" == "y" ]; then
      echo "Writing changes to system configuration files."
      sudo echo "network:
  version: 2
  renderer: networkd
  ethernets:
    ens33:
      dhcp4: yes" > /etc/netplan/50-cloud-init.yaml
      echo "Changes written successfully."
    else
      echo "No changes made to system configurations."
    fi
    break
  elif [ "$offender_name" == "systemd-tmpfiles" ]; then
    negative_thought="I am always slow and unresponsive."
    echo "Negative thought pattern detected: $negative_thought"
    echo "Challenging the negative thought pattern."
    evidence="The cause of slow boot time is likely due to tmpfiles not being cleaned up properly. This issue can be fixed by modifying the tmpfiles configuration."
    echo "Evidence: $evidence"
    echo "Replacing the negative thought pattern with a positive one."
    positive_thought="I am fast and responsive."
    echo "Positive thought: $positive_thought"

    read -p "Do you want to write changes to system configurations to improve boot time? [y/n] " answer

    if [ "$answer" == "y" ]; then
      echo "Writing changes to system configuration files."
      sudo echo "D /var/run/tmpfiles.d 0755 root root -" > /etc/tmpfiles.d/tmp.conf
      echo "Changes written successfully."
    else
      echo "No changes made to system configurations."
    fi
    break
  elif [ "$offender_name" == "systemd-journald.service" ]; then
    negative_thought="I am always forgetful and unable to remember important events."
    echo "Negative thought pattern detected: $negative_thought"
    echo "Challenging the negative thought pattern."
    evidence="

   #!/usr/bin/env bash
   # health_check.sh - quick system health report for a Fedora Linux machine.

   echo "=== System Health Report: $(date) ==="

   echo
   echo "--- Uptime and load ---"
   uptime

   echo
   echo "--- Disk usage ---"
   df -h /

   echo
   echo "--- Memory usage ---"
   free -h

   echo
   echo "--- Failed services ---"
   systemctl --failed --no-pager

   echo
   echo "--- Network addresses ---"
   ip -brief address

   echo
   echo "=== End of report ==="

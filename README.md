Linux System Health Check

Using BASH commands to create an executable file using BASH scripting and core command-line tools
within Fedora Linux. This script prints a quick health report for a Linux system.


When you run it, it shows:
- **Uptime and load:** how long the system has been running and how busy it is
- **Disk usage:** how much space is used on the main drive
- **Memory usage:** how much RAM is used and available
- **Failed services:** any system services that failed to start
- **Network addresses:** each network interface and its IP address

Linux OS with BASH terminal is required

**How to run it:**


1. Clone the repository and go into its folder:

```bash
   git clone https://github.com/smccaa-create/linux-health-check.git
   cd linux-health-check
```

2. Make the script executable (you only need to do this once):

```bash
   chmod +x health_check.sh
```

3. Run the script:

```bash
   ./health_check.sh
```

4. (Optional) Save the report to a file so you can compare it later:

```bash
   ./health_check.sh > report.txt
```


**Commands explained:**

**`date`**
Prints the current date and time. The script uses it in the report title so you know when each report was made.

**`uptime`**
Shows the current time, how long the system has been running, and the load averages for the last 1, 5, and 15 minutes. As a rough rule, a load average that stays above the number of CPU cores means the system is overloaded.

**`df -h /`**
`df` reports disk space. The `-h` flag means "human-readable," so sizes show up as GB and MB instead of raw blocks. The `/` limits the output to the main filesystem. If the "Use%" column is close to 100%, the system is running out of space.

**`free -h`**
Shows memory usage in human-readable units. The "available" column is the most useful number, because it estimates how much memory programs can still use without slowing the system down.

**`systemctl --failed --no-pager`**
`systemctl` manages services on systems that use systemd, including Fedora. `--failed` lists only the services that failed to start, and `--no-pager` prints everything at once instead of opening a scrolling viewer. A result of "0 loaded units listed" means nothing has failed.

**`ip -brief address`**
Lists each network interface with its state (UP or DOWN) and its IP address, one short line per interface. The `-brief` flag keeps the output compact compared to the full `ip address` output.


**Example Output:**
=== System Health Report: Sat Oct 17 08:41:22 PM EDT 2026 ===

--- Uptime and load ---
 20:41:22 up 34 min,  1 user,  load average: 0.13, 0.17, 0.34

--- Disk usage ---
Filesystem      Size  Used Avail Use% Mounted on
/dev/sda3        18G   11G  7.0G  61% /

--- Memory usage ---
               total        used        free      shared  buff/cache   available
Mem:           3.8Gi       2.0Gi       402Mi        35Mi       1.7Gi       1.8Gi
Swap:          3.8Gi       168Ki       3.8Gi

--- Failed services ---
  UNIT LOAD ACTIVE SUB DESCRIPTION

0 loaded units listed.

--- Network addresses ---
lo               UNKNOWN        127.0.0.1/8 ::1/128 
enp0s3           UP             10.0.2.15/24 fd17:625c:f037:2:d97e:2179:aad5:c2ba/64 fe80::2f4

**Author: Shanelle McCaa**

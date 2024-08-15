# Bash Activity - Analyzing Log Files

You are a Junior Security Analyst at Chase Bank, responsible for monitoring the bank's digital security infrastructure. Recently, you and your team has noticed an increase in suspicious login attempts on the main server. These incidents could indicate potential unauthorized access or brute-force attacks targeting customer accounts.

As part of the cybersecurity team, your task is to investigate these incidents by analyzing the authentication logs stored on the server. The log file (/var/log/auth_log.log) records all login attempts, and your job is to identify any entries that indicate suspicious login attempts.

## Files

> analyze.sh

performs the analysis on the given `/var/log/auth_log.log` file

> crontab_file

shows what the crontab looks like to run `analyze.sh` daily

> suspicious_activity.log

output of the analysis

> auth_log_creation.sh

script to create the arbitrary `/var/log/auth_log.log` file


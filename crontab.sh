#what is crontab in linux and give example of use 

#Crontab (Cron Table) is used to schedule commands or scripts to run automatically at a specific time or on a recurring schedule.

#Think of it as a task scheduler in Linux.

# | Command                  | Purpose                                   |
# | ------------------------ | ----------------------------------------- |
# | `crontab -e`             | Edit your cron jobs                       |
# | `crontab -l`             | List current cron jobs                    |
# | `crontab -r`             | Remove all cron jobs                      |
# | `crontab -u username -l` | View another user's cron jobs (root only) |

# * * * * * command_to_run
# │ │ │ │ │
# │ │ │ │ └── Day of Week (0-7) (0 or 7 = Sunday)
# │ │ │ └──── Month (1-12)
# │ │ └────── Day of Month (1-31)
# │ └──────── Hour (0-23)
# └────────── Minute (0-59)



# | Symbol | Meaning         |
# | ------ | --------------- |
# | `*`    | Every value     |
# | `,`    | Multiple values |
# | `-`    | Range           |
# | `/`    | Step value      |


# ==========================================
# My Cron Jobs
# ==========================================

# Run every minute
* * * * * /home/ec2-user/hello.sh

# Run every 5 minutes
*/5 * * * * /home/ec2-user/time.sh

# Run every day at 9:00 AM
0 9 * * * /home/ec2-user/message.sh

# Run every day at 2:00 AM
0 2 * * * /home/ec2-user/backup.sh

# Run every Sunday at 1:00 AM
0 1 * * 0 /home/ec2-user/restart.sh

# Run on the 1st day of every month at midnight
0 0 1 * * /home/ec2-user/monthly_report.sh
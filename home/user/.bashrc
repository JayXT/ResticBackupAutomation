#sudo compatibility
alias sudo='sudo '

# Manual System Backup (OS, apps, system-wide and user-wide app data/configs)
alias sysbackup="sudo -E restic -r <path to local restic repo> --verbose backup --tag OS --tag manual --exclude-file=/usr/local/bin/system-exclude.txt / && sudo -E restic -r b2:<your bucket>:<path to restic repo> --verbose backup --tag OS --tag manual --exclude-file=/usr/local/bin/system-exclude.txt /"

# Manual User Files Data Backup
alias databackup="sudo -E restic -r <path to local restic repo>--verbose backup --tag Data --tag manual --exclude-file=/usr/local/bin/data-exclude.txt /home && sudo -E restic -r b2:<your bucket>:<path to restic repo> --verbose backup --tag Data --tag manual --exclude-file=/usr/local/bin/data-exclude.txt /home"

# List Backup Snapshots
alias busnapshots="sudo -E restic -r <path to local restic repo> snapshots && sudo -E restic -r b2:<your bucket>:<path to restic repo> snapshots"

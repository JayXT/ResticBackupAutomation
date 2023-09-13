# ResticBackupAutomation
My simple GNU/Linux systemd-based solution for local and cloud backup using restic.

The goal of the project is to provide a simplistic and reliable automated backups as well as some bash aliases to make manual backups a breeze. In case of this project remote backups are aimed at B2 cloud storage. The main difference between manual and automated backups is that `manual` tag is added to manual backups, unlike automated ones only having `OS` or `Data` tag. Such approach allows for additional control when deciding which snapshots to keep and which to remove.

The key concept of the ResticBackupAutomation is segregation between system data and user data.
* System data (`OS` tag) includes data starting from system root (`/`), except for the specified user data directories (Pictures, Documents, Music, etc.).
* User data (`Data` tag)  is focused on most of data in /home, but doesn't include `/home/*/.*` (any files/directories in user folder that start from `.`).
The reason for such distinction is because application configuration should be considered a part of the OS and not the user files. Restoring the OS backup should restore, not only the system, but also apps to the state and configuration they've been at for each user at the specific moment of time.

The project follows a user-centric approach, which means it'll stay minimal, but each user is welcome to analyze and adapt everything to their needs.

In order to start using the solution it's necessary to:
* Copy all files except for .bashrc into the respective directories.
* Merge contents of .bashrc with the same file in your user directory, i.e. a couple of provided aliases could just be added to your file.
* Replace all placeholders (<>) with real names/paths.
* Ensure that the following environment variables are defined in your /etc/environment file:
    * RESTIC_PASSWORD_FILE or RESTIC_PASSWORD
    * RESTIC_CACHE_DIR (usually is set to "/var/cache/restic")
    * B2_ACCOUNT_ID (application key id that has read/write access to your cloud bucket)
    * B2_ACCOUNT_KEY (application key that has read/write access to your cloud bucket)
* In case of RESTIC_PASSWORD_FILE environment variable, the file that contains restic repository password has to be created first.
* Run sudo `systemctl daemon-reload`
* Run sudo `systemctl enable --now restic-local-backup.timer`
* Run sudo `systemctl enable --now restic-cloud-backup.timer`
* Reboot.

Manual backups could be done using `sysbackup` or `databackup` bash aliases. In addition recent snapshots could be accessed with `busnapshots` alias.

The [restic](https://restic.net/) itself is a minimal one-file command-line utility written in Go that is capable of encrypted, compressed, deduplicated and incremental file backups to various repositories, both local and remote.
For more details on how restic works as well as ideas for customization of the backup approach to suit your needs, please refer to the [restic official documentation](https://restic.readthedocs.io/en/stable/).

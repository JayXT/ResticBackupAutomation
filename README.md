# ResticBackupAutomation
My simple GNU/Linux systemd-based solution for local and cloud backup using restic. 

The goal of the project is to provide a simplistic and reliable automated backups as well as some bash aliases to make manual backups a breeze.

The [restic](https://restic.net/) itself is a minimal one-file command-line utility written in Go that is capable of encrypted, compressed, deduplicated and incremental file backups to various repositories, both local and remote.
In case of this project remote backups are aimed at B2 cloud storage.

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
* Reboot.


For more details on how restic works as well as ideas for customization to your needs, please refer to [restic official documentation](https://restic.readthedocs.io/en/stable/).

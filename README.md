### macos-restic-backup
Bash scripts to automatically run Restic backups when the repository is available. 

The script ensures that the specified Restic Repository is available and then initiates
a backup process which backs up each directory listed in the configuration file 
```.restic_backup.conf```. The script runs as a ```launchd``` job every 4 minutes. 

#### Set Up

To install, first create and initialize two restic repositories; one for local backups and
another for remote backups. Local backups will provide a higher resolution history of 
changes while the remote backups will act as a long-term backup. It is important that the 
password for both repositories is the same, as they will share the use of an environment 
variable.

```
Need to add the restic command for init here.
```

Note that this is not the most secure way to store a password, it does however help contain the
application and keep things simple. 

A modification should be made to ```com.cbergoon.restic_cleanup_remote.plist```, ```com.cbergoon.restic_cleanup_remote.plist```, ```com.cbergoon.restic_backup_local.plist``` and, ```com.cbergoon.restic_backup_remote.plist``` to point the scripts to proper Restic repository and
specify the password to use. 

```
// com.cbergoon.restic_backup_local.plist
...
<key>ProgramArguments</key>
    <array>
        <string>/usr/local/bin/restic_backup.sh</string>
        <string>"/path/to/localrepo"</string>
        <string>testpass</string>
    </array>
...
```
```
// com.cbergoon.restic_backup_remote.plist
...
<key>ProgramArguments</key>
    <array>
        <string>/usr/local/bin/restic_backup.sh</string>
        <string>"/path/to/remoterepo"</string>
        <string>testpass</string>
    </array>
...
```

Lastly, run the install.sh script which will create the LaunchDaemons. 

```
./install.sh
```
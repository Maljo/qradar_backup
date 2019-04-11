findLast() {
for file in /store/backup/*.tgz
    do
echo $file
    done  | sort -t'.' -k6  |tail -1
}

cp `findLast` /nfs_qradar ##directory the backups will be transferred to

if [ "$?" -eq 0 ]; then
  echo "$(date +"%x %r %Z")  Backup was copied succesfully" >> /store/backup/BackupTransfer.csv ##directory the CSV will be written to
else
  echo "$(date +"%x %r %Z")  Backup was not succesful, please check backup was run and try again." >> /store/backup/backupError.txt ##The directory the error file will be transferred to.
fi

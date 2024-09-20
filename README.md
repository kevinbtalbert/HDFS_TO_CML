# HDFS_TO_CML
Copy today's data or the total folder structure for an HDFS directory to CML workspace
### Usage

#### Make it executable:

`chmod +x hdfs-to-cml.sh`

#### Update Kerberos and Realm:
Update `KEYTAB_FILE` and `PRINCIPAL`

#### Run the script with either option 1 or 2:
To copy today's records:
`./hdfs-to-cml.sh 1`

To copy the entire folder directory:
`./hdfs-to-cml.sh 2`

Make sure to replace the HDFS_PATH and DEST_DIR with your actual HDFS and local destination paths.
# HDFS_TO_CML
Copy today's data or the total folder structure for an HDFS directory to CML workspace
### Usage

#### Git Clone into project root directory
`git clone https://github.com/kevinbtalbert/HDFS_TO_CML`

#### Make it executable:
`chmod +x /HDFS_TO_CML/hdfs-to-cml.sh`

#### Update Kerberos and Realm:
Update `KEYTAB_FILE` and `PRINCIPAL`

#### Run the script with either option 1 or 2:
To copy today's records:
`./HDFS_TO_CML/hdfs-to-cml.sh 1`

To copy the entire folder directory:
`./HDFS_TO_CML/hdfs-to-cml.sh 2`

Make sure to replace the HDFS_PATH and DEST_DIR with your actual HDFS and local destination paths.

#### Create CML Job on schedule
![](/assets/create-job.png)
# backup-elasticsearch-s3

Simple utility to backup an elasticsearch index to a S3 bucket.

## Environment 

`AWS_ACCESS_KEY` Your AWS access key 

`AWS_SECRET` Your AWS secret key

`INPUT` The source URL of the ES index to backup (eg. http://es:9200/index_name )

`OUTPUT` Base output file name (mapping and index will be stored in a single `tar.gz` archive containing a json file for the mapping of the index and another one for the datas), the current date and time will be automatically appended to the output filename.

`REMOTE` Remote S3 URL to store the resulting backup file (eg. s3://your.backup.bucket/backups/)
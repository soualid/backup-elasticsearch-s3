#!/bin/sh
echo Starting backup ...

mkdir -p /root/.aws/ && \
  echo -e "[default]\naws_access_key_id = $AWS_ACCESS_KEY\naws_secret_access_key = $AWS_SECRET" > /root/.aws/credentials 

elasticdump \
  --input=${INPUT} \
  --output=mapping.json \
  --type=mapping
elasticdump \
  --input=${INPUT} \
  --output=analyzer.json \
  --type=analyzer
elasticdump \
  --input=${INPUT} \
  --output=data.json \
  --type=data

OUTPUT_TAR=${OUTPUT}_`date +"%Y%m%d-%Hh%Mm"`.tar.gz
tar cvfz ${OUTPUT_TAR} mapping.json data.json analyzer.json
aws s3 cp ${OUTPUT_TAR} $REMOTE
rm ${OUTPUT_TAR} mapping.json data.json analyzer.json
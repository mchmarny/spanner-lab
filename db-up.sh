#!/bin/bash

. ./config.sh

# some gymnastics are required in order to parse a proper DDL in commandline
echo 'Loading DDL...'
echo 'NOTE: empty @type property warning on return protobuf message are OK'
DDL=`cat ${SPANNER_DB_DDL} | tr -d '\n' | tr -d '\r' | tr -d '\t'`
IFS=';' read -ra LINES <<< "$DDL"
for SQL in "${LINES[@]}"; do
    # echo $SQL
    if [ ${#SQL} -ge 5 ]; then
      gcloud spanner databases ddl update $SPANNER_DB --instance=$SPANNER_INSTANCE --ddl="$SQL"
    fi
done

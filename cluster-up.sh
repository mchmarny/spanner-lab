#!/bin/bash

. ./config.sh


gcloud spanner instances create $SPANNER_INSTANCE \
  --config=$SPANNER_DB_ZONE \
  --description="${SPANNER_INSTANCE}-custer" \
  --nodes=$SPANNER_INSTANCE_SIZE

gcloud spanner databases create $SPANNER_DB \
  --instance=$SPANNER_INSTANCE

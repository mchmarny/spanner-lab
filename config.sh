#!/bin/bash

# Google
export GCLOUD_PROJECT="mchmarny-dev"
export SPANNER_INSTANCE="spanner-lab"
export SPANNER_INSTANCE_SIZE=1
export SPANNER_DB="tpch"
export SPANNER_DB_ZONE="regional-us-central1"
export SPANNER_DB_DDL="ddl/tpch-v2-17-3.ddl"

# Default project
gcloud config set project $GCLOUD_PROJECT

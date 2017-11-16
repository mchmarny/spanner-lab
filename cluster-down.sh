#!/bin/bash

. ./config.sh

gcloud spanner instances delete $SPANNER_INSTANCE

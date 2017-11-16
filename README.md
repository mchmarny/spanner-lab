# spanner-lab


This project contains a collection scripts and demos for use with
[Google Spanner](https://cloud.google.com/spanner/).

## Disclaimer
This is not an official Google product (experimental or otherwise), it is just
my personal play grounds for all things [Spanner](https://cloud.google.com/spanner/).

## Content

This repo includes cluster and database management scripts as well few
Data Definition Language (DDL) files which I use to create schemas.

### Dependencies

The only dependency to use this lab is the [gcloud](https://cloud.google.com/sdk/gcloud/) utility. Is a command-line tool
for Google Cloud Platform. You can use this tool to perform many common platform tasks

### Configuration

All lab configuration files are in the `config.sh` file:

* `GCLOUD_PROJECT` = Google Cloud Project ID (Only required change)
* `SPANNER_INSTANCE` = Spanner instance ID ["spanner-lab"]
* `SPANNER_INSTANCE_SIZE` = Size of the Spanner cluster [1]
* `SPANNER_DB` = Name of the database in your Spanner cluster ["db"]
* `SPANNER_DB_ZONE` = Default region/zone where the cluster will be created ["regional-us-central1"]
* `SPANNER_DB_DDL` = Path to your schema DDL ["ddl/tpc-h-v2-17-3.ddl"]

### Setup

Assuming you already updated the configuration file and have defined

Use `./cluster-up.sh` to creates cluster. Once finished, execute `./db-up.sh`
to creates database in the previously created cluster

### Cleanup

Execute `./cluster-down` to delete the entire cluster (after prompt)

### DDLs

So far only one DDL, working on it


#### TPC H 2.17.3

Transaction Processing Performance Council (TPC) - [Benchmark H Standard Specification Revision 2.17.3](http://www.tpc.org/tpc_documents_current_versions/pdf/tpc-h_v2.17.3.pdf)

![TPC H Schema](/../master/img/tpc-h.png?raw=true "TPC H Schema")

To accommodate Spanner specific DDL requirements this schema modifies TPC H tables in following ways:

* Table/Column prefixes = removed (it's 2017)
* FKs were refactored as table interleaves
* Data types were remapped
  * int = INT64
  * varchar(n) = STRING(n)
  * decimal(n,2) = FLOAT64 (double precession)
  * date = DATE

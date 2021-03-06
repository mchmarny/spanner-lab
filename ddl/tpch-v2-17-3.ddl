CREATE TABLE CUSTOMER (
	CUSTKEY INT64 NOT NULL,
	NAME STRING(25) NOT NULL,
	ADDRESS STRING(40) NOT NULL,
	NATIONKEY INT64 NOT NULL,
	PHONE STRING(15) NOT NULL,
	ACCTBAL FLOAT64 NOT NULL,
	MKTSEGMENT STRING(10) NOT NULL,
	COMMENT STRING(117) NOT NULL
) PRIMARY KEY (CUSTKEY);

CREATE INDEX CUSTOMER_NATION_INDEX ON CUSTOMER (NATIONKEY);

CREATE TABLE ORDERS (
	CUSTKEY INT64 NOT NULL,
	ORDERKEY INT64 NOT NULL,
	ORDERSTATUS STRING(1) NOT NULL,
	TOTALPRICE FLOAT64 NOT NULL,
	ORDERDATE DATE NOT NULL,
	ORDERPRIORITY STRING(15) NOT NULL,
	CLERK STRING(15) NOT NULL,
	SHIPPRIORITY INT64 NOT NULL,
	COMMENT STRING(79) NOT NULL
) PRIMARY KEY (CUSTKEY, ORDERKEY),
  INTERLEAVE IN PARENT CUSTOMER ON DELETE CASCADE;

CREATE TABLE LINEITEM (
	CUSTKEY INT64 NOT NULL,
	ORDERKEY INT64 NOT NULL,
	LINENUMBER INT64 NOT NULL,
	PARTKEY INT64 NOT NULL,
	SUPPKEY INT64 NOT NULL,
	QUANTITY FLOAT64 NOT NULL,
	EXTENDEDPRICE FLOAT64 NOT NULL,
	DISCOUNT FLOAT64 NOT NULL,
	TAX FLOAT64 NOT NULL,
	RETURNFLAG STRING(1) NOT NULL,
	LINESTATUS STRING(1) NOT NULL,
	SHIPDATE DATE NOT NULL,
	COMMITDATE DATE NOT NULL,
	RECEIPTDATE DATE NOT NULL,
	SHIPINSTRUCT STRING(25) NOT NULL,
	SHIPMODE STRING(10) NOT NULL,
	COMMENT STRING(44) NOT NULL
) PRIMARY KEY (CUSTKEY, ORDERKEY, LINENUMBER),
  INTERLEAVE IN PARENT ORDERS ON DELETE CASCADE;

CREATE INDEX LINEITEM_PART_SUPPLIER_INDEX ON LINEITEM (PARTKEY, SUPPKEY);

CREATE TABLE REGION (
	REGIONKEY INT64 NOT NULL,
	NAME STRING(25) NOT NULL,
	COMMENT STRING(152)
) PRIMARY KEY (REGIONKEY);

CREATE TABLE NATION (
	REGIONKEY INT64 NOT NULL,
	NATIONKEY INT64 NOT NULL,
	NAME STRING(25) NOT NULL,
	COMMENT STRING(152)
) PRIMARY KEY (REGIONKEY, NATIONKEY),
  INTERLEAVE IN PARENT REGION ON DELETE CASCADE;

CREATE TABLE SUPPLIER (
	SUPPKEY INT64 NOT NULL,
	NAME STRING(25) NOT NULL,
	ADDRESS STRING(40) NOT NULL,
	NATIONKEY INT64 NOT NULL,
	PHONE STRING(15) NOT NULL,
	ACCTBAL FLOAT64 NOT NULL,
	COMMENT STRING(101) NOT NULL
) PRIMARY KEY (SUPPKEY);

CREATE INDEX SUPPLIER_NATION_INDEX ON SUPPLIER (NATIONKEY);

CREATE TABLE PARTSUPP (
	PARTKEY INT64 NOT NULL,
	SUPPKEY INT64 NOT NULL,
	AVAILQTY INT64 NOT NULL,
	SUPPLYCOST FLOAT64 NOT NULL,
	COMMENT STRING(199) NOT NULL
) PRIMARY KEY (PARTKEY, SUPPKEY);

CREATE TABLE PART (
	PARTKEY INT64 NOT NULL,
	NAME STRING(55) NOT NULL,
	MFGR STRING(25) NOT NULL,
	BRAND STRING(10) NOT NULL,
	TYPE STRING(25) NOT NULL,
	SIZE INT64 NOT NULL,
	CONTAINER STRING(10) NOT NULL,
	RETAILPRICE FLOAT64 NOT NULL,
	COMMENT STRING(23) NOT NULL
) PRIMARY KEY (PARTKEY);

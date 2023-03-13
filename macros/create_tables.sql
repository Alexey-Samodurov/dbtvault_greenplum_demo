{% macro create_tables() %}
  {% set sql %}
  -- DDL scripts to create table
    DROP EXTERNAL TABLE IF EXISTS customer CASCADE;
    CREATE EXTERNAL TABLE customer
    (C_CUSTKEY INT,
    C_NAME VARCHAR(25),
    C_ADDRESS VARCHAR(40),
    C_NATIONKEY INTEGER,
    C_PHONE CHAR(15),
    C_ACCTBAL DECIMAL(15,2),
    C_MKTSEGMENT CHAR(10),
    C_COMMENT VARCHAR(117)
    )
    LOCATION ('pxf://otus-homework-1/dbgen/customer.csv?PROFILE=s3:text&accesskey=YCAJEuIv0GesZG0i5E-8u4vru&secretkey=YCOBlsYQ6mGVrsflGJSZefW2A7ZcuEIUBzBryHuT&endpoint=storage.yandexcloud.net')
    FORMAT 'TEXT'
    (DELIMITER '|');

    DROP EXTERNAL TABLE IF EXISTS lineitem CASCADE;
    CREATE EXTERNAL TABLE lineitem
    (L_ORDERKEY BIGINT,
    L_PARTKEY INT,
    L_SUPPKEY INT,
    L_LINENUMBER INTEGER,
    L_QUANTITY DECIMAL(15,2),
    L_EXTENDEDPRICE DECIMAL(15,2),
    L_DISCOUNT DECIMAL(15,2),
    L_TAX DECIMAL(15,2),
    L_RETURNFLAG CHAR(1),
    L_LINESTATUS CHAR(1),
    L_SHIPDATE DATE,
    L_COMMITDATE DATE,
    L_RECEIPTDATE DATE,
    L_SHIPINSTRUCT CHAR(25),
    L_SHIPMODE CHAR(10),
    L_COMMENT VARCHAR(44)
    )
    LOCATION ('pxf://otus-homework-1/dbgen/lineitem.csv?PROFILE=s3:text&accesskey=YCAJEuIv0GesZG0i5E-8u4vru&secretkey=YCOBlsYQ6mGVrsflGJSZefW2A7ZcuEIUBzBryHuT&endpoint=storage.yandexcloud.net')
    FORMAT 'TEXT'
    (DELIMITER '|');

    DROP EXTERNAL TABLE IF EXISTS nation CASCADE;
    CREATE EXTERNAL TABLE nation
    (N_NATIONKEY INTEGER,
    N_NAME CHAR(25),
    N_REGIONKEY INTEGER,
    N_COMMENT VARCHAR(152)
    )
    LOCATION ('pxf://otus-homework-1/dbgen/nation.csv?PROFILE=s3:text&accesskey=YCAJEuIv0GesZG0i5E-8u4vru&secretkey=YCOBlsYQ6mGVrsflGJSZefW2A7ZcuEIUBzBryHuT&endpoint=storage.yandexcloud.net')
    FORMAT 'TEXT'
    (DELIMITER '|');

    DROP EXTERNAL TABLE IF EXISTS orders CASCADE;
    CREATE EXTERNAL TABLE orders
    (O_ORDERKEY BIGINT,
    O_CUSTKEY INT,
    O_ORDERSTATUS CHAR(1),
    O_TOTALPRICE DECIMAL(15,2),
    O_ORDERDATE DATE,
    O_ORDERPRIORITY CHAR(15),
    O_CLERK  CHAR(15),
    O_SHIPPRIORITY INTEGER,
    O_COMMENT VARCHAR(79)
    )
    LOCATION ('pxf://otus-homework-1/dbgen/orders.csv?PROFILE=s3:text&accesskey=YCAJEuIv0GesZG0i5E-8u4vru&secretkey=YCOBlsYQ6mGVrsflGJSZefW2A7ZcuEIUBzBryHuT&endpoint=storage.yandexcloud.net')
    FORMAT 'TEXT'
    (DELIMITER '|');

    DROP EXTERNAL TABLE IF EXISTS part CASCADE;
    CREATE EXTERNAL TABLE part
    (P_PARTKEY INT,
    P_NAME VARCHAR(55),
    P_MFGR CHAR(25),
    P_BRAND CHAR(10),
    P_TYPE VARCHAR(25),
    P_SIZE INTEGER,
    P_CONTAINER CHAR(10),
    P_RETAILPRICE DECIMAL(15,2),
    P_COMMENT VARCHAR(23)
    )
    LOCATION ('pxf://otus-homework-1/dbgen/part.csv?PROFILE=s3:text&accesskey=YCAJEuIv0GesZG0i5E-8u4vru&secretkey=YCOBlsYQ6mGVrsflGJSZefW2A7ZcuEIUBzBryHuT&endpoint=storage.yandexcloud.net')
    FORMAT 'TEXT'
    (DELIMITER '|');

    DROP EXTERNAL TABLE IF EXISTS partsupp CASCADE;
    CREATE EXTERNAL TABLE partsupp
    (PS_PARTKEY INT,
    PS_SUPPKEY INT,
    PS_AVAILQTY INTEGER,
    PS_SUPPLYCOST DECIMAL(15,2),
    PS_COMMENT VARCHAR(199)
    )
    LOCATION ('pxf://otus-homework-1/dbgen/partsupp.csv?PROFILE=s3:text&accesskey=YCAJEuIv0GesZG0i5E-8u4vru&secretkey=YCOBlsYQ6mGVrsflGJSZefW2A7ZcuEIUBzBryHuT&endpoint=storage.yandexcloud.net')
    FORMAT 'TEXT'
    (DELIMITER '|');

    DROP EXTERNAL TABLE IF EXISTS region CASCADE;
    CREATE EXTERNAL TABLE region
    (R_REGIONKEY INTEGER,
    R_NAME CHAR(25),
    R_COMMENT VARCHAR(152)
   )
    LOCATION ('pxf://otus-homework-1/dbgen/region.csv?PROFILE=s3:text&accesskey=YCAJEuIv0GesZG0i5E-8u4vru&secretkey=YCOBlsYQ6mGVrsflGJSZefW2A7ZcuEIUBzBryHuT&endpoint=storage.yandexcloud.net')
    FORMAT 'TEXT'
    (DELIMITER '|');

    DROP EXTERNAL TABLE IF EXISTS supplier CASCADE;
    CREATE EXTERNAL TABLE supplier
    (S_SUPPKEY INT,
    S_NAME CHAR(25),
    S_ADDRESS VARCHAR(40),
    S_NATIONKEY INTEGER,
    S_PHONE CHAR(15),
    S_ACCTBAL DECIMAL(15,2),
    S_COMMENT VARCHAR(101)
    )
    LOCATION ('pxf://otus-homework-1/dbgen/supplier.csv?PROFILE=s3:text&accesskey=YCAJEuIv0GesZG0i5E-8u4vru&secretkey=YCOBlsYQ6mGVrsflGJSZefW2A7ZcuEIUBzBryHuT&endpoint=storage.yandexcloud.net')
    FORMAT 'TEXT'
    (DELIMITER '|');
  {% endset %}

  {% set table = run_query(sql) %}

{% endmacro %}
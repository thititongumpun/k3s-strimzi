CREATE STREAM NOT_STOCK_BEGIN_DAY_ST (
    `available_stock` DOUBLE,
    `internalcode` VARCHAR,
    `MST_BAR` VARCHAR,
    `STORECODE` VARCHAR
  ) WITH (
    KAFKA_TOPIC = 'bigc_poc.public.stock_begin_day', 
    VALUE_FORMAT = 'JSON',
    PARTITIONS = 3
);

--TBL
CREATE TABLE NOT_STOCK_BEGIN_DAY_TB WITH (
    KAFKA_TOPIC = 'NOT_STOCK_BEGIN_DAY_TB', 
    KEY_FORMAT = 'JSON',
    PARTITIONS = 3
  ) AS 
  SELECT
    STRUCT(`storecode` := `STORECODE`,`internalcode` := `INTERNALCODE`, `mst_barcode`:= `MST_BARCODE`) AS `Key`,
    LATEST_BY_OFFSET(`internalcode`, false) AS `INTERNALCODE`,
    LATEST_BY_OFFSET(`available_stock`, false) AS `AVAILABLE_STOCK`,
    LATEST_BY_OFFSET(`storecode`, false) AS `STORECODE`,
    LATEST_BY_OFFSET(`mst_barcode`, FALSE) AS `mst_barcode`
  FROM STOCK_BEGIN_DAY_ST
  GROUP BY STRUCT(`storecode` := `STORECODE`,`internalcode` := `INTERNALCODE`, `mst_barcode`:= `MST_BARCODE`) 
  EMIT CHANGES;
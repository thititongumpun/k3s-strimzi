CREATE STREAM BGC_MASTER_ARTICLE_ST (
    `MST_CINR` BIGINT,
    `MST_CINV` BIGINT,
    `MST_BARCODE` VARCHAR,
    `MST_DIV` VARCHAR,
    `MST_BRAND_CODE` VARCHAR,
    `MST_DEPT` VARCHAR,
    `MST_SDEPT` VARCHAR,
    `MST_CLASS` VARCHAR,
    `MST_SCLASS` VARCHAR
  ) WITH (
    KAFKA_TOPIC = 'bigc_poc.public.BGC_MASTER_ARTICLE', 
    VALUE_FORMAT = 'JSON',
    PARTITIONS = 3
);


CREATE STREAM BGC_MST_ARTICLE_ST WITH (
  KAFKA_TOPIC = 'bigcsit.public.BGC_MASTER_ARTICLE',
  VALUE_FORMAT = 'JSON',
  PARTITIONS = 3
) AS 
  SELECT
    `MST_CINR` AS `INVOICE_NUMBER`,
    `MST_CINV` AS `INVOICE_LAST_UPDATE_DATE`,
    `MST_BARCODE` AS `PAYMENT_METHOD`,
    `MST_DIV` AS `PAYMENT_DATE`,
    `MST_BRAND_CODE` AS `PAYMENT_REQUEST_NUMBER`,
    `MST_DEPT` AS `RECEIVE_DOCUMENT_DATE`,
    `MST_SDEPT` AS `PAYMENT_NUMBER`,
    `MST_CLASS` AS `DISBURSEMENT_BANK`,
    `MST_SCLASS` AS `PAYEE_BANK_ACCOUNT`,
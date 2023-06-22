CREATE STREAM TEST_SQL (
    `totalsale` BIGINT
  ) WITH (
    KAFKA_TOPIC = 'bigc_poc.public.sale_transaction_summary', 
    VALUE_FORMAT = 'JSON',
    PARTITIONS = 3
);
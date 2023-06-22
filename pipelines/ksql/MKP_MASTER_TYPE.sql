CREATE STREAM MKP_MASTER_TYPE_ST (
    `NW_FOCUS` VARCHAR,
    `MKP_TYPE` VARCHAR
  ) WITH (
    KAFKA_TOPIC = 'bigc_poc.public.MKP_MASTER_TYPE', 
    VALUE_FORMAT = 'JSON',
    PARTITIONS = 3
);
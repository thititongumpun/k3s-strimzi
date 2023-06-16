kubectl run ksqldb-cli -ti \
    --image=confluentinc/ksqldb-cli:0.28.2 \
    --rm=true --restart=Never \
    -- /usr/bin/ksql http://ksqldb-server:8088
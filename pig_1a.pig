lines = LOAD '/user/hive/warehouse/nosql_three.db/yago_full_clean.tsv' USING PigStorage(' ')  AS (subject:chararray, predicate:chararray, object:chararray);
predicates = FOREACH lines GENERATE predicate; 
GroupedRecords = GROUP predicates BY predicate; 

count = FOREACH GroupedRecords GENERATE group AS predicate, COUNT(predicates) AS count;
order_by_data = ORDER count BY count DESC;
out = LIMIT order_by_data 10; 
DUMP out; 
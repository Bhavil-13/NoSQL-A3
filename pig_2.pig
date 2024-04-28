REGISTER '/home/hdoop/Desktop/NoSQL_Assignment_3/CountUniqueObjectsUDF.jar';

DEFINE CountUniqueObjects CountUniqueObjectsUDF();

yago_data = LOAD '/user/hive/warehouse/nosql_three.db/yago_full_clean.tsv' USING PigStorage(' ') AS (subject:chararray, predicate:chararray, object:chararray);

grouped_data = GROUP yago_data BY (subject, predicate);

unique_object_counts = FOREACH grouped_data {
    unique_objects = DISTINCT yago_data.object;
    unique_count = CountUniqueObjects(unique_objects);
    GENERATE group.subject AS subject, group.predicate AS predicate, unique_count AS unique_object_count;
}

DUMP unique_object_counts;
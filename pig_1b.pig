lines = LOAD '/user/hive/warehouse/nosql_three.db/yago_full_clean.tsv' USING PigStorage(' ')  AS (subject:chararray, predicate:chararray, object:chararray);
filter_data = FILTER lines BY predicate == '<hasGivenName>';

filter_data_livesIn = FILTER lines BY predicate == '<livesIn>'; 
GroupedRecords = GROUP filter_data_livesIn BY subject;
count_all = FOREACH GroupedRecords GENERATE group as name, COUNT(filter_data_livesIn) as count; 
more_than_one = FILTER count_all BY count >1;

result = JOIN filter_data BY subject, more_than_one BY name; 
final_ans = FOREACH result GENERATE filter_data::object;
DUMP final_ans;
CREATE EXTERNAL TABLE yagotable (
    subject STRING,
    predicate STRING,
    object STRING
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ' '
LOCATION '/user/hive/warehouse/nosql_three.db';

LOAD DATA LOCAL INPATH '/home/hdoop/Desktop/NoSQL_Assignment_3/yago_full_clean.tsv' INTO TABLE yagotable;

SELECT predicate from (SELECT predicate,COUNT(predicate) as freq FROM yagotable GROUP BY predicate ORDER BY freq desc LIMIT 3) subquery;

SELECT object from(
    SELECT table1.*
    FROM
    (SELECT * FROM yagotable WHERE predicate='<hasGivenName>') AS table1
    JOIN
    (SELECT * FROM yagotable WHERE subject IN
    (SELECT t1.subject FROM
        (SELECT subject, COUNT(predicate) AS freq FROM yagotable WHERE predicate='<livesIn>' GROUP BY subject) AS t1
    WHERE t1.freq>1)
    ) 
    AS table2
    ON table1.subject = table2.subject
) subquery;
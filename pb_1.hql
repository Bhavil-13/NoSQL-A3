set hive.auto.convert.sortmerge.join = true;
set hive.optimize.bucketmapjoin = true;
set hive.optimize.bucketmapjoin.sortedmerge = true;

CREATE EXTERNAL TABLE yago (
    subject STRING,
    predicate STRING,
    object STRING
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ' '
LOCATION '/user/hive/warehouse/nosql_three.db';

CREATE TABLE yago_buck_part(
    subject STRING,
    object STRING
)
PARTITIONED BY (predicate STRING)
CLUSTERED BY (object) INTO 5 buckets
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ' '
STORED AS TEXTFILE
LOCATION '/user/hive/warehouse/nosql_three.db';

INSERT INTO TABLE yago_buck_part PARTITION (predicate="<actedIn>")
SELECT subject, object 
FROM yago
WHERE predicate = "<actedIn>"
DISTRIBUTE BY object;

INSERT INTO TABLE yago_buck_part PARTITION (predicate="<hasAcademicAdvisor>")
SELECT subject, object
FROM yago
WHERE predicate = "<hasAcademicAdvisor>"
DISTRIBUTE BY object;

INSERT INTO TABLE yago_buck_part PARTITION (predicate="<hasChild>")
SELECT subject, object
FROM yago
WHERE predicate = "<hasChild>"
DISTRIBUTE BY object;

INSERT INTO TABLE yago_buck_part PARTITION (predicate="<hasFamilyName>")
SELECT subject,object
FROM yago
WHERE predicate = "<hasFamilyName>"
DISTRIBUTE BY object;

INSERT INTO TABLE yago_buck_part PARTITION (predicate="<hasWebsite>")
SELECT subject,object
FROM yago
WHERE predicate = "<hasWebsite>"
DISTRIBUTE BY object;

INSERT INTO TABLE yago_buck_part PARTITION (predicate="<hasWonPrize>")
SELECT subject,object
FROM yago
WHERE predicate = "<hasWonPrize>"
DISTRIBUTE BY object;

INSERT INTO TABLE yago_buck_part PARTITION (predicate="<isInterestedIn>")
SELECT subject, object
FROM yago
WHERE predicate = "<isInterestedIn>"
DISTRIBUTE BY object;

INSERT INTO TABLE yago_buck_part PARTITION (predicate="<isKnownFor>")
SELECT subject, object
FROM yago
WHERE predicate = "<isKnownFor>"
DISTRIBUTE BY object;

INSERT INTO TABLE yago_buck_part PARTITION (predicate="<directed>")
SELECT subject, object
FROM yago
WHERE predicate = "<directed>"
DISTRIBUTE BY object;

INSERT INTO TABLE yago_buck_part PARTITION (predicate="<edited>")
SELECT subject, object
FROM yago
WHERE predicate = "<edited>"
DISTRIBUTE BY object;


INSERT INTO TABLE yago_buck_part PARTITION (predicate="<graduatedFrom>")
SELECT subject, object
FROM yago
WHERE predicate = "<graduatedFrom>"
DISTRIBUTE BY object;

INSERT INTO TABLE yago_buck_part PARTITION (predicate="<hasGender>")
SELECT subject, object
FROM yago
WHERE predicate = "<hasGender>"
DISTRIBUTE BY object;

INSERT INTO TABLE yago_buck_part PARTITION (predicate="<hasMusicalRole>")
SELECT subject, object
FROM yago
WHERE predicate = "<hasMusicalRole>"
DISTRIBUTE BY object;

INSERT INTO TABLE yago_buck_part PARTITION (predicate="<isCitizenOf>")
SELECT subject, object
FROM yago
WHERE predicate = "<isCitizenOf>"
DISTRIBUTE BY object;

INSERT INTO TABLE yago_buck_part PARTITION (predicate="<isMarriedTo>")
SELECT subject, object
FROM yago
WHERE predicate = "<isMarriedTo>"
DISTRIBUTE BY object;

INSERT INTO TABLE yago_buck_part PARTITION (predicate="<isPoliticianOf>")
SELECT subject, object
FROM yago
WHERE predicate = "<isPoliticianOf>"
DISTRIBUTE BY object;

INSERT INTO TABLE yago_buck_part PARTITION (predicate="<playsFor>")
SELECT subject, object
FROM yago
WHERE predicate = "<playsFor>"
DISTRIBUTE BY object;

INSERT INTO TABLE yago_buck_part PARTITION (predicate="<worksAt>")
SELECT subject, object
FROM yago
WHERE predicate = "<worksAt>"
DISTRIBUTE BY object;

INSERT INTO TABLE yago_buck_part PARTITION (predicate="<wroteMusicFor>")
SELECT subject, object
FROM yago
WHERE predicate = "<wroteMusicFor>"
DISTRIBUTE BY object;

INSERT INTO TABLE yago_buck_part PARTITION (predicate="<created>")
SELECT subject, object
FROM yago
WHERE predicate = "<created>"
DISTRIBUTE BY object;

INSERT INTO TABLE yago_buck_part PARTITION (predicate="<diedIn>")
SELECT subject, object
FROM yago
WHERE predicate = "<diedIn>"
DISTRIBUTE BY object;

INSERT INTO TABLE yago_buck_part PARTITION (predicate="<hasGivenName>")
SELECT subject, object
FROM yago
WHERE predicate = "<hasGivenName>"
DISTRIBUTE BY object;

INSERT INTO TABLE yago_buck_part PARTITION (predicate="<influences>")
SELECT subject, object
FROM yago
WHERE predicate = "<influences>"
DISTRIBUTE BY object;

INSERT INTO TABLE yago_buck_part PARTITION (predicate="<isAffiliatedTo>")
SELECT subject, object
FROM yago
WHERE predicate = "<isAffiliatedTo>"
DISTRIBUTE BY object;

INSERT INTO TABLE yago_buck_part PARTITION (predicate="<isLeaderOf>")
SELECT subject, object
FROM yago
WHERE predicate = "<isLeaderOf>"
DISTRIBUTE BY object;

INSERT INTO TABLE yago_buck_part PARTITION (predicate="<livesIn>")
SELECT subject, object
FROM yago
WHERE predicate = "<livesIn>"
DISTRIBUTE BY object;

INSERT INTO TABLE yago_buck_part PARTITION (predicate="<owns>")
SELECT subject, object
FROM yago
WHERE predicate = "<owns>"
DISTRIBUTE BY object;

INSERT INTO TABLE yago_buck_part PARTITION (predicate="<participatedIn>")
SELECT subject, object
FROM yago
WHERE predicate = "<participatedIn>"
DISTRIBUTE BY object;

INSERT INTO TABLE yago_buck_part PARTITION (predicate="<wasBornIn>")
SELECT subject, object
FROM yago
WHERE predicate = "<wasBornIn>"
DISTRIBUTE BY object;


select name.subject, name.object, lives.object from (select subject, object from yago_buck_part where predicate ="<hasGivenName>") as name JOIN 
(select subject, object from yago_buck_part where predicate="<livesIn>") as lives ON(lives.subject = name.subject);
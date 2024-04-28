-- CREATE EXTERNAL TABLE yago (
--     subject STRING,
--     predicate STRING,
--     object STRING
-- )
-- ROW FORMAT DELIMITED
-- FIELDS TERMINATED BY ' '
-- LOCATION '/user/hive/warehouse/nosql_three.db';


CREATE TABLE yago_noBuck_part(
    subject STRING,
    object STRING
)
PARTITIONED BY (predicate STRING)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ' '
STORED AS TEXTFILE
LOCATION '/user/hive/warehouse/nosql_three.db';

INSERT INTO TABLE yago_noBuck_part PARTITION (predicate="<actedIn>")
SELECT subject, object 
FROM yago
WHERE predicate = "<actedIn>";

INSERT INTO TABLE yago_noBuck_part PARTITION (predicate="<hasAcademicAdvisor>")
SELECT subject, object
FROM yago
WHERE predicate = "<hasAcademicAdvisor>";

INSERT INTO TABLE yago_noBuck_part PARTITION (predicate="<hasChild>")
SELECT subject, object
FROM yago
WHERE predicate = "<hasChild>";

INSERT INTO TABLE yago_noBuck_part PARTITION (predicate="<hasFamilyName>")
SELECT subject,object
FROM yago
WHERE predicate = "<hasFamilyName>";

INSERT INTO TABLE yago_noBuck_part PARTITION (predicate="<hasWebsite>")
SELECT subject,object
FROM yago
WHERE predicate = "<hasWebsite>";

INSERT INTO TABLE yago_noBuck_part PARTITION (predicate="<hasWonPrize>")
SELECT subject,object
FROM yago
WHERE predicate = "<hasWonPrize>";

INSERT INTO TABLE yago_noBuck_part PARTITION (predicate="<isInterestedIn>")
SELECT subject, object
FROM yago
WHERE predicate = "<isInterestedIn>";

INSERT INTO TABLE yago_noBuck_part PARTITION (predicate="<isKnownFor>")
SELECT subject, object
FROM yago
WHERE predicate = "<isKnownFor>";

INSERT INTO TABLE yago_noBuck_part PARTITION (predicate="<directed>")
SELECT subject, object
FROM yago
WHERE predicate = "<directed>";

INSERT INTO TABLE yago_noBuck_part PARTITION (predicate="<edited>")
SELECT subject, object
FROM yago
WHERE predicate = "<edited>";


INSERT INTO TABLE yago_noBuck_part PARTITION (predicate="<graduatedFrom>")
SELECT subject, object
FROM yago
WHERE predicate = "<graduatedFrom>";

INSERT INTO TABLE yago_noBuck_part PARTITION (predicate="<hasGender>")
SELECT subject, object
FROM yago
WHERE predicate = "<hasGender>";

INSERT INTO TABLE yago_noBuck_part PARTITION (predicate="<hasMusicalRole>")
SELECT subject, object
FROM yago
WHERE predicate = "<hasMusicalRole>";

INSERT INTO TABLE yago_noBuck_part PARTITION (predicate="<isCitizenOf>")
SELECT subject, object
FROM yago
WHERE predicate = "<isCitizenOf>";

INSERT INTO TABLE yago_noBuck_part PARTITION (predicate="<isMarriedTo>")
SELECT subject, object
FROM yago
WHERE predicate = "<isMarriedTo>";

INSERT INTO TABLE yago_noBuck_part PARTITION (predicate="<isPoliticianOf>")
SELECT subject, object
FROM yago
WHERE predicate = "<isPoliticianOf>";

INSERT INTO TABLE yago_noBuck_part PARTITION (predicate="<playsFor>")
SELECT subject, object
FROM yago
WHERE predicate = "<playsFor>";

INSERT INTO TABLE yago_noBuck_part PARTITION (predicate="<worksAt>")
SELECT subject, object
FROM yago
WHERE predicate = "<worksAt>";

INSERT INTO TABLE yago_noBuck_part PARTITION (predicate="<wroteMusicFor>")
SELECT subject, object
FROM yago
WHERE predicate = "<wroteMusicFor>";

INSERT INTO TABLE yago_noBuck_part PARTITION (predicate="<created>")
SELECT subject, object
FROM yago
WHERE predicate = "<created>";

INSERT INTO TABLE yago_noBuck_part PARTITION (predicate="<diedIn>")
SELECT subject, object
FROM yago
WHERE predicate = "<diedIn>";

INSERT INTO TABLE yago_noBuck_part PARTITION (predicate="<hasGivenName>")
SELECT subject, object
FROM yago
WHERE predicate = "<hasGivenName>";

INSERT INTO TABLE yago_noBuck_part PARTITION (predicate="<influences>")
SELECT subject, object
FROM yago
WHERE predicate = "<influences>";

INSERT INTO TABLE yago_noBuck_part PARTITION (predicate="<isAffiliatedTo>")
SELECT subject, object
FROM yago
WHERE predicate = "<isAffiliatedTo>";

INSERT INTO TABLE yago_noBuck_part PARTITION (predicate="<isLeaderOf>")
SELECT subject, object
FROM yago
WHERE predicate = "<isLeaderOf>";

INSERT INTO TABLE yago_noBuck_part PARTITION (predicate="<livesIn>")
SELECT subject, object
FROM yago
WHERE predicate = "<livesIn>";

INSERT INTO TABLE yago_noBuck_part PARTITION (predicate="<owns>")
SELECT subject, object
FROM yago
WHERE predicate = "<owns>";

INSERT INTO TABLE yago_noBuck_part PARTITION (predicate="<participatedIn>")
SELECT subject, object
FROM yago
WHERE predicate = "<participatedIn>";

INSERT INTO TABLE yago_noBuck_part PARTITION (predicate="<wasBornIn>")
SELECT subject, object
FROM yago
WHERE predicate = "<wasBornIn>";

-- select name.subject, name.object, lives.object from (select subject, object from yago_noBuck_part where predicate ="<hasGivenName>") as name JOIN 
-- (select subject, object from yago_noBuck_part where predicate="<livesIn>") as lives ON(lives.subject = name.subject);
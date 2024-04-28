select name.subject, name.object, lives.object from (select subject, object from yago where predicate ="<hasGivenName>") as name JOIN 
(select subject, object from yago where predicate="<livesIn>") as lives ON(lives.subject = name.subject);
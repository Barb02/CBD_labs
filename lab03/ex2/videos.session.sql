CREATE KEYSPACE IF NOT EXISTS videoSharing WITH REPLICATION = { 'class' : 'SimpleStrategy', 'replication_factor' : '1' };

CREATE TABLE IF NOT EXISTS videoSharing.user (
userid text PRIMARY KEY,
nome text,
email int,
registeredAt timestamp
);
-- Mudar a Primary key para adicionar name como clustering key

CREATE TABLE IF NOT EXISTS videoSharing.video (
userid text,
nome text,
descr text,
tags set<text>,
sharedAt timestamp
);
CREATE KEYSPACE IF NOT EXISTS videoSharing WITH REPLICATION = { 'class' : 'SimpleStrategy', 'replication_factor' : '1' };
DROP TABLE IF EXISTS videoSharing.user;
DROP TABLE IF EXISTS videoSharing.videosPosted;
DROP TABLE IF EXISTS videoSharing.video;
DROP TABLE IF EXISTS videoSharing.rating;
DROP TABLE IF EXISTS videoSharing.commentByVideo;
DROP TABLE IF EXISTS videoSharing.commentByUser;
DROP TABLE IF EXISTS videoSharing.event;

CREATE TABLE IF NOT EXISTS videoSharing.user (
    userid uuid,
    username text,
    nome text,
    email text,
    registeredAt timestamp,
    PRIMARY KEY (userid)
);

CREATE TABLE IF NOT EXISTS videoSharing.videosPosted (
    username text,
    videoid uuid,
    postedAt timestamp,
    PRIMARY KEY (username, postedAt)
);

CREATE TABLE IF NOT EXISTS videoSharing.video (
    videoid uuid,
    title text,
    descr text,
    tags set<text>,
    sharedAt timestamp,
    followers list<uuid>,
    PRIMARY KEY (videoid, sharedAt)
) WITH CLUSTERING ORDER BY(sharedAt DESC);

CREATE INDEX ON videoSharing.video(tags);

CREATE TABLE IF NOT EXISTS videoSharing.rating (
    videoid        uuid,
    rating          int,
    ratedAt   timestamp,
    PRIMARY KEY(videoid, ratedAt)
);

CREATE TABLE IF NOT EXISTS videoSharing.commentByVideo (
    videoid uuid,
    commentText text,
    postedAt timestamp, 
    PRIMARY KEY (videoid, postedAt)
) WITH CLUSTERING ORDER BY (postedAt DESC);

CREATE TABLE IF NOT EXISTS videoSharing.commentByUser (
    userid uuid,
    commentText text,
    postedAt timestamp, 
    PRIMARY KEY (userid, postedAt)
) WITH CLUSTERING ORDER BY (postedAt DESC);

CREATE TABLE IF NOT EXISTS videoSharing.event (
    userid uuid,
    videoid uuid,
    videoTime time,
    trigger text,
    triggeredAt timestamp,
    PRIMARY KEY ((userid, videoid), triggeredAt)
) WITH CLUSTERING ORDER BY(triggeredAt DESC);

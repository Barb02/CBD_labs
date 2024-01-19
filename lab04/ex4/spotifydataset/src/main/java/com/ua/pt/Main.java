package com.ua.pt;

import org.neo4j.driver.Driver;
import org.neo4j.driver.Record;
import org.neo4j.driver.Session;
import org.neo4j.driver.Result;
import org.neo4j.driver.AuthTokens;
import org.neo4j.driver.GraphDatabase;

public class Main {

    private static void load(Session session){
        String loadQuery = "LOAD CSV WITH HEADERS FROM 'file:///youtube_music_dataset.csv' AS row " +
        "MERGE (t:Track {title: row.Track, duration: toFloat(row.Duration_min), likes: toInteger(row.Likes), views: toFloat(row.Views), official_video: toBoolean(row.official_video)}) " +
        "MERGE (a:Artist {name: row.Artist}) " +
        "MERGE (al: Album {title: row.Album, type: row.Album_type}) " +
        "MERGE (ch: Channel {name: row.Channel}) " +
        "MERGE (t)-[:CREATED_BY]->(a) " +
        "MERGE (t)-[:BELONGS_TO]->(al) " +
        "MERGE (t)-[:UPLOADED_AT]->(ch) ";
        session.run(loadQuery);
    }

    public static void main(String[] args) {
        String uri = "bolt://localhost:7687";
        String username = "neo4j"; 
        String password = "cbd2023!";

        Driver driver = GraphDatabase.driver(uri, AuthTokens.basic(username, password));

        try (Session session = driver.session()) {
            String count = "MATCH (n) RETURN count(n) AS nodeCount";
            Result result = session.run(count);
            long nodeCount = result.single().get("nodeCount").asLong();
            if(nodeCount == 0){
                load(session);
            }
            session.run("CREATE INDEX IF NOT EXISTS FOR (t:Track) ON (t.title)");

            String query;

            // 1
            System.out.println("\nList the top 10 most liked tracks:");
            query = "MATCH (t:Track) RETURN t.title AS title, t.likes AS likes ORDER BY t.likes DESC LIMIT 10";
            result = session.run(query);
            System.out.println("Title - Likes");
            while (result.hasNext()) {
                Record record = result.next();
                System.out.println(record.get("title").asString() + " - " + record.get("likes").asInt());
            }

            // 2
            System.out.println("\nList the channels that uploaded unofficial videos for tracks with more than 100k likes (along with the track):");
            query = "MATCH (t:Track)-[:UPLOADED_AT]-(ch:Channel) WHERE t.official_video=false AND t.likes > 100000 RETURN t.title AS title, ch.name AS channel";
            result = session.run(query);
            System.out.println("Title - Channel");
            while (result.hasNext()) {
                Record record = result.next();
                System.out.println(record.get("title").asString() + " - " + record.get("channel").asString());
            }

            // 3
            System.out.println("\nList the top 10 artists with more likes in their tracks:");
            query = "MATCH (t:Track)-[:CREATED_BY]-(a:Artist) RETURN a.name AS artist, sum(t.likes) AS likes ORDER BY likes DESC LIMIT 10";
            result = session.run(query);
            System.out.println("Artist - Total likes");
            while (result.hasNext()) {
                Record record = result.next();
                System.out.println(record.get("artist").asString() + " - " + record.get("likes").asInt());
            }

            // 4
            System.out.println("\nList the tracks (and their respective artist) with the number of likes being 5% of the number of views or higher:");
            query = "MATCH (t:Track)-[:CREATED_BY]-(a:Artist) WHERE t.views > 0 AND t.likes >= 0.05 * t.views RETURN a.name AS artist, t.likes AS likes, t.views AS views, t.title AS track";
            result = session.run(query);
            System.out.println("Artist - Track - Views - Likes");
            while (result.hasNext()) {
                Record record = result.next();
                System.out.println(record.get("artist").asString() + " - " + record.get("track").asString() + " - " + record.get("views").asDouble() + " - " + record.get("likes").asInt());
            }

            // 5
            System.out.println("\nList the total number of singles by artist ordered in descending order:");
            query = "MATCH (al:Album)<-[:BELONGS_TO]-(t:Track)-[:CREATED_BY]-(a:Artist) WHERE al.type = 'single' RETURN a.name AS artist, COUNT(al) AS numberOfSingles ORDER BY numberOfSingles DESC";
            result = session.run(query);
            System.out.println("Artist - Number of Singles");
            while (result.hasNext()) {
                Record record = result.next();
                System.out.println(record.get("artist").asString() + " - " +  record.get("numberOfSingles").asInt());
            }

            // 6
            System.out.println("\nList the top 5 singles with more views:");
            query = "MATCH (al:Album)<-[:BELONGS_TO]-(t:Track) WHERE al.type = 'single' RETURN al.title AS single, sum(t.views) AS views ORDER BY views DESC LIMIT 5";
            result = session.run(query);
            System.out.println("Single - Number of views");
            while (result.hasNext()) {
                Record record = result.next();
                System.out.println(record.get("single").asString() + " - " +  record.get("views").asDouble());
            }

            // 7
            System.out.println("\nList the top 5 albums with more views:");
            query = "MATCH (al:Album)<-[:BELONGS_TO]-(t:Track) WHERE al.type = 'album' RETURN al.title AS album, sum(t.views) AS views ORDER BY views DESC LIMIT 5";
            result = session.run(query);
            System.out.println("Album - Number of views");
            while (result.hasNext()) {
                Record record = result.next();
                System.out.println(record.get("album").asString() + " - " +  record.get("views").asDouble());
            }

            // 8
            System.out.println("\nCalculate the average number of likes for the artist 'Gorillaz':");
            query = "MATCH (t:Track)-[:CREATED_BY]-(a:Artist {name: 'Gorillaz'}) RETURN avg(t.likes) AS avgLikes";
            result = session.run(query);
            System.out.println("Avg likes");
            while (result.hasNext()) {
                Record record = result.next();
                System.out.println(record.get("avgLikes").asDouble());
            }

            // 9
            System.out.println("\nCalculate the percentage of tracks that have/are an official video:");
            query = "MATCH (t:Track) RETURN (count(CASE WHEN t.official_video = true THEN 1 ELSE null END) * 100.0 / count(t)) AS percentage";
            result = session.run(query);
            System.out.println("Percentage of tracks with official video");
            while (result.hasNext()) {
                Record record = result.next();
                System.out.println(record.get("percentage").asDouble() + "%");
            }

            // 10
            System.out.println("\nCalculate the number of tracks with duration greater or equal than 5 minutes with more than 1 million views:");
            query = "MATCH (t:Track) WHERE t.duration >= 5 AND t.views > 1000000 RETURN count(t) AS numberOfTracks";
            result = session.run(query);
            System.out.println("Number of tracks");
            while (result.hasNext()) {
                Record record = result.next();
                System.out.println(record.get("numberOfTracks").asInt());
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            driver.close();
        }
    }
}
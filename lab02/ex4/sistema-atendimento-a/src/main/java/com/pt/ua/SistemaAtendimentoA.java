package com.pt.ua;

import java.util.Scanner;
import java.util.concurrent.TimeUnit;
import java.util.Date;

import org.bson.Document;
import org.bson.types.ObjectId;

import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.model.Filters;
import com.mongodb.client.model.IndexOptions;
import com.mongodb.client.model.Indexes;


public class SistemaAtendimentoA 
{
    private final static long TIMESLOT = 60; // 1 minute
    private final static int REQUESTS_LIMIT = 5;

    public static void main( String[] args )
    {
        String uri = "mongodb://localhost:27017/";

        try (MongoClient mongoClient = MongoClients.create(uri)) {
            MongoDatabase database = mongoClient.getDatabase("sistema-atendimento");
            MongoCollection<Document> collection = database.getCollection("users");
            collection.createIndex(Indexes.ascending("timestamp"), new IndexOptions().expireAfter(TIMESLOT, TimeUnit.SECONDS));

            Scanner sc = new Scanner(System.in);            
            System.out.print("Type in your username: ");
            String user = sc.nextLine();
                
            System.out.print("\nType in your product request ('Enter' to quit): ");

            String product;

            while( ! (product = sc.nextLine()).isEmpty() ){
                long count = collection.countDocuments(Filters.eq("user", user));

                if(count < REQUESTS_LIMIT){
                    collection.insertOne(new Document()
                        .append("_id", new ObjectId())
                        .append("product", product)
                        .append("user", user)
                        .append("timestamp", new Date()));
                }
                else{
                    System.err.println("Maximum number of requests reached for this user! Closing session...");
                    break;
                }
    
                System.out.print("\nType in your product request ('Enter' to quit): ");
            }

            sc.close();
        }
    }
}

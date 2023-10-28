package com.pt.ua;

import java.util.Scanner;
import java.util.concurrent.TimeUnit;
import java.util.Date;
import java.util.Arrays;

import org.bson.Document;
import org.bson.types.ObjectId;

import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.model.Filters;
import com.mongodb.client.model.IndexOptions;
import com.mongodb.client.model.Indexes;
import com.mongodb.client.model.Aggregates;
import com.mongodb.client.model.Accumulators;

public class SistemaAtendimentoB 
{
    private final static long TIMESLOT = 60; // 1 minute
    private final static int QUANTITY_LIMIT = 10;

    public static void main( String[] args )
    {
        String uri = "mongodb://localhost:27017/";

        try (MongoClient mongoClient = MongoClients.create(uri)) {
            MongoDatabase database = mongoClient.getDatabase("sistema-atendimento");
            MongoCollection<Document> collection = database.getCollection("quantity");
            collection.createIndex(Indexes.ascending("timestamp"), new IndexOptions().expireAfter(TIMESLOT, TimeUnit.SECONDS));

            Scanner sc = new Scanner(System.in);            
            System.out.print("Type in your username: ");
            String user = sc.nextLine();
                
            System.out.print("\nType in your product request ('Enter' to quit): ");

            String product;

            while( ! (product = sc.nextLine()).isEmpty() ){
                
                System.out.print("\nType in the quantity ('Enter' to quit): ");
                int inputQt = Integer.parseInt(sc.nextLine());
                
                Document doc = collection.aggregate(
                Arrays.asList(
                    Aggregates.match(Filters.eq("user", user)),
                    Aggregates.group("$user", Accumulators.sum("totalQty", "$quantity"))
                )).first();

                int totalQty;
                if(doc != null){
                    totalQty = Integer.parseInt(doc.get("totalQty").toString());
                }
                else{
                    totalQty = 0;
                }

                if(totalQty + inputQt <= QUANTITY_LIMIT){
                    collection.insertOne(new Document()
                        .append("_id", new ObjectId())
                        .append("product", product)
                        .append("user", user)
                        .append("quantity", inputQt)
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

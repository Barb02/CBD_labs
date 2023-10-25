package com.pt.ua;

import java.util.Scanner;
import java.util.Date;
import java.util.Calendar;

import org.bson.Document;
import org.bson.conversions.Bson;
import org.bson.types.ObjectId;

import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.model.Filters;

public class SistemaAtendimento 
{
    private final static long TIMESLOT = 60000; // 1 minute
    private final static int REQUESTS_LIMIT = 5;

    public static void main( String[] args )
    {
        String uri = "mongodb://localhost:27017/";

        try (MongoClient mongoClient = MongoClients.create(uri)) {
            MongoDatabase database = mongoClient.getDatabase("sistema-atendimento");
            MongoCollection<Document> collection = database.getCollection("users");

            Scanner sc = new Scanner(System.in);
            Calendar cal;
            
            System.out.print("Type in your username: ");
            String user = sc.nextLine();
                
            System.out.print("\nType in your product request ('Enter' to quit): ");

            String product;
            Date currDate;
            long currTs;

            while( ! (product = sc.nextLine()).isEmpty() ){
                cal = Calendar.getInstance();
                currDate = cal.getTime();
                currTs = currDate.getTime();

                System.out.println(currTs);

                Bson query = Filters.and(Filters.eq("user", user), Filters.lte("timestamp", currTs - TIMESLOT));
                collection.deleteOne(query);

                long count = collection.countDocuments(Filters.eq("user", user));

                if(count < REQUESTS_LIMIT){
                    collection.insertOne(new Document()
                        .append("_id", new ObjectId())
                        .append("product", product)
                        .append("user", user)
                        .append("timestamp", currTs));
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

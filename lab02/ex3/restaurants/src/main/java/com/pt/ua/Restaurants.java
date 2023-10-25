package com.pt.ua;

import org.bson.Document;
import org.bson.conversions.Bson;
import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.model.Filters;
import com.mongodb.client.model.Projections;
import com.mongodb.client.model.UpdateOptions;
import com.mongodb.client.model.Updates;
import com.mongodb.client.result.InsertManyResult;
import com.mongodb.client.result.UpdateResult;

import java.util.List;
import java.util.Arrays;

public class Restaurants 
{

    private static InsertManyResult insertMany(MongoCollection<Document> collection, List<Document> doc){
        InsertManyResult result = collection.insertMany(doc);
        return result;
    }

    private static UpdateResult updateOne(MongoCollection<Document> collection, Bson filter, Bson updates, UpdateOptions options){
        UpdateResult result;
        
        if (options != null) result = collection.updateOne(filter, updates, options);
        else result = collection.updateOne(filter, updates);

        return result;
    }

    private static void findDocuments(MongoCollection<Document> collection, Bson filter, Bson projection, Bson sort){

            MongoCursor<Document> cursor = collection.find(filter)
                    .projection(projection)
                    .sort(sort).iterator();

            try {
                while(cursor.hasNext()) {
                    System.out.println(cursor.next().toJson());
                }
            } finally {
                cursor.close();
            }        
    }

    public static void main( String[] args )
    {
        String uri = "mongodb://localhost:27017/";

        try (MongoClient mongoClient = MongoClients.create(uri)) {
            MongoDatabase database = mongoClient.getDatabase("cbd");
            MongoCollection<Document> collection = database.getCollection("restaurants");
        
            // Insert test
            List<Document> newRestaurants = Arrays.asList(
                        new Document().append("nome", "DaniPizza"),
                        new Document().append("nome", "FroYoYo"),
                        new Document().append("nome", "Nova Casa"));

            InsertManyResult res = insertMany(collection, newRestaurants);
            System.out.println("Inserted document ids: " + res.getInsertedIds());

            // Update/Edit test
            Bson filter = Filters.eq("nome", "DaniPizza");
            Bson updates = Updates.combine(
                Updates.set("gastronomia", "Pizza/Italian"),
                Updates.set("localidade", "Bronx"));

            UpdateResult resUp = updateOne(collection, filter, updates, null);
            System.out.println("Modified document count: " + resUp.getModifiedCount());

            // Find/Search test
            Bson filterFind = Filters.eq("nome", "DaniPizza");
            Bson projectionFields = Projections.fields(
                    Projections.include("nome", "gastronomia", "localidade"),
                    Projections.excludeId());

            findDocuments(collection, filterFind, projectionFields, null);

            // Delete created documetns
            Bson query = Filters.eq("nome", "DaniPizza");
            collection.deleteOne(query);
            query = Filters.eq("nome", "FroYoYo");
            collection.deleteOne(query);
            query = Filters.eq("nome", "Nova Casa");
            collection.deleteOne(query);
        }
    }
}

package com.pt.ua;

import org.bson.Document;
import org.bson.conversions.Bson;
import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.model.Filters;
import com.mongodb.client.model.Indexes;
import com.mongodb.client.model.Projections;

import java.sql.Timestamp;

public class RestaurantsB 
{
    private static void findDocuments(MongoCollection<Document> collection, Bson filter, Bson projection, Bson sort){

        collection.find(filter)
                  .projection(projection)
                  .sort(sort).iterator();
    }
    
    public static void main( String[] args )
    {
        String uri = "mongodb://localhost:27017/";

        try (MongoClient mongoClient = MongoClients.create(uri)) {
            MongoDatabase database = mongoClient.getDatabase("cbd");
            MongoCollection<Document> collection = database.getCollection("restaurants");

            Bson projectionFields = Projections.fields(
                    Projections.include("nome", "gastronomia", "localidade"),
                    Projections.excludeId());

            Timestamp ts1, ts2;
            Bson filterFind;

            // Teste localidade
            filterFind = Filters.eq("localidade", "Bronx");

            // Com índice      
            collection.createIndex(Indexes.ascending("localidade"));
            System.out.println("\nWith index: (localidade)\n");

            ts1 = new Timestamp(System.currentTimeMillis());
            System.out.println("Begin: " + ts1);
            
            findDocuments(collection, filterFind, projectionFields, null);

            ts2 = new Timestamp(System.currentTimeMillis());
            System.out.println("End: " + ts2);

            // Sem índice
            collection.dropIndex(Indexes.ascending("localidade"));
            System.out.println("\nWithout index:\n");

            ts1 = new Timestamp(System.currentTimeMillis());
            System.out.println("Begin: " + ts1);
            
            findDocuments(collection, filterFind, projectionFields, null);

            ts2 = new Timestamp(System.currentTimeMillis());
            System.out.println("End: " + ts2);

            // Teste gastronomia
            filterFind = Filters.eq("gastronomia", "Pizza/Italian");

            // Com índice
            collection.createIndex(Indexes.ascending("gastronomia"));
            System.out.println("\nWith index (gastronomia):\n");

            ts1 = new Timestamp(System.currentTimeMillis());
            System.out.println("Begin: " + ts1);
            
            findDocuments(collection, filterFind, projectionFields, null);

            ts2 = new Timestamp(System.currentTimeMillis());
            System.out.println("End: " + ts2);

            // Sem índice
            collection.dropIndex(Indexes.ascending("gastronomia"));
            System.out.println("\nWithout index:\n");

            ts1 = new Timestamp(System.currentTimeMillis());
            System.out.println("Begin: " + ts1);
            
            findDocuments(collection, filterFind, projectionFields, null);

            ts2 = new Timestamp(System.currentTimeMillis());
            System.out.println("End: " + ts2);

            // Teste nome
            filterFind = Filters.eq("gastronomia", "Pizza/Italian");

            // Com índice
            collection.createIndex(Indexes.text("nome"));
            System.out.println("\nWith index (nome):\n");

            ts1 = new Timestamp(System.currentTimeMillis());
            System.out.println("Begin: " + ts1);
            
            findDocuments(collection, filterFind, projectionFields, null);

            ts2 = new Timestamp(System.currentTimeMillis());
            System.out.println("End: " + ts2);

            // Sem índice
            collection.dropIndex("nome_text");
            System.out.println("\nWithout index:\n");

            ts1 = new Timestamp(System.currentTimeMillis());
            System.out.println("Begin: " + ts1);
            
            findDocuments(collection, filterFind, projectionFields, null);

            ts2 = new Timestamp(System.currentTimeMillis());
            System.out.println("End: " + ts2);

        }
    }
}

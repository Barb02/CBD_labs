package com.pt.ua;

import java.util.Arrays;

import org.bson.Document;
import org.bson.conversions.Bson;

import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.model.Filters;
import com.mongodb.client.model.Indexes;
import com.mongodb.client.model.Projections;
import com.mongodb.client.model.Sorts;
import com.mongodb.client.model.Aggregates;
import com.mongodb.client.model.Accumulators;
import com.mongodb.client.model.UpdateOptions;
import com.mongodb.client.model.Updates;
import com.mongodb.client.result.InsertManyResult;
import com.mongodb.client.result.UpdateResult;

public class RestaurantsC 
{
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
        // 4 , 8, 11, 13, 17

        String uri = "mongodb://localhost:27017/";
        
        try (MongoClient mongoClient = MongoClients.create(uri)) {
            MongoDatabase database = mongoClient.getDatabase("cbd");
            MongoCollection<Document> collection = database.getCollection("restaurants");

            Bson filter;
            // 4)
            filter = Filters.eq("localidade", "Bronx");
            System.out.println("4) " + collection.countDocuments(filter));
            
            // 8)
            filter = Filters.lt("address.coord.0", -95.7);
            System.out.println("8)");
            findDocuments(collection, filter, null, null);
            System.out.println();

            // 11)
            filter = Filters.and(
                Filters.eq("localidade", "Bronx"), 
                Filters.or(Filters.eq("gastronomia","American"),
                           Filters.eq("gastronomia","Chinese")));

            Bson projectionFields = Projections.fields(
                Projections.include("nome", "gastronomia", "localidade"),
                Projections.excludeId());

            System.out.println("11)");
            findDocuments(collection, filter, projectionFields, null);
            System.out.println();

            // 13)
            filter = Filters.not(Filters.elemMatch("grades", Filters.gt("score", 3)));
            
            System.out.println("13)");
            findDocuments(collection, filter, projectionFields, null);
            System.out.println();

            // 17)
            filter = Filters.empty();
            Bson sort = Sorts.orderBy(Sorts.ascending("gastronomia"), Sorts.descending("localidade"));

            System.out.println("17)");
            findDocuments(collection, filter, projectionFields, sort);
            System.out.println();
        }
    }
}

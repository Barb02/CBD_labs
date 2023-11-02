package com.pt.ua;

import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.bson.Document;
import org.bson.conversions.Bson;

import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.model.Filters;
import com.mongodb.client.model.Projections;
import com.mongodb.client.model.Aggregates;
import com.mongodb.client.model.Accumulators;
import com.mongodb.client.AggregateIterable;
import com.mongodb.client.DistinctIterable;

public class RestaurantsD 
{
    static String uri = "mongodb://localhost:27017/";

    public static int countLocalidades(){

        try (MongoClient mongoClient = MongoClients.create(uri)) {

            MongoDatabase database = mongoClient.getDatabase("cbd");
            MongoCollection<Document> collection = database.getCollection("restaurants");

            DistinctIterable<String> localidades = collection.distinct("localidade", String.class);

            int count = 0;

            for(String loc: localidades){
                count++;
            }

            return count;
        } 
    }

    public static Map<String, Integer> countRestByLocalidade(){
        Map<String, Integer> restByLocalidade = new HashMap<String, Integer>();

        try (MongoClient mongoClient = MongoClients.create(uri)) {

            MongoDatabase database = mongoClient.getDatabase("cbd");
            MongoCollection<Document> collection = database.getCollection("restaurants");
            
            AggregateIterable<Document> documents = collection.aggregate(
                Arrays.asList(
                    Aggregates.group("$localidade", Accumulators.sum("numRestaurantes", 1))
                )
            );
            
            for(Document doc : documents) {
                restByLocalidade.put(doc.get("_id").toString(), Integer.parseInt(doc.get("numRestaurantes").toString()));
            }
        }
        return restByLocalidade;
    }

    public static List<String> getRestWithNameCloserTo(String name){
         try (MongoClient mongoClient = MongoClients.create(uri)) {
            
            MongoDatabase database = mongoClient.getDatabase("cbd");
            MongoCollection<Document> collection = database.getCollection("restaurants");

            Bson filter = Filters.regex("nome", name);
            Bson projection = Projections.fields(
                Projections.include("nome"),
                Projections.excludeId());

            MongoCursor<Document> cursor = collection.find(filter)
                  .projection(projection).iterator();

            List<String> rests = new ArrayList<>();

            try {
                while(cursor.hasNext()) {
                    rests.add(cursor.next().get("nome").toString());
                }
            } finally {
                cursor.close();
            }
            
            return rests;
        }
    }

    public static void main( String[] args )
    {
        try{
            FileWriter fileWriter = new FileWriter("CBD_L203_105937.txt");
            PrintWriter printWriter = new PrintWriter(fileWriter);

            printWriter.print("Número de localidades distintas: " + countLocalidades());

            Map<String, Integer> restByLocalidade = countRestByLocalidade();
            printWriter.print("\n\nNúmero de restaurantes por localidade: ");
            for(Map.Entry<String,Integer> entry : restByLocalidade.entrySet()){
                printWriter.print("\n-> " + entry.getKey() + " - " + entry.getValue());
            }
            
            String name = "Park";
            List<String> rests = getRestWithNameCloserTo(name);
            printWriter.print("\n\nNúmero de restaurantes contendo '" + name + "' no nome: ");
            for(String rest: rests){
                printWriter.print("\n-> " + rest);
            }

            printWriter.close();
        }
        catch(IOException e){
            System.err.println("Unable to create/write to file!");
        }
    }
}

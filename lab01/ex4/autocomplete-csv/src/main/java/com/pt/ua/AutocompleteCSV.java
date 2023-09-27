package com.pt.ua;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.Protocol.Keyword;
import redis.clients.jedis.params.ZRangeParams;

import java.io.BufferedReader;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Scanner;

public class AutocompleteCSV
{
    public static String NAMES_SCORES = "nomesscore";
    public static String NAMES_LEX = "nomeslex";
    public static String RESULT = "result";

    public static void main( String[] args )
    {
        Jedis jedis = new Jedis();

        if( ! jedis.exists(NAMES_SCORES)){
            try{
                Path path = Paths.get("nomes-pt-2021.csv");
    
                BufferedReader reader = Files.newBufferedReader(path, StandardCharsets.UTF_8);
    
                String line, name;
                String[] splitted;
                int score;
        
                while ((line = reader.readLine()) != null) {
                    splitted = line.split(";");
                    name = splitted[0];
                    score = Integer.parseInt(splitted[1]);
                    jedis.zadd(NAMES_SCORES, score, name);
                    jedis.zadd(NAMES_LEX, 0, name);
                }
            }
            catch(IOException e){
                System.err.println("Unable to read file!");
                System.exit(0);
            }
        }

        Scanner sc = new Scanner(System.in);
        String input;
        

        System.out.print("Search for ('Enter' to quit): ");

        while( ! (input = sc.nextLine()).isEmpty()){ 
            String endInterval = input + "¥";  // ASCII bigger than every letter
            ZRangeParams paramsLex = new ZRangeParams(Keyword.BYLEX, "[" + input, "(" + endInterval);
            jedis.zrangestore("tempset", NAMES_LEX, paramsLex);
            
            jedis.zinterstore(RESULT, "tempset", NAMES_SCORES);

            // falta inverter a ordem dos scores

            System.out.println(jedis.zrevrange(RESULT, 0, -1));

            System.out.print("Search for ('Enter' to quit): ");
        }

        jedis.del("tempset", RESULT);
        sc.close();
        jedis.close();
    }
}

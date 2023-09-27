package com.pt.ua;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.Protocol.Keyword;
import redis.clients.jedis.params.ZRangeParams;

import java.io.BufferedReader;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Scanner;


public class Autocomplete
{
    public static String NAMES_KEY = "names";
    public static void main( String[] args )
    {
        Jedis jedis = new Jedis();

        if( ! jedis.exists(NAMES_KEY)){
            try{
                Path path = Paths.get("names.txt");
    
                BufferedReader reader = Files.newBufferedReader(path);
    
                String line;
                
                while ((line = reader.readLine()) != null) {
                    jedis.zadd(NAMES_KEY, 0, line);
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
            ZRangeParams params = new ZRangeParams(Keyword.BYLEX, "[" + input, "(" + endInterval);
            System.out.println(jedis.zrange(NAMES_KEY, params));

            System.out.print("Search for ('Enter' to quit): ");
        }

        sc.close();
        jedis.close();
    }
}

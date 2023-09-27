package com.pt.ua;

import redis.clients.jedis.Jedis;
import java.util.Scanner;
import java.util.Date;
import java.util.Calendar;

public class SistemaAtendimentoB 
{
    private final static long TIMESLOT = 60000; // 1 minute
    private final static int QUANTITY_LIMIT = 10;

    public static void main( String[] args )
    {
        Jedis jedis = new Jedis();
        Scanner sc = new Scanner(System.in);
        Calendar cal = Calendar.getInstance();
        
        System.out.print("Type in your username: ");
        String USER_KEY_REQUESTS = sc.nextLine();
        String USER_KEY_PRODUCTS = USER_KEY_REQUESTS + "-products";
        
        System.out.print("\nType in your product request ('Enter' to quit): ");
        String product;

        while( ! (product = sc.nextLine()).isEmpty() ){

            System.out.print("\nType in the quantity ('Enter' to quit): ");
            int inputQt = Integer.parseInt(sc.nextLine());

            Date currDate = cal.getTime();
            long timestamp = currDate.getTime();
            jedis.zremrangeByScore(USER_KEY_REQUESTS, 0, timestamp - TIMESLOT);
            
            if(jedis.hexists(USER_KEY_PRODUCTS, product)){
                // Caso produto tenha sido removido do set (tempo limite passou), por quantidade de produto a 0
                if(jedis.zscore(USER_KEY_REQUESTS, product) == null){
                    jedis.hset(USER_KEY_PRODUCTS, product, "0");
                }

                int quantity = Integer.parseInt(jedis.hget(USER_KEY_PRODUCTS, product));
                
                if (quantity + inputQt <= QUANTITY_LIMIT){
                    jedis.zadd(USER_KEY_REQUESTS, timestamp, product);
                    quantity += inputQt;
                    jedis.hset(USER_KEY_PRODUCTS, product, String.valueOf(quantity));
                }
                else{
                    System.err.println("Maximum number of requests reached for this user! Closing session...");
                    break;
                }
            }
            else{
                jedis.zadd(USER_KEY_REQUESTS, timestamp, product);
                jedis.hset(USER_KEY_PRODUCTS, product, String.valueOf(inputQt));
            }

            System.out.print("\nType in your product request ('Enter' to quit): ");
        }

        jedis.close();
        sc.close();
    }
}

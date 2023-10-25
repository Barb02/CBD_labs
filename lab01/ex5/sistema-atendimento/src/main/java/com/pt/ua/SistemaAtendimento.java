package com.pt.ua;

import redis.clients.jedis.Jedis;
import java.util.Scanner;
import java.util.Date;
import java.util.Calendar;


public class SistemaAtendimento 
{

    private final static long TIMESLOT = 60000; // 1 minute
    private final static int REQUESTS_LIMIT = 5;

    public static void main( String[] args )
    {
        Jedis jedis = new Jedis();
        Scanner sc = new Scanner(System.in);
        Calendar cal;
        
        System.out.print("Type in your username: ");
        String USER_KEY = sc.nextLine();
        
        System.out.print("\nType in your product request ('Enter' to quit): ");
        String product;
        Date currDate;
        long timestamp;

        while( ! (product = sc.nextLine()).isEmpty() ){

            cal = Calendar.getInstance(); 
            currDate = cal.getTime();
            timestamp = currDate.getTime();
            jedis.zremrangeByScore(USER_KEY, 0, timestamp - TIMESLOT);
            
            if(jedis.zcard(USER_KEY) < REQUESTS_LIMIT){
                jedis.zadd(USER_KEY, timestamp, product);
            }
            else{
                System.err.println("Maximum number of requests reached for this user! Closing session...");
                break;
            }

            System.out.print("\nType in your product request ('Enter' to quit): ");
        }

        jedis.close();
        sc.close();
    }
}

package com.pt.ua;

import redis.clients.jedis.Jedis;
import java.util.Map;
import java.util.HashMap;

public class SimplePost {
    public static String LIST_KEY = "usersList"; 
    public static String HASHMAP_KEY = "usersHashmap";

    public static void main(String[] args) {
        Jedis jedis = new Jedis();
        
        //Hash
        Map<String,String> capitalMap = new HashMap<String,String>();

        capitalMap.put("England", "London");
        capitalMap.put("Germany", "Berlin");
        capitalMap.put("Norway", "Oslo");
        capitalMap.put("USA", "Washington DC");
        
        jedis.hmset(HASHMAP_KEY, capitalMap);

        System.out.println(jedis.hgetAll(HASHMAP_KEY));

        // List
        String[] users = { "Ana", "Pedro", "Maria", "Luis" };

        for (String user : users){
            jedis.lpush(LIST_KEY, user);
        }
        
        for (String user : jedis.lrange(LIST_KEY,0,-1))
            System.out.println(user);        

        jedis.close();
    }
}

package com.pt.ua;

/**
 * Hello world!
 *
 */
import redis.clients.jedis.Jedis;
public class App {
    public static void main(String[] args) {
        // Ensure you have redis-server running
        Jedis jedis = new Jedis();
        System.out.println(jedis.ping());
        System.out.println(jedis.info());
        jedis.close();
    }
}

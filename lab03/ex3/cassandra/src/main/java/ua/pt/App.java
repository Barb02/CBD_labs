package ua.pt;

import com.datastax.driver.core.Cluster;
import com.datastax.driver.core.ResultSet;
import com.datastax.driver.core.Row;
import com.datastax.driver.core.Session;

public class App 
{
    public static void main( String[] args )
    {
        Cluster cluster = Cluster.builder().addContactPoint("localhost").withPort(9042).withCredentials("cassandra","cassandra").build();
        Session session = cluster.connect("videoSharing");

        // Inserção
        session.execute("INSERT INTO user (id, username, name, email, registeredAt) VALUES (650b4b90-9abc-4ae4-909d-33cc095bfb32, 'Marcos', 'Marcos', 'marcos@ua.pt', toTimestamp(now()));");
        
        // Pesquisa
        ResultSet query_res = session.execute("SELECT * FROM user WHERE id=650b4b90-9abc-4ae4-909d-33cc095bfb32;");
        Row query_row = query_res.one();

        System.out.println(query_row);

        // Edição
        session.execute("UPDATE user SET username='Marcos1'  WHERE id=650b4b90-9abc-4ae4-909d-33cc095bfb32");

        query_res = session.execute("SELECT * FROM user WHERE id=650b4b90-9abc-4ae4-909d-33cc095bfb32;");
        query_row = query_res.one();

        System.out.println(query_row);


        // Queries do exercício 3.2
        // 1. Os últimos 3 comentários introduzidos para um vídeo;
        
        query_res = session.execute("SELECT * FROM videosharing.commentByVideo WHERE videoid = ef50064e-1cfb-45fa-96eb-c95cb562c7c6 LIMIT 3;");
        System.out.println("========================");
        System.out.println("1. Os últimos 3 comentários introduzidos para um vídeo;");
        for (Row row : query_res) {
            System.out.println(row);
        }


        // 2. Lista das tags de determinado vídeo;
        query_res = session.execute("SELECT tags FROM videosharing.video WHERE videoid = ef50064e-1cfb-45fa-96eb-c95cb562c7c6;");
        query_row = query_res.one();

        System.out.println("========================");
        System.out.println("2. Lista das tags de determinado vídeo;");
        System.out.println(query_row);
       
        // 3. Todos os videos com a tag Aveiro
        query_res = session.execute("SELECT * FROM videosharing.video WHERE tags CONTAINS 'Aveiro';");

        System.out.println("========================");
        System.out.println("3. Todos os videos com a tag Aveiro");
        for (Row row : query_res) {
            System.out.println(row);
        }

        // 4. Os últimos 5 eventos de determinado vídeo realizados por um utilizador;
        query_res = session.execute("SELECT * FROM videoSharing.event WHERE userid=f34c8c5b-c539-46a5-868b-7182fb5143ed AND videoid=ef50064e-1cfb-45fa-96eb-c95cb562c7c6 LIMIT 5;");

        System.out.println("========================");
        System.out.println("4. Os últimos 5 eventos de determinado vídeo realizados por um utilizador;");
        for (Row row : query_res) {
            System.out.println(row);
        }

    }
}

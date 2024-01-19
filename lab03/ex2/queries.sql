
-- 7. Permitir a pesquisa de todos os vídeos de determinado autor;
SELECT * FROM videoSharing.videosPosted WHERE username='Maria123';

-- 8. Permitir a pesquisa de comentários por utilizador, ordenado inversamente pela data;
SELECT * FROM videoSharing.commentByUser WHERE userid = c822e646-e100-4dae-b252-f72aa8eb04ed ORDER BY postedAt DESC;

-- 9. Permitir a pesquisa de comentários por vídeos, ordenado inversamente pela data;
SELECT * FROM videoSharing.commentByVideo WHERE videoid = e962e6a2-271c-4297-b3cf-b1fdeb349452 ORDER BY postedAt DESC;

-- 10. Permitir a pesquisa do rating médio de um vídeo e quantas vezes foi votado;
SELECT COUNT(rating), AVG(rating) from videosharing.rating WHERE videoid=ef50064e-1cfb-45fa-96eb-c95cb562c7c6;

-- 2. d)

-- 1. Os últimos 3 comentários introduzidos para um vídeo;
SELECT * FROM videosharing.commentByVideo WHERE videoid = ef50064e-1cfb-45fa-96eb-c95cb562c7c6 LIMIT 3;

-- 2. Lista das tags de determinado vídeo;
SELECT tags FROM videosharing.video WHERE videoid = ef50064e-1cfb-45fa-96eb-c95cb562c7c6;

-- 3. Todos os vídeos com a tag Aveiro;
SELECT * FROM videosharing.video WHERE tags CONTAINS 'Aveiro';

-- 4. Os últimos 5 eventos de determinado vídeo realizados por um utilizador;
SELECT * FROM videosharing.event WHERE userid=f34c8c5b-c539-46a5-868b-7182fb5143ed AND videoid=ef50064e-1cfb-45fa-96eb-c95cb562c7c6 LIMIT 5;

-- 5. Vídeos partilhados por determinado utilizador (maria1987, por exemplo) num determinado período de tempo (Agosto de 2017, por exemplo);
SELECT  * FROM videosharing.videosPosted WHERE username='Maria123' AND postedAt >= '2023-11-28 10:00:31.012' AND postedat <= '2023-11-29 10:00:31.012'

-- 6. Os últimos 10 vídeos, ordenado inversamente pela data da partilhada;
SELECT * FROM videosharing.video LIMIT 10;

-- 7. Todos os seguidores (followers) de determinado vídeo;
SELECT followers FROM videosharing.video WHERE videoid=ef50064e-1cfb-45fa-96eb-c95cb562c7c6;

-- 8. Todos os comentários (dos vídeos) que determinado utilizador está a seguir (following);
-- Não é possível em Cassandra, pois ainda que criasse uma tabela para os vídeos seguidos por utilizador, ainda seria
-- necessário fazer Join para obter os comentários de cada vídeo.

-- 9. Os 5 vídeos com maior rating;
-- Não é possível em Cassandra, pois seria necessário fazer uma subquery.

-- 10. Uma query que retorne todos os vídeos e que mostre claramente a forma pela qual estão
-- ordenados;

SELECT * FROM videosharing.video; -- Ordenados pela clsutering key, shearedAt (timestamp)

-- 11. Lista com as Tags existentes e o número de vídeos catalogados com cada uma delas;
-- Não é possível em Cassandra, pois não há forma de obter todas as tags já que estas estão organizadas em vídeos,
-- e mesmo se existisse uma tabela para as tags, seria necessário um Join para obter o número de vídeos.

-- 12. Número de eventos causados por um utilizador em um determinado vídeo;
SELECT COUNT(*) FROM videosharing.event WHERE userid=f34c8c5b-c539-46a5-868b-7182fb5143ed AND videoid=ef50064e-1cfb-45fa-96eb-c95cb562c7c6;

-- 13. Número de comentários postados em um vídeo em determinado período de tempo
SELECT COUNT(*) FROM videosharing.commentbyvideo WHERE videoid=ef50064e-1cfb-45fa-96eb-c95cb562c7c6 AND postedat >= '2023-11-28T09:34:23.210Z';
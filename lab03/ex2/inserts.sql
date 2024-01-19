-- User

INSERT INTO videoSharing.user (userid, username, nome, email, registeredAt)
VALUES
(f34c8c5b-c539-46a5-868b-7182fb5143ed, 'Joao123', 'Joao', 'joao@ua.pt', toTimestamp(now()));

INSERT INTO videoSharing.user (userid, username, nome, email, registeredAt)
VALUES
(3f6930f7-a09c-4c54-8617-872040d0208f, 'Maria123', 'MariaJoaquina', 'mj@ua.pt', toTimestamp(now()));

INSERT INTO videoSharing.user (userid, username, nome, email, registeredAt)
VALUES
(b6cf68c0-40f7-4d99-88be-8c0c40645034, 'MassageASMR', 'Dimitri', 'abc@ua.pt', toTimestamp(now()));

INSERT INTO videoSharing.user (userid, username, nome, email, registeredAt)
VALUES
(6daa90a3-12a8-4bcc-a28e-282f63132e37, 'JojoASMR', 'Jojo', 'jojo@ua.pt', toTimestamp(now()));

INSERT INTO videoSharing.user (userid, username, nome, email, registeredAt)
VALUES
(f05ced00-5d44-47b2-9e45-700e97587f51, 'malena0202', 'Malena Nunes', 'malena0202@gmail.com', toTimestamp(now()));

INSERT INTO videoSharing.user (userid, username, nome, email, registeredAt)
VALUES
(b4aab076-29c5-4db1-bdac-6ad7f83243a8, 'JoeMoe', 'Joe', 'joe@ua.pt', toTimestamp(now()));

INSERT INTO videoSharing.user (userid, username, nome, email, registeredAt)
VALUES
(987f44be-3a06-4a95-9dad-d5db3a17b7cb, 'doejohn', 'John Doe', 'john.doe@gmail.com', '2023-01-01 12:00:00');

INSERT INTO videoSharing.user (userid, username, nome, email, registeredAt)
VALUES
(4dd23557-3a6c-40b9-a632-1bad4d2fd3db, 'jane', 'Jane Smith', 'jane.smith@ua.com', '2023-02-15 09:30:00');

INSERT INTO videoSharing.user (userid, username, nome, email, registeredAt)
VALUES
(8c310f1e-8fa2-4715-bc6c-13342cb97662, 'alice8', 'Alice Johnson', 'alice.johnson@ua.com', '2023-03-20 15:45:00');

INSERT INTO videoSharing.user (userid, username, nome, email, registeredAt)
VALUES
(c97a497b-1dea-468b-ba68-5731eb35deb8, 'bob10', 'Bob Mark', 'bob.mark@gmail.com', '2023-04-10 18:20:00');

-- Video

INSERT INTO videoSharing.video (videoid, title, descr, tags, sharedAt, followers)
VALUES
(ef50064e-1cfb-45fa-96eb-c95cb562c7c6, 'Capybaras swimming', 'Capybaras are cool', {'Capybaras', 'Animals'}, toTimestamp(now()), [f34c8c5b-c539-46a5-868b-7182fb5143ed, 3f6930f7-a09c-4c54-8617-872040d0208f]);

INSERT INTO videoSharing.video (videoid, title, descr, tags, sharedAt, followers)
VALUES
(15ea291a-6a10-4223-88c8-99ff563c56b2, 'Aveiro city', 'Aveiro is pretty', {'Portugal', 'Aveiro'}, toTimestamp(now()), [f05ced00-5d44-47b2-9e45-700e97587f51]);

INSERT INTO videoSharing.video (videoid, title, descr, tags, sharedAt, followers)
VALUES
(33d76130-f5d1-46a5-8f9c-3629a5eead70, 'Lontras swimming', 'Lontras are cool', {'Lontras', 'Animals'}, toTimestamp(now()), [f34c8c5b-c539-46a5-868b-7182fb5143ed, 3f6930f7-a09c-4c54-8617-872040d0208f]);

INSERT INTO videoSharing.video (videoid, title, descr, tags, sharedAt, followers)
VALUES
(87d3a138-75ea-4a5f-9e79-b8d685baed42, 'Porto city', 'Porto is pretty', {'Portugal', 'Porto'}, toTimestamp(now()), [f05ced00-5d44-47b2-9e45-700e97587f51]);

INSERT INTO videoSharing.video (videoid, title, descr, tags, sharedAt, followers)
VALUES
(94aa70b3-521c-4c87-99cd-56916c6f220f, 'Braga city', 'Braga is nice', {'Portugal', 'Braga'}, toTimestamp(now()), [f05ced00-5d44-47b2-9e45-700e97587f51]);

INSERT INTO videoSharing.video (videoid, title, descr, tags, sharedAt, followers)
VALUES
(09d90e4c-2e6c-403e-95f3-8aa41c2d0fe4, 'Fortaleza city', 'Fortaleza is the best, I miss my hometown', {'Brasil', 'Fortaleza'}, toTimestamp(now()), [f05ced00-5d44-47b2-9e45-700e97587f51, 3f6930f7-a09c-4c54-8617-872040d0208f]);

INSERT INTO videoSharing.video (videoid, title, descr, tags, sharedAt, followers)
VALUES
(366eb8f6-0aed-4202-9248-b4538192e9a8, 'São Paulo is hell', 'São Paulo is the worse and has the worse people', {'Brasil', 'São Paulo'}, toTimestamp(now()), [f05ced00-5d44-47b2-9e45-700e97587f51, 3f6930f7-a09c-4c54-8617-872040d0208f]);

INSERT INTO videoSharing.video (videoid, title, descr, tags, sharedAt, followers)
VALUES
(fa75053a-ae53-42a6-bb4d-dcf177f443fe, 'Meditation', 'Sleep, sleep, sleep...', {'Sleep', 'Meditation'}, toTimestamp(now()), [f05ced00-5d44-47b2-9e45-700e97587f51, 3f6930f7-a09c-4c54-8617-872040d0208f]);

INSERT INTO videoSharing.video (videoid, title, descr, tags, sharedAt, followers)
VALUES
(b5905fbd-65ec-4049-8634-db16392e4fd5, 'Top 5 best foods', 'Yum', {'Food'}, toTimestamp(now()), [f05ced00-5d44-47b2-9e45-700e97587f51, 3f6930f7-a09c-4c54-8617-872040d0208f]);

INSERT INTO videoSharing.video (videoid, title, descr, tags, sharedAt, followers)
VALUES
(725c96d7-d749-4377-a419-0382eba85b86, 'Spiders are scary', 'Jumpscare alert', {'Spiders', 'Scary'}, toTimestamp(now()), [f34c8c5b-c539-46a5-868b-7182fb5143ed, 3f6930f7-a09c-4c54-8617-872040d0208f]);

-- VideosPosted

INSERT INTO videosharing.videosPosted (username, postedat, videoid)
VALUES
('Maria123', '2023-11-28 11:00:31.012', ef50064e-1cfb-45fa-96eb-c95cb562c7c6);

INSERT INTO videosharing.videosPosted (username, postedat, videoid)
VALUES
('JojoASMR', '2023-11-28 11:00:31.012', 15ea291a-6a10-4223-88c8-99ff563c56b2);

INSERT INTO videosharing.videosPosted (username, postedat, videoid)
VALUES
('MassageASMR', '2023-11-28 11:00:31.012', fa75053a-ae53-42a6-bb4d-dcf177f443fe);

INSERT INTO videosharing.videosPosted (username, postedat, videoid)
VALUES
('Joao123', '2023-11-28 11:00:31.012', 33d76130-f5d1-46a5-8f9c-3629a5eead70);

INSERT INTO videosharing.videosPosted (username, postedat, videoid)
VALUES
('malena0202', '2023-11-28 11:00:31.012', 87d3a138-75ea-4a5f-9e79-b8d685baed42);

INSERT INTO videosharing.videosPosted (username, postedat, videoid)
VALUES
('JoeMoe', '2023-11-28 11:00:31.012', 94aa70b3-521c-4c87-99cd-56916c6f220f);

INSERT INTO videosharing.videosPosted (username, postedat, videoid)
VALUES
('doejohn', '2023-11-28 11:00:31.012', 09d90e4c-2e6c-403e-95f3-8aa41c2d0fe4);

INSERT INTO videosharing.videosPosted (username, postedat, videoid)
VALUES
('jane', '2023-11-28 11:00:31.012', 366eb8f6-0aed-4202-9248-b4538192e9a8);

INSERT INTO videosharing.videosPosted (username, postedat, videoid)
VALUES
('jane', '2023-11-28 11:00:31.012', b5905fbd-65ec-4049-8634-db16392e4fd5);

INSERT INTO videosharing.videosPosted (username, postedat, videoid)
VALUES
('jane', '2023-11-28 11:00:31.012', 725c96d7-d749-4377-a419-0382eba85b86);

-- CommentByUser

INSERT INTO videoSharing.commentByUser(userid, commentText, postedAt) VALUES
(f05ced00-5d44-47b2-9e45-700e97587f51, 'Great video', toTimestamp(now()));

 INSERT INTO videoSharing.commentByUser(userid, commentText, postedAt) VALUES
(f05ced00-5d44-47b2-9e45-700e97587f51, 'Bad video', toTimestamp(now()));

 INSERT INTO videoSharing.commentByVideo(videoid, commentText, postedAt) VALUES
(f05ced00-5d44-47b2-9e45-700e97587f51, 'Good video', '2023-11-29T09:34:23.210Z');

 INSERT INTO videoSharing.commentByUser(userid, commentText, postedAt) VALUES
(f05ced00-5d44-47b2-9e45-700e97587f51, 'Fun video', toTimestamp(now()));

 INSERT INTO videoSharing.commentByUser(userid, commentText, postedAt) VALUES
(f05ced00-5d44-47b2-9e45-700e97587f51, 'Poggers video', toTimestamp(now()));

 INSERT INTO videoSharing.commentByUser(userid, commentText, postedAt) VALUES
(f05ced00-5d44-47b2-9e45-700e97587f51, 'Loved the video', toTimestamp(now()));

 INSERT INTO videoSharing.commentByUser(userid, commentText, postedAt) VALUES
(f34c8c5b-c539-46a5-868b-7182fb5143ed, 'Im scared', toTimestamp(now()));

 INSERT INTO videoSharing.commentByUser(userid, commentText, postedAt) VALUES
(f34c8c5b-c539-46a5-868b-7182fb5143ed, 'I hate spiders omg', toTimestamp(now()));

 INSERT INTO videoSharing.commentByUser(userid, commentText, postedAt) VALUES
(f34c8c5b-c539-46a5-868b-7182fb5143ed, 'Ew', toTimestamp(now()));

 INSERT INTO videoSharing.commentByUser(userid, commentText, postedAt) VALUES
(f34c8c5b-c539-46a5-868b-7182fb5143ed, 'I hate spiders man', toTimestamp(now()));

 INSERT INTO videoSharing.commentByUser(userid, commentText, postedAt) VALUES
(f34c8c5b-c539-46a5-868b-7182fb5143ed, 'No.', toTimestamp(now()));

-- CommentByVideo

 INSERT INTO videoSharing.commentByVideo(videoid, commentText, postedAt) VALUES
(ef50064e-1cfb-45fa-96eb-c95cb562c7c6, 'Great video', '2023-11-23T09:34:23.210Z');

 INSERT INTO videoSharing.commentByVideo(videoid, commentText, postedAt) VALUES
(ef50064e-1cfb-45fa-96eb-c95cb562c7c6, 'Good video', '2023-11-29T09:34:23.210Z');

 INSERT INTO videoSharing.commentByVideo(videoid, commentText, postedAt) VALUES
(ef50064e-1cfb-45fa-96eb-c95cb562c7c6, 'Bad video', '2023-11-28T09:34:23.210Z');

 INSERT INTO videoSharing.commentByVideo(videoid, commentText, postedAt) VALUES
(ef50064e-1cfb-45fa-96eb-c95cb562c7c6, 'Fun video', '2023-11-27T09:34:23.210Z');

 INSERT INTO videoSharing.commentByVideo(videoid, commentText, postedAt) VALUES
(ef50064e-1cfb-45fa-96eb-c95cb562c7c6, 'Poggers video', '2023-01-27T09:34:23.210Z');

 INSERT INTO videoSharing.commentByVideo(videoid, commentText, postedAt) VALUES
(ef50064e-1cfb-45fa-96eb-c95cb562c7c6, 'Loved the video', '2023-10-27T09:34:23.210Z');

 INSERT INTO videoSharing.commentByVideo(videoid, commentText, postedAt) VALUES
(725c96d7-d749-4377-a419-0382eba85b86, 'Im scared', toTimestamp(now()));

 INSERT INTO videoSharing.commentByVideo(videoid, commentText, postedAt) VALUES
(725c96d7-d749-4377-a419-0382eba85b86, 'I hate spiders omg', toTimestamp(now()));

 INSERT INTO videoSharing.commentByVideo(videoid, commentText, postedAt) VALUES
(725c96d7-d749-4377-a419-0382eba85b86, 'Ew', toTimestamp(now()));

 INSERT INTO videoSharing.commentByVideo(videoid, commentText, postedAt) VALUES
(725c96d7-d749-4377-a419-0382eba85b86, 'I hate spiders man', toTimestamp(now()));

 INSERT INTO videoSharing.commentByVideo(videoid, commentText, postedAt) VALUES
(725c96d7-d749-4377-a419-0382eba85b86, 'No.', toTimestamp(now()));

-- Ratings

INSERT INTO videosharing.rating(videoid, ratedat, rating) VALUES
(ef50064e-1cfb-45fa-96eb-c95cb562c7c6, toTimestamp(now()), 5);

INSERT INTO videosharing.rating(videoid, ratedat, rating) VALUES
(ef50064e-1cfb-45fa-96eb-c95cb562c7c6, toTimestamp(now()), 3);

INSERT INTO videosharing.rating(videoid, ratedat, rating) VALUES
(ef50064e-1cfb-45fa-96eb-c95cb562c7c6, toTimestamp(now()), 4);

INSERT INTO videosharing.rating(videoid, ratedat, rating) VALUES
(ef50064e-1cfb-45fa-96eb-c95cb562c7c6, toTimestamp(now()), 5);

INSERT INTO videosharing.rating(videoid, ratedat, rating) VALUES
(ef50064e-1cfb-45fa-96eb-c95cb562c7c6, toTimestamp(now()), 3);

INSERT INTO videosharing.rating(videoid, ratedat, rating) VALUES
(ef50064e-1cfb-45fa-96eb-c95cb562c7c6, toTimestamp(now()), 4);

INSERT INTO videosharing.rating(videoid, ratedat, rating) VALUES
(725c96d7-d749-4377-a419-0382eba85b86, toTimestamp(now()), 1);

INSERT INTO videosharing.rating(videoid, ratedat, rating) VALUES
(725c96d7-d749-4377-a419-0382eba85b86, toTimestamp(now()), 2);

INSERT INTO videosharing.rating(videoid, ratedat, rating) VALUES
(725c96d7-d749-4377-a419-0382eba85b86, toTimestamp(now()), 3);

INSERT INTO videosharing.rating(videoid, ratedat, rating) VALUES
(725c96d7-d749-4377-a419-0382eba85b86, toTimestamp(now()), 4);

INSERT INTO videosharing.rating(videoid, ratedat, rating) VALUES
(725c96d7-d749-4377-a419-0382eba85b86, toTimestamp(now()), 3);

-- Event

INSERT INTO videosharing.event(userid, videoid, triggeredat, trigger, videotime) VALUES
(f34c8c5b-c539-46a5-868b-7182fb5143ed , ef50064e-1cfb-45fa-96eb-c95cb562c7c6, toTimestamp(now()), 'play', '00:12:54');

INSERT INTO videosharing.event(userid, videoid, triggeredat, trigger, videotime) VALUES
(f34c8c5b-c539-46a5-868b-7182fb5143ed , ef50064e-1cfb-45fa-96eb-c95cb562c7c6, toTimestamp(now()), 'pause', '00:14:54');

INSERT INTO videosharing.event(userid, videoid, triggeredat, trigger, videotime) VALUES
(f34c8c5b-c539-46a5-868b-7182fb5143ed , ef50064e-1cfb-45fa-96eb-c95cb562c7c6, toTimestamp(now()), 'pause', '00:15:54');

INSERT INTO videosharing.event(userid, videoid, triggeredat, trigger, videotime) VALUES
(f34c8c5b-c539-46a5-868b-7182fb5143ed , ef50064e-1cfb-45fa-96eb-c95cb562c7c6, toTimestamp(now()), 'pause', '00:16:54');

INSERT INTO videosharing.event(userid, videoid, triggeredat, trigger, videotime) VALUES
(f34c8c5b-c539-46a5-868b-7182fb5143ed , ef50064e-1cfb-45fa-96eb-c95cb562c7c6, toTimestamp(now()), 'pause', '00:17:54');

INSERT INTO videosharing.event(userid, videoid, triggeredat, trigger, videotime) VALUES
(f34c8c5b-c539-46a5-868b-7182fb5143ed , ef50064e-1cfb-45fa-96eb-c95cb562c7c6, toTimestamp(now()), 'pause', '00:18:54');

INSERT INTO videosharing.event(userid, videoid, triggeredat, trigger, videotime) VALUES
(f34c8c5b-c539-46a5-868b-7182fb5143ed , ef50064e-1cfb-45fa-96eb-c95cb562c7c6, toTimestamp(now()), 'pause', '00:19:54');

INSERT INTO videosharing.event(userid, videoid, triggeredat, trigger, videotime) VALUES
(f34c8c5b-c539-46a5-868b-7182fb5143ed , ef50064e-1cfb-45fa-96eb-c95cb562c7c6, toTimestamp(now()), 'pause', '00:20:54');

INSERT INTO videosharing.event(userid, videoid, triggeredat, trigger, videotime) VALUES
(f34c8c5b-c539-46a5-868b-7182fb5143ed , ef50064e-1cfb-45fa-96eb-c95cb562c7c6, toTimestamp(now()), 'pause', '00:21:54');

INSERT INTO videosharing.event(userid, videoid, triggeredat, trigger, videotime) VALUES
(f34c8c5b-c539-46a5-868b-7182fb5143ed , ef50064e-1cfb-45fa-96eb-c95cb562c7c6, toTimestamp(now()), 'stop', '00:22:54');
show tables;
show databases;
use fsd;

CREATE DATABASE event_management;
USE event_management;

-- 1. Users Table
CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    city VARCHAR(100) NOT NULL,
    registration_date DATE NOT NULL
);

-- 2. Events Table
CREATE TABLE Events (
    event_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    description TEXT,
    city VARCHAR(100) NOT NULL,
    start_date DATETIME NOT NULL,
    end_date DATETIME NOT NULL,
    status ENUM('upcoming','completed','cancelled') NOT NULL,
    organizer_id INT,
    FOREIGN KEY (organizer_id) REFERENCES Users(user_id)
);

-- 3. Sessions Table
CREATE TABLE Sessions (
    session_id INT AUTO_INCREMENT PRIMARY KEY,
    event_id INT,
    title VARCHAR(200) NOT NULL,
    speaker_name VARCHAR(100) NOT NULL,
    start_time DATETIME NOT NULL,
    end_time DATETIME NOT NULL,
    FOREIGN KEY (event_id) REFERENCES Events(event_id)
);

-- 4. Registrations Table
CREATE TABLE Registrations (
    registration_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    event_id INT,
    registration_date DATE NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (event_id) REFERENCES Events(event_id)
);

-- 5. Feedback Table
CREATE TABLE Feedback (
    feedback_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    event_id INT,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    comments TEXT,
    feedback_date DATE NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (event_id) REFERENCES Events(event_id)
);

-- 6. Resources Table
CREATE TABLE Resources (
    resource_id INT AUTO_INCREMENT PRIMARY KEY,
    event_id INT,
    resource_type ENUM('pdf','image','link') NOT NULL,
    resource_url VARCHAR(255) NOT NULL,
    uploaded_at DATETIME NOT NULL,
    FOREIGN KEY (event_id) REFERENCES Events(event_id)
);

DESC Users;
DESC Events;
DESC Sessions;
DESC Registrations;
DESC Feedback;
DESC Resources;


-- USERS
INSERT INTO Users
(user_id, full_name, email, city, registration_date)
VALUES
(1, 'Alice Johnson', 'alice@example.com', 'New York', '2024-12-01'),
(2, 'Bob Smith', 'bob@example.com', 'Los Angeles', '2024-12-05'),
(3, 'Charlie Lee', 'charlie@example.com', 'Chicago', '2024-12-10'),
(4, 'Diana King', 'diana@example.com', 'New York', '2025-01-15'),
(5, 'Ethan Hunt', 'ethan@example.com', 'Los Angeles', '2025-02-01');

-- EVENTS
INSERT INTO Events
(event_id, title, description, city, start_date, end_date, status, organizer_id)
VALUES
(1,
 'Tech Innovators Meetup',
 'A meetup for tech enthusiasts.',
 'New York',
 '2025-06-10 10:00:00',
 '2025-06-10 16:00:00',
 'upcoming',
 1),

(2,
 'AI & ML Conference',
 'Conference on AI and ML advancements.',
 'Chicago',
 '2025-05-15 09:00:00',
 '2025-05-15 17:00:00',
 'completed',
 3),

(3,
 'Frontend Development Bootcamp',
 'Hands-on training on frontend tech.',
 'Los Angeles',
 '2025-07-01 10:00:00',
 '2025-07-03 16:00:00',
 'upcoming',
 2);

-- SESSIONS
INSERT INTO Sessions
(session_id, event_id, title, speaker_name, start_time, end_time)
VALUES
(1,
 1,
 'Opening Keynote',
 'Dr. Tech',
 '2025-06-10 10:00:00',
 '2025-06-10 11:00:00'),

(2,
 1,
 'Future of Web Dev',
 'Alice Johnson',
 '2025-06-10 11:15:00',
 '2025-06-10 12:30:00'),

(3,
 2,
 'AI in Healthcare',
 'Charlie Lee',
 '2025-05-15 09:30:00',
 '2025-05-15 11:00:00'),

(4,
 3,
 'Intro to HTML5',
 'Bob Smith',
 '2025-07-01 10:00:00',
 '2025-07-01 12:00:00');

-- REGISTRATIONS
INSERT INTO Registrations
(registration_id, user_id, event_id, registration_date)
VALUES
(1, 1, 1, '2025-05-01'),
(2, 2, 1, '2025-05-02'),
(3, 3, 2, '2025-04-30'),
(4, 4, 2, '2025-04-28'),
(5, 5, 3, '2025-06-15');

-- FEEDBACK
INSERT INTO Feedback
(feedback_id, user_id, event_id, rating, comments, feedback_date)
VALUES
(1, 3, 2, 4, 'Great insights!', '2025-05-16'),
(2, 4, 2, 5, 'Very informative.', '2025-05-16'),
(3, 2, 1, 3, 'Could be better.', '2025-06-11');

-- RESOURCES
INSERT INTO Resources
(resource_id, event_id, resource_type, resource_url, uploaded_at)
VALUES
(1,
 1,
 'pdf',
 'https://portal.com/resources/tech_meetup_agenda.pdf',
 '2025-05-01 10:00:00'),

(2,
 2,
 'image',
 'https://portal.com/resources/ai_poster.jpg',
 '2025-04-20 09:00:00'),

(3,
 3,
 'link',
 'https://portal.com/resources/html5_docs',
 '2025-06-25 15:00:00');
 select * from users;
--  1
select e.title from events e join Registrations r on e.event_id = r.event_id join users u on r.user_id = u.user_id where e.status = 'upcoming' and u.city = e.city order by e.start_date;
select * from feedback;
-- 2
select e.title,avg(f.rating) as avgrating from events e join feedback f on f.event_id = e.event_id  group by e.event_id having count(*) >= 10 order by avgrating desc;
-- 3
select full_name from users where user_id not in (select user_id from users where registration_date >= curdate() - interval 90 day);
-- 4
select count(*) from sessions s join events e on s.event_id = e.event_id where hour(s.start_time) >= 10 and hour(s.end_time) <=12 group by e.event_id and e.title
;
-- 5
select city,count(distinct user_id) as num  from users  group by city order by num desc limit 5;
-- 6
select e.title,count(*) from resources r join events e on r.event_id = e.event_id group by e.title and e.event_id;
-- 7
select u.full_name,f.comments,e.title from users u join feedback f on f.user_id = u.user_id join events e on  f.event_id = e.event_id where f.rating < 3; 
-- 8
select e.title ,count(*) from events e join sessions s on e.event_id = s.event_id where e.start_date > curdate() group by e.event_id , e.title;
-- 9
select organizer_id , status from events group by event_id, title;
-- 10
select e.title from events e join registrations r on r.event_id = e.event_id where e.event_id not in(select e.event_id from events e join feedback f on e.event_id = f.event_id);
-- 11
select count(*),u.full_name from registrations r join users u on u.user_id = r.user_id where r.registration_date >= curdate() - interval 7 day group by u.user_id;
-- 12
select e.title,count(*) as num from events e join sessions s on s.event_id = e.event_id group by e.title,e.event_id order by num desc;
-- 13
select e.city,avg(f.rating) as average from feedback f join events e on e.event_id = f.event_id group by e.city;
-- 14
select e.title,count(*) from events e join registrations r on r.event_id = e.event_id group by e.title;
-- 15
select s1.title, s2,title from sessions s1 join sessions s2 on s1.event_id = s2.event_id;
-- self join
-- 16
SELECT u.full_name
FROM Users u
WHERE u.registration_date >= CURDATE() - INTERVAL 30 DAY
AND u.user_id NOT IN (
    SELECT user_id
    FROM Registrations
);
-- 17
select s.speaker_name ,count(*) as num from sessions s join events e on e.event_id = s.event_id group by s.speaker_name having num > 1;
-- 18
select e.title from events e join resources r on r.event_id = r.event_id where r.resource_id = null;
-- 19
select count(*) as total,avg(f.rating) from registrations r join events e on e.event_id = r.event_id join feedback f on f.event_id = e.event_id where e.status = 'completed' group by e.event_id,e.title;
-- 20
SELECT u.full_name,
       COUNT(DISTINCT r.event_id) AS events_attended,
       COUNT(DISTINCT f.feedback_id) AS feedbacks_submitted
FROM Users u
LEFT JOIN Registrations r
ON u.user_id = r.user_id
LEFT JOIN Feedback f
ON u.user_id = f.user_id
GROUP BY u.user_id, u.full_name;
-- 21
select u.full_name ,count(*) from users u join feedback f on f.user_id = u.user_id group by u.user_id;
-- 22
SELECT user_id,
       event_id,
       COUNT(*) AS registration_count
FROM Registrations
GROUP BY user_id, event_id
HAVING COUNT(*) > 1;
-- 23
select date_format(registration_date,'%Y-%M') as month, count(*) as registrations  from users where registration_date >= curdate() - interval 12 month group by month;
-- 24
select e.title,avg(timestampdiff(minute,s.start_time ,s.end_time)) from sessions s join events e on e.event_id = s.event_id group by e.title,e.event_id;

-- 25
SELECT e.*
FROM events e
LEFT JOIN sessions s
ON e.event_id = s.event_id
WHERE s.event_id IS NULL;

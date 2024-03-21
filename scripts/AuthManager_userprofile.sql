create table AuthManager_userprofile
(
    last_login   datetime,
    is_superuser bool         not null,
    is_staff     bool         not null,
    is_active    bool         not null,
    id           char(32)     not null
        primary key,
    username     varchar(255) not null,
    email        varchar(255) not null
        unique,
    password     varchar(255) not null,
    first_name   varchar(255) not null,
    last_name    varchar(255) not null,
    country      varchar(100),
    state        varchar(100),
    city         varchar(100),
    date_joined  datetime     not null
);

INSERT INTO AuthManager_userprofile (last_login, is_superuser, is_staff, is_active, id, username, email, password, first_name, last_name, country, state, city, date_joined) VALUES ('2024-03-21 13:31:05.487307', 0, 0, 1, '827f1c621cf14fbf83ff40be61e3b4ec', 'newer_user', 'new_user@example.com', 'pbkdf2_sha256$720000$exj5yH91f5kyT3agOf829J$B71yGbRmdXKoqiStIqOVVQfuukg6Gcf/39LtRxDnIoc=', 'First', 'Last', null, null, null, '2024-03-21 13:04:27.109972');
INSERT INTO AuthManager_userprofile (last_login, is_superuser, is_staff, is_active, id, username, email, password, first_name, last_name, country, state, city, date_joined) VALUES (null, 0, 0, 1, '5b26d6b55e3e4b93928b9efad72aa9a1', 'newer_user', 'newer_user@example.com', 'pbkdf2_sha256$720000$IYj2KEOrQndL93c01RkZ9S$5sKVq3PKH9ecQjNj113QYVBaYCxESfJ8Wmjl2Pag+xk=', 'First', 'Last', 'IN', 'KL', 'TVM', '2024-03-21 13:07:51.804898');
INSERT INTO AuthManager_userprofile (last_login, is_superuser, is_staff, is_active, id, username, email, password, first_name, last_name, country, state, city, date_joined) VALUES ('2024-03-21 19:23:22.067047', 0, 0, 1, '0f414ddd5fe548899d9f3f3bd63d2415', 'newer_user', 'new_user@gmail.com', 'pbkdf2_sha256$720000$8gZEnUIRV9cP43fqvgG3Ib$QHgEJ7ogv9xmX7kTYzOiT4G28QKaCuArxQKA4839HIQ=', 'First', 'Last', 'IN', 'KL', 'TVM', '2024-03-21 19:22:10.793233');

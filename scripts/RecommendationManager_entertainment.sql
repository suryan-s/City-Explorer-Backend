create table RecommendationManager_entertainment
(
    id          integer      not null
        primary key autoincrement,
    name        varchar(255) not null,
    description text         not null,
    created_at  datetime     not null,
    updated_at  datetime     not null
);

INSERT INTO RecommendationManager_entertainment (id, name, description, created_at, updated_at) VALUES (1, 'Movie Theater', 'Watch the latest movies on the big screen', '2024-03-21 17:02:04.227016', '2024-03-21 17:02:04.227041');
INSERT INTO RecommendationManager_entertainment (id, name, description, created_at, updated_at) VALUES (2, 'Amusement Park', 'Enjoy thrilling rides and attractions', '2024-03-21 17:02:15.933857', '2024-03-21 17:02:15.933875');
INSERT INTO RecommendationManager_entertainment (id, name, description, created_at, updated_at) VALUES (3, 'Concert Venue', 'Attend live music performances', '2024-03-21 17:02:27.715980', '2024-03-21 17:02:27.716002');
INSERT INTO RecommendationManager_entertainment (id, name, description, created_at, updated_at) VALUES (4, 'Art Gallery', 'Explore contemporary and classic art', '2024-03-21 17:02:38.780384', '2024-03-21 17:02:38.780405');
INSERT INTO RecommendationManager_entertainment (id, name, description, created_at, updated_at) VALUES (5, 'Sports Stadium', 'Cheer for your favorite sports teams', '2024-03-21 17:02:52.257377', '2024-03-21 17:02:52.257404');

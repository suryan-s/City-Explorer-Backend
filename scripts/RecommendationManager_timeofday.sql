create table RecommendationManager_timeofday
(
    id          integer      not null
        primary key autoincrement,
    name        varchar(255) not null,
    description text         not null,
    created_at  datetime     not null,
    updated_at  datetime     not null
);

INSERT INTO RecommendationManager_timeofday (id, name, description, created_at, updated_at) VALUES (1, 'Morning', 'Early part of the day, from sunrise to noon', '2024-03-21 16:57:05.699006', '2024-03-21 16:57:05.699140');
INSERT INTO RecommendationManager_timeofday (id, name, description, created_at, updated_at) VALUES (2, 'Noon', 'Midday, around 12:00 PM', '2024-03-21 16:57:27.752130', '2024-03-21 16:57:27.752149');
INSERT INTO RecommendationManager_timeofday (id, name, description, created_at, updated_at) VALUES (3, 'Afternoon', 'Later part of the day, from noon to evening', '2024-03-21 16:57:41.236229', '2024-03-21 16:57:41.236265');
INSERT INTO RecommendationManager_timeofday (id, name, description, created_at, updated_at) VALUES (4, 'Evening', 'Late part of the day, after sunset', '2024-03-21 16:57:59.150822', '2024-03-21 16:57:59.150841');
INSERT INTO RecommendationManager_timeofday (id, name, description, created_at, updated_at) VALUES (5, 'Night', 'Time between sunset and sunrise, usually for sleeping', '2024-03-21 16:58:16.212484', '2024-03-21 16:58:16.212515');

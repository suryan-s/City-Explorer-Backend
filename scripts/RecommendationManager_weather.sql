create table RecommendationManager_weather
(
    id          integer      not null
        primary key autoincrement,
    name        varchar(255) not null,
    description text         not null,
    created_at  datetime     not null,
    updated_at  datetime     not null
);

INSERT INTO RecommendationManager_weather (id, name, description, created_at, updated_at) VALUES (6, 'Sunny', 'Clear skies and sunshine', '2024-03-21 17:00:52.626362', '2024-03-21 17:00:52.626386');
INSERT INTO RecommendationManager_weather (id, name, description, created_at, updated_at) VALUES (7, 'Rainy', 'Wet weather with rain showers', '2024-03-21 17:01:02.462231', '2024-03-21 17:01:02.462253');
INSERT INTO RecommendationManager_weather (id, name, description, created_at, updated_at) VALUES (8, 'Cloudy', 'Partly or mostly cloudy skies', '2024-03-21 17:01:12.975321', '2024-03-21 17:01:12.975342');
INSERT INTO RecommendationManager_weather (id, name, description, created_at, updated_at) VALUES (9, 'Snowy', 'Snowfall and cold temperatures', '2024-03-21 17:01:25.698666', '2024-03-21 17:01:25.698690');
INSERT INTO RecommendationManager_weather (id, name, description, created_at, updated_at) VALUES (10, 'Windy', 'Strong gusts of wind', '2024-03-21 17:01:37.064652', '2024-03-21 17:01:37.064671');

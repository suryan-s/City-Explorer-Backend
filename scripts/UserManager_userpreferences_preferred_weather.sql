create table UserManager_userpreferences_preferred_weather
(
    id                 integer  not null
        primary key autoincrement,
    userpreferences_id char(32) not null
        references UserManager_userpreferences
            deferrable initially deferred,
    weather_id         bigint   not null
        references RecommendationManager_weather
            deferrable initially deferred
);

create index UserManager_userpreferences_preferred_weather_userpreferences_id_ad851e8f
    on UserManager_userpreferences_preferred_weather (userpreferences_id);

create unique index UserManager_userpreferences_preferred_weather_userpreferences_id_weather_id_c2086a0b_uniq
    on UserManager_userpreferences_preferred_weather (userpreferences_id, weather_id);

create index UserManager_userpreferences_preferred_weather_weather_id_3a3de4f8
    on UserManager_userpreferences_preferred_weather (weather_id);

INSERT INTO UserManager_userpreferences_preferred_weather (id, userpreferences_id, weather_id) VALUES (1, '4f5af66040d844e68ecf2d2b54f1ef5e', 6);
INSERT INTO UserManager_userpreferences_preferred_weather (id, userpreferences_id, weather_id) VALUES (2, '4f5af66040d844e68ecf2d2b54f1ef5e', 7);
INSERT INTO UserManager_userpreferences_preferred_weather (id, userpreferences_id, weather_id) VALUES (3, '702269c2a0e0409ea80c27d6358d622b', 6);
INSERT INTO UserManager_userpreferences_preferred_weather (id, userpreferences_id, weather_id) VALUES (4, '702269c2a0e0409ea80c27d6358d622b', 7);

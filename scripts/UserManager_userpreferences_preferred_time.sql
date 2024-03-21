create table UserManager_userpreferences_preferred_time
(
    id                 integer  not null
        primary key autoincrement,
    userpreferences_id char(32) not null
        references UserManager_userpreferences
            deferrable initially deferred,
    timeofday_id       bigint   not null
        references RecommendationManager_timeofday
            deferrable initially deferred
);

create index UserManager_userpreferences_preferred_time_timeofday_id_3645db95
    on UserManager_userpreferences_preferred_time (timeofday_id);

create index UserManager_userpreferences_preferred_time_userpreferences_id_27fecf38
    on UserManager_userpreferences_preferred_time (userpreferences_id);

create unique index UserManager_userpreferences_preferred_time_userpreferences_id_timeofday_id_b3d10128_uniq
    on UserManager_userpreferences_preferred_time (userpreferences_id, timeofday_id);

INSERT INTO UserManager_userpreferences_preferred_time (id, userpreferences_id, timeofday_id) VALUES (1, '4f5af66040d844e68ecf2d2b54f1ef5e', 1);
INSERT INTO UserManager_userpreferences_preferred_time (id, userpreferences_id, timeofday_id) VALUES (2, '4f5af66040d844e68ecf2d2b54f1ef5e', 4);
INSERT INTO UserManager_userpreferences_preferred_time (id, userpreferences_id, timeofday_id) VALUES (3, '702269c2a0e0409ea80c27d6358d622b', 1);
INSERT INTO UserManager_userpreferences_preferred_time (id, userpreferences_id, timeofday_id) VALUES (4, '702269c2a0e0409ea80c27d6358d622b', 4);

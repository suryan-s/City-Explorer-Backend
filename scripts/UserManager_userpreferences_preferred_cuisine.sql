create table UserManager_userpreferences_preferred_cuisine
(
    id                 integer  not null
        primary key autoincrement,
    userpreferences_id char(32) not null
        references UserManager_userpreferences
            deferrable initially deferred,
    cuisine_id         bigint   not null
        references RecommendationManager_cuisine
            deferrable initially deferred
);

create index UserManager_userpreferences_preferred_cuisine_cuisine_id_b8a492d0
    on UserManager_userpreferences_preferred_cuisine (cuisine_id);

create index UserManager_userpreferences_preferred_cuisine_userpreferences_id_3075b160
    on UserManager_userpreferences_preferred_cuisine (userpreferences_id);

create unique index UserManager_userpreferences_preferred_cuisine_userpreferences_id_cuisine_id_4a0951df_uniq
    on UserManager_userpreferences_preferred_cuisine (userpreferences_id, cuisine_id);

INSERT INTO UserManager_userpreferences_preferred_cuisine (id, userpreferences_id, cuisine_id) VALUES (1, '4f5af66040d844e68ecf2d2b54f1ef5e', 1);
INSERT INTO UserManager_userpreferences_preferred_cuisine (id, userpreferences_id, cuisine_id) VALUES (2, '4f5af66040d844e68ecf2d2b54f1ef5e', 4);
INSERT INTO UserManager_userpreferences_preferred_cuisine (id, userpreferences_id, cuisine_id) VALUES (3, '702269c2a0e0409ea80c27d6358d622b', 1);
INSERT INTO UserManager_userpreferences_preferred_cuisine (id, userpreferences_id, cuisine_id) VALUES (4, '702269c2a0e0409ea80c27d6358d622b', 4);

create table UserManager_userpreferences_preferred_entertainment
(
    id                 integer  not null
        primary key autoincrement,
    userpreferences_id char(32) not null
        references UserManager_userpreferences
            deferrable initially deferred,
    entertainment_id   bigint   not null
        references RecommendationManager_entertainment
            deferrable initially deferred
);

create index UserManager_userpreferences_preferred_entertainment_entertainment_id_36cdb081
    on UserManager_userpreferences_preferred_entertainment (entertainment_id);

create index UserManager_userpreferences_preferred_entertainment_userpreferences_id_d5c0c1c6
    on UserManager_userpreferences_preferred_entertainment (userpreferences_id);

create unique index UserManager_userpreferences_preferred_entertainment_userpreferences_id_entertainment_id_38b3f57b_uniq
    on UserManager_userpreferences_preferred_entertainment (userpreferences_id, entertainment_id);

INSERT INTO UserManager_userpreferences_preferred_entertainment (id, userpreferences_id, entertainment_id) VALUES (1, '4f5af66040d844e68ecf2d2b54f1ef5e', 1);
INSERT INTO UserManager_userpreferences_preferred_entertainment (id, userpreferences_id, entertainment_id) VALUES (2, '4f5af66040d844e68ecf2d2b54f1ef5e', 4);
INSERT INTO UserManager_userpreferences_preferred_entertainment (id, userpreferences_id, entertainment_id) VALUES (3, '702269c2a0e0409ea80c27d6358d622b', 1);
INSERT INTO UserManager_userpreferences_preferred_entertainment (id, userpreferences_id, entertainment_id) VALUES (4, '702269c2a0e0409ea80c27d6358d622b', 4);

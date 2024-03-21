create table UserManager_userpreferences_preferred_outdoor_activities
(
    id                 integer  not null
        primary key autoincrement,
    userpreferences_id char(32) not null
        references UserManager_userpreferences
            deferrable initially deferred,
    outdooractivity_id bigint   not null
        references RecommendationManager_outdooractivity
            deferrable initially deferred
);

create index UserManager_userpreferences_preferred_outdoor_activities_outdooractivity_id_6b745d49
    on UserManager_userpreferences_preferred_outdoor_activities (outdooractivity_id);

create index UserManager_userpreferences_preferred_outdoor_activities_userpreferences_id_21bd30dd
    on UserManager_userpreferences_preferred_outdoor_activities (userpreferences_id);

create unique index UserManager_userpreferences_preferred_outdoor_activities_userpreferences_id_outdooractivity_id_d05f5b3b_uniq
    on UserManager_userpreferences_preferred_outdoor_activities (userpreferences_id, outdooractivity_id);

INSERT INTO UserManager_userpreferences_preferred_outdoor_activities (id, userpreferences_id, outdooractivity_id) VALUES (1, '4f5af66040d844e68ecf2d2b54f1ef5e', 18);
INSERT INTO UserManager_userpreferences_preferred_outdoor_activities (id, userpreferences_id, outdooractivity_id) VALUES (2, '4f5af66040d844e68ecf2d2b54f1ef5e', 27);
INSERT INTO UserManager_userpreferences_preferred_outdoor_activities (id, userpreferences_id, outdooractivity_id) VALUES (3, '702269c2a0e0409ea80c27d6358d622b', 18);
INSERT INTO UserManager_userpreferences_preferred_outdoor_activities (id, userpreferences_id, outdooractivity_id) VALUES (4, '702269c2a0e0409ea80c27d6358d622b', 27);

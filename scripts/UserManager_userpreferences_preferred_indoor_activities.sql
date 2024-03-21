create table UserManager_userpreferences_preferred_indoor_activities
(
    id                 integer  not null
        primary key autoincrement,
    userpreferences_id char(32) not null
        references UserManager_userpreferences
            deferrable initially deferred,
    indooractivity_id  bigint   not null
        references RecommendationManager_indooractivity
            deferrable initially deferred
);

create index UserManager_userpreferences_preferred_indoor_activities_indooractivity_id_f43bc8f0
    on UserManager_userpreferences_preferred_indoor_activities (indooractivity_id);

create index UserManager_userpreferences_preferred_indoor_activities_userpreferences_id_8cd6d0dc
    on UserManager_userpreferences_preferred_indoor_activities (userpreferences_id);

create unique index UserManager_userpreferences_preferred_indoor_activities_userpreferences_id_indooractivity_id_8ad1bd87_uniq
    on UserManager_userpreferences_preferred_indoor_activities (userpreferences_id, indooractivity_id);

INSERT INTO UserManager_userpreferences_preferred_indoor_activities (id, userpreferences_id, indooractivity_id) VALUES (1, '4f5af66040d844e68ecf2d2b54f1ef5e', 1);
INSERT INTO UserManager_userpreferences_preferred_indoor_activities (id, userpreferences_id, indooractivity_id) VALUES (2, '4f5af66040d844e68ecf2d2b54f1ef5e', 2);
INSERT INTO UserManager_userpreferences_preferred_indoor_activities (id, userpreferences_id, indooractivity_id) VALUES (3, '702269c2a0e0409ea80c27d6358d622b', 1);
INSERT INTO UserManager_userpreferences_preferred_indoor_activities (id, userpreferences_id, indooractivity_id) VALUES (4, '702269c2a0e0409ea80c27d6358d622b', 2);

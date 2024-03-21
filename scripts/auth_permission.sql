create table auth_permission
(
    id              integer      not null
        primary key autoincrement,
    content_type_id integer      not null
        references django_content_type
            deferrable initially deferred,
    codename        varchar(100) not null,
    name            varchar(255) not null
);

create index auth_permission_content_type_id_2f476e4b
    on auth_permission (content_type_id);

create unique index auth_permission_content_type_id_codename_01ab375a_uniq
    on auth_permission (content_type_id, codename);

INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (1, 1, 'add_logentry', 'Can add log entry');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (2, 1, 'change_logentry', 'Can change log entry');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (3, 1, 'delete_logentry', 'Can delete log entry');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (4, 1, 'view_logentry', 'Can view log entry');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (5, 2, 'add_permission', 'Can add permission');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (6, 2, 'change_permission', 'Can change permission');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (7, 2, 'delete_permission', 'Can delete permission');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (8, 2, 'view_permission', 'Can view permission');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (9, 3, 'add_group', 'Can add group');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (10, 3, 'change_group', 'Can change group');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (11, 3, 'delete_group', 'Can delete group');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (12, 3, 'view_group', 'Can view group');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (13, 4, 'add_contenttype', 'Can add content type');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (14, 4, 'change_contenttype', 'Can change content type');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (15, 4, 'delete_contenttype', 'Can delete content type');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (16, 4, 'view_contenttype', 'Can view content type');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (17, 5, 'add_session', 'Can add session');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (18, 5, 'change_session', 'Can change session');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (19, 5, 'delete_session', 'Can delete session');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (20, 5, 'view_session', 'Can view session');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (21, 6, 'add_blacklistedtoken', 'Can add blacklisted token');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (22, 6, 'change_blacklistedtoken', 'Can change blacklisted token');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (23, 6, 'delete_blacklistedtoken', 'Can delete blacklisted token');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (24, 6, 'view_blacklistedtoken', 'Can view blacklisted token');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (25, 7, 'add_outstandingtoken', 'Can add outstanding token');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (26, 7, 'change_outstandingtoken', 'Can change outstanding token');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (27, 7, 'delete_outstandingtoken', 'Can delete outstanding token');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (28, 7, 'view_outstandingtoken', 'Can view outstanding token');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (29, 8, 'add_userprofile', 'Can add user');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (30, 8, 'change_userprofile', 'Can change user');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (31, 8, 'delete_userprofile', 'Can delete user');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (32, 8, 'view_userprofile', 'Can view user');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (33, 9, 'add_userrecommendationhistory', 'Can add user recommendation history');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (34, 9, 'change_userrecommendationhistory', 'Can change user recommendation history');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (35, 9, 'delete_userrecommendationhistory', 'Can delete user recommendation history');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (36, 9, 'view_userrecommendationhistory', 'Can view user recommendation history');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (37, 10, 'add_userpreferences', 'Can add user preferences');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (38, 10, 'change_userpreferences', 'Can change user preferences');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (39, 10, 'delete_userpreferences', 'Can delete user preferences');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (40, 10, 'view_userpreferences', 'Can view user preferences');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (41, 11, 'add_weather', 'Can add weather');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (42, 11, 'change_weather', 'Can change weather');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (43, 11, 'delete_weather', 'Can delete weather');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (44, 11, 'view_weather', 'Can view weather');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (45, 12, 'add_entertainment', 'Can add entertainment');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (46, 12, 'change_entertainment', 'Can change entertainment');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (47, 12, 'delete_entertainment', 'Can delete entertainment');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (48, 12, 'view_entertainment', 'Can view entertainment');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (49, 13, 'add_timeofday', 'Can add time of day');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (50, 13, 'change_timeofday', 'Can change time of day');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (51, 13, 'delete_timeofday', 'Can delete time of day');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (52, 13, 'view_timeofday', 'Can view time of day');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (53, 14, 'add_cuisine', 'Can add cuisine');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (54, 14, 'change_cuisine', 'Can change cuisine');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (55, 14, 'delete_cuisine', 'Can delete cuisine');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (56, 14, 'view_cuisine', 'Can view cuisine');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (57, 15, 'add_weathercode', 'Can add weather code');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (58, 15, 'change_weathercode', 'Can change weather code');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (59, 15, 'delete_weathercode', 'Can delete weather code');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (60, 15, 'view_weathercode', 'Can view weather code');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (61, 16, 'add_indooractivity', 'Can add indoor activity');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (62, 16, 'change_indooractivity', 'Can change indoor activity');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (63, 16, 'delete_indooractivity', 'Can delete indoor activity');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (64, 16, 'view_indooractivity', 'Can view indoor activity');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (65, 17, 'add_outdooractivity', 'Can add outdoor activity');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (66, 17, 'change_outdooractivity', 'Can change outdoor activity');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (67, 17, 'delete_outdooractivity', 'Can delete outdoor activity');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (68, 17, 'view_outdooractivity', 'Can view outdoor activity');

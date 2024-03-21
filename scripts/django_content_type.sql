create table django_content_type
(
    id        integer      not null
        primary key autoincrement,
    app_label varchar(100) not null,
    model     varchar(100) not null
);

create unique index django_content_type_app_label_model_76bd3d3b_uniq
    on django_content_type (app_label, model);

INSERT INTO django_content_type (id, app_label, model) VALUES (1, 'admin', 'logentry');
INSERT INTO django_content_type (id, app_label, model) VALUES (2, 'auth', 'permission');
INSERT INTO django_content_type (id, app_label, model) VALUES (3, 'auth', 'group');
INSERT INTO django_content_type (id, app_label, model) VALUES (4, 'contenttypes', 'contenttype');
INSERT INTO django_content_type (id, app_label, model) VALUES (5, 'sessions', 'session');
INSERT INTO django_content_type (id, app_label, model) VALUES (6, 'token_blacklist', 'blacklistedtoken');
INSERT INTO django_content_type (id, app_label, model) VALUES (7, 'token_blacklist', 'outstandingtoken');
INSERT INTO django_content_type (id, app_label, model) VALUES (8, 'AuthManager', 'userprofile');
INSERT INTO django_content_type (id, app_label, model) VALUES (9, 'UserManager', 'userrecommendationhistory');
INSERT INTO django_content_type (id, app_label, model) VALUES (10, 'UserManager', 'userpreferences');
INSERT INTO django_content_type (id, app_label, model) VALUES (11, 'RecommendationManager', 'weather');
INSERT INTO django_content_type (id, app_label, model) VALUES (12, 'RecommendationManager', 'entertainment');
INSERT INTO django_content_type (id, app_label, model) VALUES (13, 'RecommendationManager', 'timeofday');
INSERT INTO django_content_type (id, app_label, model) VALUES (14, 'RecommendationManager', 'cuisine');
INSERT INTO django_content_type (id, app_label, model) VALUES (15, 'WeatherDatamanager', 'weathercode');
INSERT INTO django_content_type (id, app_label, model) VALUES (16, 'RecommendationManager', 'indooractivity');
INSERT INTO django_content_type (id, app_label, model) VALUES (17, 'RecommendationManager', 'outdooractivity');

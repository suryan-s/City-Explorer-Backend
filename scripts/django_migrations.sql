create table django_migrations
(
    id      integer      not null
        primary key autoincrement,
    app     varchar(255) not null,
    name    varchar(255) not null,
    applied datetime     not null
);

INSERT INTO django_migrations (id, app, name, applied) VALUES (1, 'contenttypes', '0001_initial', '2024-03-21 11:09:20.746899');
INSERT INTO django_migrations (id, app, name, applied) VALUES (2, 'contenttypes', '0002_remove_content_type_name', '2024-03-21 11:09:20.752063');
INSERT INTO django_migrations (id, app, name, applied) VALUES (3, 'auth', '0001_initial', '2024-03-21 11:09:20.760823');
INSERT INTO django_migrations (id, app, name, applied) VALUES (4, 'auth', '0002_alter_permission_name_max_length', '2024-03-21 11:09:20.765214');
INSERT INTO django_migrations (id, app, name, applied) VALUES (5, 'auth', '0003_alter_user_email_max_length', '2024-03-21 11:09:20.769701');
INSERT INTO django_migrations (id, app, name, applied) VALUES (6, 'auth', '0004_alter_user_username_opts', '2024-03-21 11:09:20.772919');
INSERT INTO django_migrations (id, app, name, applied) VALUES (7, 'auth', '0005_alter_user_last_login_null', '2024-03-21 11:09:20.776123');
INSERT INTO django_migrations (id, app, name, applied) VALUES (8, 'auth', '0006_require_contenttypes_0002', '2024-03-21 11:09:20.777456');
INSERT INTO django_migrations (id, app, name, applied) VALUES (9, 'auth', '0007_alter_validators_add_error_messages', '2024-03-21 11:09:20.780540');
INSERT INTO django_migrations (id, app, name, applied) VALUES (10, 'auth', '0008_alter_user_username_max_length', '2024-03-21 11:09:20.783795');
INSERT INTO django_migrations (id, app, name, applied) VALUES (11, 'auth', '0009_alter_user_last_name_max_length', '2024-03-21 11:09:20.786875');
INSERT INTO django_migrations (id, app, name, applied) VALUES (12, 'auth', '0010_alter_group_name_max_length', '2024-03-21 11:09:20.790885');
INSERT INTO django_migrations (id, app, name, applied) VALUES (13, 'auth', '0011_update_proxy_permissions', '2024-03-21 11:09:20.794215');
INSERT INTO django_migrations (id, app, name, applied) VALUES (14, 'auth', '0012_alter_user_first_name_max_length', '2024-03-21 11:09:20.797426');
INSERT INTO django_migrations (id, app, name, applied) VALUES (15, 'AuthManager', '0001_initial', '2024-03-21 11:09:20.804130');
INSERT INTO django_migrations (id, app, name, applied) VALUES (16, 'admin', '0001_initial', '2024-03-21 11:09:20.810794');
INSERT INTO django_migrations (id, app, name, applied) VALUES (17, 'admin', '0002_logentry_remove_auto_add', '2024-03-21 11:09:20.816562');
INSERT INTO django_migrations (id, app, name, applied) VALUES (18, 'admin', '0003_logentry_add_action_flag_choices', '2024-03-21 11:09:20.821024');
INSERT INTO django_migrations (id, app, name, applied) VALUES (19, 'sessions', '0001_initial', '2024-03-21 11:09:20.824148');
INSERT INTO django_migrations (id, app, name, applied) VALUES (20, 'token_blacklist', '0001_initial', '2024-03-21 11:09:20.834291');
INSERT INTO django_migrations (id, app, name, applied) VALUES (21, 'token_blacklist', '0002_outstandingtoken_jti_hex', '2024-03-21 11:09:20.839697');
INSERT INTO django_migrations (id, app, name, applied) VALUES (22, 'token_blacklist', '0003_auto_20171017_2007', '2024-03-21 11:09:20.846752');
INSERT INTO django_migrations (id, app, name, applied) VALUES (23, 'token_blacklist', '0004_auto_20171017_2013', '2024-03-21 11:09:20.854127');
INSERT INTO django_migrations (id, app, name, applied) VALUES (24, 'token_blacklist', '0005_remove_outstandingtoken_jti', '2024-03-21 11:09:20.860515');
INSERT INTO django_migrations (id, app, name, applied) VALUES (25, 'token_blacklist', '0006_auto_20171017_2113', '2024-03-21 11:09:20.868833');
INSERT INTO django_migrations (id, app, name, applied) VALUES (26, 'token_blacklist', '0007_auto_20171017_2214', '2024-03-21 11:09:20.882542');
INSERT INTO django_migrations (id, app, name, applied) VALUES (27, 'token_blacklist', '0008_migrate_to_bigautofield', '2024-03-21 11:09:20.892300');
INSERT INTO django_migrations (id, app, name, applied) VALUES (28, 'token_blacklist', '0010_fix_migrate_to_bigautofield', '2024-03-21 11:09:20.903355');
INSERT INTO django_migrations (id, app, name, applied) VALUES (29, 'token_blacklist', '0011_linearizes_history', '2024-03-21 11:09:20.904702');
INSERT INTO django_migrations (id, app, name, applied) VALUES (30, 'token_blacklist', '0012_alter_outstandingtoken_user', '2024-03-21 11:09:20.910135');
INSERT INTO django_migrations (id, app, name, applied) VALUES (31, 'RecommendationManager', '0001_initial', '2024-03-21 12:23:03.745260');
INSERT INTO django_migrations (id, app, name, applied) VALUES (32, 'UserManager', '0001_initial', '2024-03-21 12:23:03.765059');
INSERT INTO django_migrations (id, app, name, applied) VALUES (33, 'WeatherDatamanager', '0001_initial', '2024-03-21 15:56:07.888460');
INSERT INTO django_migrations (id, app, name, applied) VALUES (34, 'WeatherDatamanager', '0002_alter_weathercode_code', '2024-03-21 15:57:12.465489');
INSERT INTO django_migrations (id, app, name, applied) VALUES (35, 'WeatherDatamanager', '0003_delete_weathercode', '2024-03-21 16:07:11.119177');
INSERT INTO django_migrations (id, app, name, applied) VALUES (36, 'RecommendationManager', '0002_alter_cuisine_id_alter_entertainment_id_and_more', '2024-03-21 16:36:17.678152');
INSERT INTO django_migrations (id, app, name, applied) VALUES (37, 'RecommendationManager', '0003_indooractivity_outdooractivity', '2024-03-21 17:19:25.311603');
INSERT INTO django_migrations (id, app, name, applied) VALUES (38, 'UserManager', '0002_remove_userpreferences_preferred_indoor_activities_and_more', '2024-03-21 17:19:25.348825');
INSERT INTO django_migrations (id, app, name, applied) VALUES (39, 'UserManager', '0003_alter_userpreferences_preferred_location', '2024-03-21 17:20:55.270310');
INSERT INTO django_migrations (id, app, name, applied) VALUES (40, 'RecommendationManager', '0004_alter_indooractivity_description', '2024-03-21 17:31:08.434714');
INSERT INTO django_migrations (id, app, name, applied) VALUES (41, 'RecommendationManager', '0005_alter_outdooractivity_description', '2024-03-21 17:42:36.090877');

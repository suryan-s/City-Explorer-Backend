create table AuthManager_userprofile_user_permissions
(
    id             integer  not null
        primary key autoincrement,
    userprofile_id char(32) not null
        references AuthManager_userprofile
            deferrable initially deferred,
    permission_id  integer  not null
        references auth_permission
            deferrable initially deferred
);

create index AuthManager_userprofile_user_permissions_permission_id_191b5a48
    on AuthManager_userprofile_user_permissions (permission_id);

create index AuthManager_userprofile_user_permissions_userprofile_id_f93d9c7c
    on AuthManager_userprofile_user_permissions (userprofile_id);

create unique index AuthManager_userprofile_user_permissions_userprofile_id_permission_id_49a225f1_uniq
    on AuthManager_userprofile_user_permissions (userprofile_id, permission_id);


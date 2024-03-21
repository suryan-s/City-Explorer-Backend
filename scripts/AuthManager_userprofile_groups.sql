create table AuthManager_userprofile_groups
(
    id             integer  not null
        primary key autoincrement,
    userprofile_id char(32) not null
        references AuthManager_userprofile
            deferrable initially deferred,
    group_id       integer  not null
        references auth_group
            deferrable initially deferred
);

create index AuthManager_userprofile_groups_group_id_b38bd943
    on AuthManager_userprofile_groups (group_id);

create index AuthManager_userprofile_groups_userprofile_id_81a2e4a5
    on AuthManager_userprofile_groups (userprofile_id);

create unique index AuthManager_userprofile_groups_userprofile_id_group_id_c5d7c14a_uniq
    on AuthManager_userprofile_groups (userprofile_id, group_id);


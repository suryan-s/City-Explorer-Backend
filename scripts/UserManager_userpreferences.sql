create table UserManager_userpreferences
(
    id                 char(32)     not null
        primary key,
    updated_at         datetime     not null,
    created_at         datetime     not null,
    user_id            char(32)     not null
        unique
        references AuthManager_userprofile
            deferrable initially deferred,
    preferred_location varchar(255) not null
);

INSERT INTO UserManager_userpreferences (id, updated_at, created_at, user_id, preferred_location) VALUES ('4f5af66040d844e68ecf2d2b54f1ef5e', '2024-03-21 17:59:08.614768', '2024-03-21 17:59:08.614817', '827f1c621cf14fbf83ff40be61e3b4ec', 'Trivandrum, Kollam');
INSERT INTO UserManager_userpreferences (id, updated_at, created_at, user_id, preferred_location) VALUES ('702269c2a0e0409ea80c27d6358d622b', '2024-03-21 19:52:17.922943', '2024-03-21 19:52:17.923293', '0f414ddd5fe548899d9f3f3bd63d2415', 'Trivandrum, Kollam');

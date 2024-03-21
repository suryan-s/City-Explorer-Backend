create table token_blacklist_blacklistedtoken
(
    blacklisted_at datetime not null,
    token_id       bigint   not null
        unique
        references token_blacklist_outstandingtoken
            deferrable initially deferred,
    id             integer  not null
        primary key autoincrement
);

INSERT INTO token_blacklist_blacklistedtoken (blacklisted_at, token_id, id) VALUES ('2024-03-21 11:27:35.026913', 1, 1);

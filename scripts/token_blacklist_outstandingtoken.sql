create table token_blacklist_outstandingtoken
(
    token      text         not null,
    created_at datetime,
    expires_at datetime     not null,
    user_id    char(32)
        references AuthManager_userprofile
            deferrable initially deferred,
    jti        varchar(255) not null
        unique,
    id         integer      not null
        primary key autoincrement
);

create index token_blacklist_outstandingtoken_user_id_83bc629a
    on token_blacklist_outstandingtoken (user_id);

INSERT INTO token_blacklist_outstandingtoken (token, created_at, expires_at, user_id, jti, id) VALUES ('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcxMTYyNTI0OCwiaWF0IjoxNzExMDIwNDQ4LCJqdGkiOiI1NDQ5ZWQzOTUzYjI0NmVjYTU3MDY4NDhlNTI2OTczNiIsInVzZXJfaWQiOiJlMjY1MDRmOC04NDhlLTQwYWUtYTYzNS1iNWU3YjI0NmYwZjgifQ.k9QnYmH6GmYs76SmK8kTYfB9a9sm6xiENgrkIzqG2WI', '2024-03-21 11:27:28.542355', '2024-03-28 11:27:28', null, '5449ed3953b246eca5706848e5269736', 1);
INSERT INTO token_blacklist_outstandingtoken (token, created_at, expires_at, user_id, jti, id) VALUES ('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcxMTYzMDQ1NywiaWF0IjoxNzExMDI1NjU3LCJqdGkiOiI4OTFhMGEzYjQ0YTM0YzhkYWJjMGNiOThjOWMzZTA2YiIsInVzZXJfaWQiOiJlMjY1MDRmOC04NDhlLTQwYWUtYTYzNS1iNWU3YjI0NmYwZjgifQ.5fm5Qczb-VjbB6Lzs4TfAYcnq9VPu4qMaKcHkwh5TEU', '2024-03-21 12:54:17.035199', '2024-03-28 12:54:17', null, '891a0a3b44a34c8dabc0cb98c9c3e06b', 2);
INSERT INTO token_blacklist_outstandingtoken (token, created_at, expires_at, user_id, jti, id) VALUES ('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcxMTYzMTAyMCwiaWF0IjoxNzExMDI2MjIwLCJqdGkiOiI5Mjc3YmZiMmVjODM0Y2ZjODUyODYyNjhkNzI1MDQ4MiIsInVzZXJfaWQiOiI2Y2U0MzgwZC03YWMxLTQwYjItODEwOC0yODZiNDBkM2QyN2IifQ.VtGrU1RYP2n5AhOSw2DdPQASe1eXqDxmiu70_EXfx7w', '2024-03-21 13:03:40.320103', '2024-03-28 13:03:40', null, '9277bfb2ec834cfc85286268d7250482', 3);
INSERT INTO token_blacklist_outstandingtoken (token, created_at, expires_at, user_id, jti, id) VALUES ('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcxMTYzMjY2NSwiaWF0IjoxNzExMDI3ODY1LCJqdGkiOiJlMTkxODIxZjhlNjQ0YWM0YTcyYmFmODQwYzhiYjgxMCIsInVzZXJfaWQiOiI4MjdmMWM2Mi0xY2YxLTRmYmYtODNmZi00MGJlNjFlM2I0ZWMifQ.BT60zzCKrhYcpXiGxFRZOYoezu9RT_fo2Iz6ir9oA9A', '2024-03-21 13:31:05.484853', '2024-03-28 13:31:05', '827f1c621cf14fbf83ff40be61e3b4ec', 'e191821f8e644ac4a72baf840c8bb810', 4);
INSERT INTO token_blacklist_outstandingtoken (token, created_at, expires_at, user_id, jti, id) VALUES ('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcxMTY1MzgwMSwiaWF0IjoxNzExMDQ5MDAxLCJqdGkiOiJmM2VhOTBkN2QyZDA0YTdlYTdmN2JmYTY3NmEzNWY2NyIsInVzZXJfaWQiOiIwZjQxNGRkZC01ZmU1LTQ4ODktOWQ5Zi0zZjNiZDYzZDI0MTUifQ.GxDWwTCfD2rTcRYMduqH61lEooHbrNzXHGV2Hn-OCCY', '2024-03-21 19:23:21.997277', '2024-03-28 19:23:21', '0f414ddd5fe548899d9f3f3bd63d2415', 'f3ea90d7d2d04a7ea7f7bfa676a35f67', 5);

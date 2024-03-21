create table UserManager_userrecommendationhistory
(
    id             char(32) not null
        primary key,
    recommendation text     not null,
    created_at     datetime not null,
    updated_at     datetime not null,
    user_id        char(32) not null
        references AuthManager_userprofile
            deferrable initially deferred,
    check ((JSON_VALID("recommendation") OR "recommendation" IS NULL))
);

create index UserManager_userrecommendationhistory_user_id_aafe3c13
    on UserManager_userrecommendationhistory (user_id);

INSERT INTO UserManager_userrecommendationhistory (id, recommendation, created_at, updated_at, user_id) VALUES ('b9e0bdb3f32a483288444f823c27f703', '{"preferred": ["Hiking or trekking in nature trails", "Gardening or tending to a community garden"], "suggested": ["Playing sports such as soccer, basketball, or tennis in outdoor courts", "Birdwatching in bird sanctuaries or nature reserves", "Cycling or mountain biking"]}', '2024-03-21 19:35:57.323447', '2024-03-21 19:35:57.323576', '827f1c621cf14fbf83ff40be61e3b4ec');
INSERT INTO UserManager_userrecommendationhistory (id, recommendation, created_at, updated_at, user_id) VALUES ('acffef3d47d5435dbd0be623fb4aa659', '{"preferred": ["Yoga", "Meditation"], "suggested": ["Relaxing with a cup of tea or coffee", "Exercise or workout routines", "Doing puzzles or brain teasers"]}', '2024-03-21 20:07:06.112769', '2024-03-21 20:07:06.113365', '0f414ddd5fe548899d9f3f3bd63d2415');
INSERT INTO UserManager_userrecommendationhistory (id, recommendation, created_at, updated_at, user_id) VALUES ('2b826f670e2b47e2981a1731b3048c4e', '{"Mode": "Indoor", "preferred": ["Yoga", "Meditation"], "suggested": ["Building with LEGO or other building sets", "Organizing and decluttering home spaces", "Taking online courses or workshops"]}', '2024-03-21 20:08:30.504085', '2024-03-21 20:08:30.504318', '0f414ddd5fe548899d9f3f3bd63d2415');

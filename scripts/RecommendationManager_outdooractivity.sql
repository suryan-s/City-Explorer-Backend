create table RecommendationManager_outdooractivity
(
    id          integer      not null
        primary key autoincrement,
    name        varchar(255) not null,
    description text         not null,
    created_at  datetime     not null,
    updated_at  datetime     not null
);

INSERT INTO RecommendationManager_outdooractivity (id, name, created_at, updated_at, description) VALUES (18, 'Hiking or trekking in nature trails', '1711062858000', '1711062859000', null);
INSERT INTO RecommendationManager_outdooractivity (id, name, created_at, updated_at, description) VALUES (19, 'Cycling or mountain biking', '1711062983000', '1711063008000', null);
INSERT INTO RecommendationManager_outdooractivity (id, name, created_at, updated_at, description) VALUES (20, 'Picnicking in parks or nature reserves', '1711062985000', '1711063009000', null);
INSERT INTO RecommendationManager_outdooractivity (id, name, created_at, updated_at, description) VALUES (21, 'Jogging or running in scenic routes', '1711062986000', '1711063011000', null);
INSERT INTO RecommendationManager_outdooractivity (id, name, created_at, updated_at, description) VALUES (22, 'Playing sports such as soccer, basketball, or tennis in outdoor courts', '1711062987000', '1711063012000', null);
INSERT INTO RecommendationManager_outdooractivity (id, name, created_at, updated_at, description) VALUES (23, 'Birdwatching in bird sanctuaries or nature reserves', '1711062988000', '1711063014000', null);
INSERT INTO RecommendationManager_outdooractivity (id, name, created_at, updated_at, description) VALUES (24, 'Fishing in lakes, rivers, or ponds', '1711062990000', '1711063015000', null);
INSERT INTO RecommendationManager_outdooractivity (id, name, created_at, updated_at, description) VALUES (25, 'Camping in campgrounds or wilderness areas', '1711062991000', '1711063016000', null);
INSERT INTO RecommendationManager_outdooractivity (id, name, created_at, updated_at, description) VALUES (26, 'Kayaking or canoeing in rivers or lakes', '1711062992000', '1711063018000', null);
INSERT INTO RecommendationManager_outdooractivity (id, name, created_at, updated_at, description) VALUES (27, 'Gardening or tending to a community garden', '1711062993000', '1711063020000', null);
INSERT INTO RecommendationManager_outdooractivity (id, name, created_at, updated_at, description) VALUES (28, 'Taking a leisurely walk or stroll in botanical gardens or arboretums', '1711062995000', '1711063021000', null);
INSERT INTO RecommendationManager_outdooractivity (id, name, created_at, updated_at, description) VALUES (29, 'Playing with pets or walking dogs in dog parks', '1711062996000', '1711063023000', null);
INSERT INTO RecommendationManager_outdooractivity (id, name, created_at, updated_at, description) VALUES (30, 'Geocaching or treasure hunting in outdoor locations', '1711062998000', '1711063025000', null);
INSERT INTO RecommendationManager_outdooractivity (id, name, created_at, updated_at, description) VALUES (31, 'Photography outings to capture natural landscapes or wildlife', '1711062999000', '1711063026000', null);
INSERT INTO RecommendationManager_outdooractivity (id, name, created_at, updated_at, description) VALUES (32, 'Outdoor yoga or meditation sessions in parks or gardens', '1711063000000', '1711063027000', null);
INSERT INTO RecommendationManager_outdooractivity (id, name, created_at, updated_at, description) VALUES (33, 'Swimming in lakes, rivers, or public pools', '1711063004000', '1711063029000', null);
INSERT INTO RecommendationManager_outdooractivity (id, name, created_at, updated_at, description) VALUES (34, 'Volunteering for environmental cleanup or conservation projects', '1711063005000', '1711063030000', null);
INSERT INTO RecommendationManager_outdooractivity (id, name, created_at, updated_at, description) VALUES (35, 'Participating in outdoor events such as festivals, markets, or concerts in open-air venues', '1711063007000', '1711063031000', null);

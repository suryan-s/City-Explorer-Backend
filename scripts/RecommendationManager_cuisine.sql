create table RecommendationManager_cuisine
(
    id          integer      not null
        primary key autoincrement,
    name        varchar(255) not null,
    description text         not null,
    created_at  datetime     not null,
    updated_at  datetime     not null
);

INSERT INTO RecommendationManager_cuisine (id, name, description, created_at, updated_at) VALUES (1, 'Italian', 'Authentic Italian cuisine', '2024-03-21 17:03:10.336074', '2024-03-21 17:03:10.336095');
INSERT INTO RecommendationManager_cuisine (id, name, description, created_at, updated_at) VALUES (2, 'Mexican', 'Spicy and flavorful Mexican dishes', '2024-03-21 17:03:21.564228', '2024-03-21 17:03:21.564247');
INSERT INTO RecommendationManager_cuisine (id, name, description, created_at, updated_at) VALUES (3, 'Japanese', 'Traditional Japanese cuisine', '2024-03-21 17:03:38.476831', '2024-03-21 17:03:38.476854');
INSERT INTO RecommendationManager_cuisine (id, name, description, created_at, updated_at) VALUES (4, 'Indian', 'Rich and diverse Indian dishes', '2024-03-21 17:03:48.243222', '2024-03-21 17:03:48.243249');
INSERT INTO RecommendationManager_cuisine (id, name, description, created_at, updated_at) VALUES (5, 'French', 'Elegant French cuisine', '2024-03-21 17:03:58.930466', '2024-03-21 17:03:58.930484');

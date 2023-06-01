-- Active: 1685623283408@@127.0.0.1@3306
CREATE TABLE users(
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL,
    role TEXT NOT NULL,
    created_at TEXT DEFAULT (DATETIME()) NOT NULL
);
INSERT INTO users (id, name, email, password, role)
VALUES
  -- tipo NORMAL e senha = fulano@123F
	('u001', 'Fulano', 'fulano@email.com', '$2a$12$QHO/.I7IAvj5IsutyMcb0.Yl6uNPDe7Zu4Tlmx6ejbexEbxRStvrG', 'NORMAL'),

  -- tipo NORMAL e senha = beltrana@123B
	('u002', 'Beltrana', 'beltrana@email.com', '$2a$12$IIzuE06Er1qQkxXf0o/B0uKloukjHfe2LMaI6a7uyEGTOWzaPeLka', 'NORMAL'),

  -- tipo ADMIN e senha = astrodev@123A
	('u003', 'Astrodev', 'astrodev@email.com', '$2a$12$7sJ6DONL9koZKXhmUEveQO71IwmZgLlYNZhCJm60bQB6luxKBCh82', 'ADMIN');

SELECT * FROM users;

CREATE TABLE posts(
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    creator_id TEXT NOT NULL,
    content TEXT NOT NULL,
    likes INTEGER DEFAULT (0) NOT NULL,
    dislikes INTEGER DEFAULT (0) NOT NULL,
    created_at TEXT DEFAULT (DATETIME()) NOT NULL,
    updated_at TEXT DEFAULT (DATETIME()) NOT NULL,
    FOREIGN KEY (creator_id) REFERENCES users(id)
        ON DELETE CASCADE 
        ON UPDATE CASCADE
);

INSERT into posts(id, creator_id, content)
VALUES
    ("p001", "u001", "A vida é bela"),
    ("p002", "u002", "Palmeiras não tem mundial! kkkk"),
    ("p003", "u002", "ET telefone minha casa"),
    ("p004", "u003", "Tô de boa");

SELECT * FROM posts;

CREATE TABLE likes_dislikes(
    user_id TEXT NOT NULL,
    post_id TEXT NOT NULL,
    like INTEGER NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id)
        ON DELETE CASCADE 
        ON UPDATE CASCADE,
    FOREIGN KEY (post_id) REFERENCES posts(id)
        ON DELETE CASCADE 
        ON UPDATE CASCADE
);

SELECT * FROM likes_dislikes;

INSERT INTO likes_dislikes(user_id, post_id, like)
VALUES
    ("u003", "p001", 1),
    ("u001", "p002", 1),
    ("u002", "p003", 1),
    ("u002", "p004", 1),
    ("u002", "p001", 1);

UPDATE posts
SET likes = 2
WHERE id = "p001";

UPDATE posts
SET likes = 1
WHERE id = "p002";

UPDATE posts
SET likes = 1
WHERE id = "p003";

UPDATE posts
SET likes = 1
WHERE id = "p004";


--Queries de deleção
DROP TABLE likes_dislikes;

DROP TABLE posts;

DROP TABLE users;
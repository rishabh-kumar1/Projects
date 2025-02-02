PRAGMA foreign_keys = ON;

CREATE TABLE users(
  username VARCHAR(20) NOT NULL,
  fullname VARCHAR(40) NOT NULL,
  email VARCHAR(40) NOT NULL,
  filename VARCHAR(64) NOT NULL,
  password VARCHAR(256) NOT NULL,
  created datetime default CURRENT_TIMESTAMP,
  PRIMARY KEY(username)
);

CREATE TABLE posts(
  postid integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  filename VARCHAR(64) NOT NULL,
  owner VARCHAR(20) NOT NULL,
  created datetime default CURRENT_TIMESTAMP,
  FOREIGN KEY(owner) REFERENCES users(username) ON DELETE CASCADE
);

CREATE TABLE following(
  username1 VARCHAR(20) NOT NULL,
  username2 VARCHAR(20) NOT NULL,
  created datetime default CURRENT_TIMESTAMP,
  FOREIGN KEY(username1) REFERENCES users(username) ON DELETE CASCADE,
  FOREIGN KEY(username2) REFERENCES users(username) ON DELETE CASCADE,
  PRIMARY KEY(username1, username2)
);

CREATE TABLE comments(
  commentid integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  owner VARCHAR(20) NOT NULL,
  postid integer NOT NULL,
  text VARCHAR(1024) NOT NULL,
  created datetime default CURRENT_TIMESTAMP,
  FOREIGN KEY(owner) REFERENCES users(username) ON DELETE CASCADE,
  FOREIGN KEY(postid) REFERENCES posts(postid) ON DELETE CASCADE
);

CREATE TABLE likes(
  likeid integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  owner VARCHAR(20) NOT NULL,
  postid integer NOT NULL,
  created datetime default CURRENT_TIMESTAMP,
  FOREIGN KEY(owner) REFERENCES users(username) ON DELETE CASCADE,
  FOREIGN KEY(postid) REFERENCES posts(postid) ON DELETE CASCADE
);



create table if not exists users(
  id INTEGER NOT NULL PRIMARY KEY,
  name VARCHAR,
  hash VARCHAR,
  token VARCHAR,
  created DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated DATETIME DEFAULT CURRENT_TIMESTAMP
);


create table if not exists tags(
  id INTEGER NOT NULL PRIMARY KEY,
  name VARCHAR UNIQUE,
  created DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated DATETIME DEFAULT CURRENT_TIMESTAMP
);


create table if not exists prompts(
  id INTEGER NOT NULL PRIMARY KEY,
  name VARCHAR,
  description VARCHAR,
  author VARCHAR,
  repository VARCHAR UNIQUE,
  version VARCHAR,
  license VARCHAR,
  created DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated DATETIME DEFAULT CURRENT_TIMESTAMP
);


create table if not exists prompt_tags(
  id INTEGER NOT NULL PRIMARY KEY,
  prompt_id INTEGER,
  tag_id INTEGER,
  created DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(prompt_id) REFERENCES prompts(id),
  FOREIGN KEY(tag_id) REFERENCES tags(id)
);


create table if not exists prompt_dependencies(
  id INTEGER NOT NULL PRIMARY KEY,
  prompt_id INTEGER,
  dep_id INTEGER,
  created DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(prompt_id) REFERENCES prompts(id),
  FOREIGN KEY(dep_id) REFERENCES prompts(id)
);

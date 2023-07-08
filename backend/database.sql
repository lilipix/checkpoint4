CREATE TABLE user (
  id INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  firstname VARCHAR(50) NOT NULL,
  lastname VARCHAR(50) NOT NULL,
  email VARCHAR(255) UNIQUE NOT NULL,
  hashedPassword VARCHAR(255) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE types (
  id INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  title VARCHAR(50) NOT NULL,
  user_id INT NOT NULL,
  CONSTRAINT fk_types_user
  FOREIGN KEY (user_id)
  REFERENCES user(id)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE category (
  id INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  title VARCHAR(50) NOT NULL,
  user_id INT NOT NULL,
  CONSTRAINT fk_category_user
  FOREIGN KEY (user_id)
  REFERENCES user(id)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE color (
  id INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  color VARCHAR(20)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE note (
  id INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  title VARCHAR(255) NOT NULL,
  content TEXT,
  modification_date DATE NOT NULL,
  user_id INT NOT NULL,
  CONSTRAINT fk_note_user
  FOREIGN KEY (user_id)
  REFERENCES user(id),
  color_id INT NOT NULL,
  CONSTRAINT fk_note_color
  FOREIGN KEY (color_id)
  REFERENCES color(id),
  types_id INT NOT NULL,
  CONSTRAINT fk_note_types
  FOREIGN KEY (types_id)
  REFERENCES types(id),
  category_id INT NOT NULL,
  CONSTRAINT fk_note_category
  FOREIGN KEY (category_id)
  REFERENCES category(id)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;


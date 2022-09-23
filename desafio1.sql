DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE IF NOT EXISTS SpotifyClone;

CREATE TABLE SpotifyClone.plans(
    id_plan INT PRIMARY KEY AUTO_INCREMENT,
    description_plan VARCHAR(100) NOT NULL,
    price_plan DECIMAL(5,2) NOT NULL
) engine = InnoDB;

CREATE TABLE SpotifyClone.users(
    id_user INT PRIMARY KEY AUTO_INCREMENT,
    name_user VARCHAR(100) NOT NULL,
    age_user INT NOT NULL,
    subscription_date DATE NOT NULL,
    id_plan INT NOT NULL,
    FOREIGN KEY (id_plan) REFERENCES plans(id_plan)
) engine = InnoDB;

CREATE TABLE SpotifyClone.artists(
    id_artist INT PRIMARY KEY AUTO_INCREMENT,
    name_artist VARCHAR(100) NOT NULL
) engine = InnoDB;

CREATE TABLE SpotifyClone.albums(
    id_album INT PRIMARY KEY AUTO_INCREMENT,
    title_album VARCHAR(100) NOT NULL,
    release_date YEAR(4) NOT NULL,
    id_artist INT NOT NULL,
    FOREIGN KEY (id_artist) REFERENCES artists(id_artist)
) engine = InnoDB;

CREATE TABLE SpotifyClone.songs(
    id_song INT PRIMARY KEY AUTO_INCREMENT,
    title_song VARCHAR(100) NOT NULL,
    length_song INT NOT NULL,
    id_album INT NOT NULL,
    FOREIGN KEY (id_album) REFERENCES albums(id_album)
) engine = InnoDB;

CREATE TABLE SpotifyClone.history(
    id_user INT NOT NULL,
    id_song INT NOT NULL,
    played_in DATETIME NOT NULL,
    PRIMARY KEY (id_user, id_song),
    FOREIGN KEY (id_user) REFERENCES users(id_user),
    FOREIGN KEY (id_song) REFERENCES songs(id_song)
) engine = InnoDB;

CREATE TABLE SpotifyClone.following(
    id_user INT NOT NULL,
    id_artist INT NOT NULL,
    PRIMARY KEY (id_user, id_artist),
    FOREIGN KEY (id_user) REFERENCES users(id_user),
    FOREIGN KEY (id_artist) REFERENCES artists(id_artist)
) engine = InnoDB;

INSERT INTO SpotifyClone.plans (description_plan, price_plan)
VALUES
  ('gratuito', 0),
  ('familiar', 7.99),
  ('universitário', 5.99),
  ('pessoal', 6.99);

INSERT INTO SpotifyClone.users (name_user, age_user, subscription_date, id_plan)
VALUES
  ('Barbara Liskov', 82, DATE '2019-10-20', 1),
  ('Robert Cecil Martin', 58, DATE '2017-01-06', 1),
  ('Ada Lovelace', 37, DATE '2017-01-06', 2),
  ('Martin Fowler', 46, DATE '2017-01-17', 2),
  ('Sandi Metz', 58, DATE '2018-04-29', 2),
  ('Paulo Freire', 19, DATE '2018-02-14', 3),
  ('Bell Hooks', 26, DATE '2018-01-05', 3),
  ('Christopher Alexander', 85, DATE '2019-06-05', 4),
  ('Judith Butler', 45, DATE '2020-05-13', 4),
  ('Jorge Amado', 58, DATE '2017-02-17', 4);

INSERT INTO SpotifyClone.artists (name_artist)
VALUES
  ('Beyoncé'),
  ('Queen'),
  ('Elis Regina'),
  ('Baco Exu do Blues'),
  ('Blind Guardian'),
  ('Nina Simone');

INSERT INTO SpotifyClone.albums (title_album, release_date, id_artist)
VALUES
  ('Renaissance', 2022, 1),
  ('Jazz', 1978, 2),
  ('Hot Space', 1982, 2),
  ('Falso Brilhante', 1998, 3),
  ('Vento de Maio', 2001, 3),
  ('QVVJFA?', 2003, 4),
  ('Somewhere Far Beyond', 2007, 5),
  ('I Put A Spell On You', 2012, 6);

INSERT INTO SpotifyClone.songs (title_song, length_song, id_album)
VALUES
  ('BREAK MY SOUL', 279, 1),
  ("VIRGO'S GROOVE", 369, 1),
  ('ALIEN SUPERSTAR', 116, 1),
  ("Don't Stop Me Now", 203, 2),
  ('Under Pressure', 152, 3),
  ('Como Nossos Pais', 105, 4),
  ('O Medo de Amar é o Medo de Ser Livre', 207, 5),
  ('Samba em Paris', 267, 6),
  ("The Bard's song", 244, 7),
  ('Feeling Good', 100, 8);

INSERT INTO SpotifyClone.history (id_user, id_song, played_in)
VALUES
  (1, 8, '2022-02-28 10:45:55'),
  (1, 2, '2020-05-02 05:30:35'),
  (1, 10, '2020-03-06 11:22:33'),
  (2, 10, '2022-08-05 08:05:17'),
  (2, 7, '2020-01-02 07:40:33'),
  (3, 10, '2020-11-13 16:55:13'),
  (3, 2, '2020-12-05 18:38:30'),
  (4, 8, '2021-08-15 17:10:10'),
  (5, 8, '2022-01-09 01:44:33'),
  (5, 5, '2020-08-06 15:23:43'),
  (6, 7, '2017-01-24 00:31:17'),
  (6, 1, '2017-10-12 12:35:20'),
  (7, 4, '2011-12-15 22:30:49'),
  (8, 4, '2012-03-17 14:56:41'),
  (9, 9, '2022-02-24 21:14:22'),
  (10, 3, '2015-12-13 08:30:22');

INSERT INTO SpotifyClone.following (id_user, id_artist)
VALUES
  (1, 1),
  (1, 2),
  (1, 3),
  (2, 1),
  (2, 3),
  (3, 2),
  (4, 4),
  (5, 5),
  (5, 6),
  (6, 6),
  (6, 1),
  (7, 6),
  (9, 3),
  (10, 2);
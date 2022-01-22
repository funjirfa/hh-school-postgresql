DROP DATABASE IF EXISTS headhunter;
CREATE DATABASE headhunter;

CREATE TABLE specialization (
    spec_id     SERIAL       NOT NULL,
    title       VARCHAR(30)  NOT NULL,
    description VARCHAR(255),
    PRIMARY KEY (spec_id)
);
CREATE TABLE area (
    area_id INT         NOT NULL,
    name    VARCHAR(50) NOT NULL,
    PRIMARY KEY (area_id)
);
CREATE TABLE vacancy (
    vacancy_id        SERIAL       NOT NULL,
    title             VARCHAR(50)  NOT NULL,
    compensation_from INT,
    compensation_to   INT,
    created_at        DATE         NOT NULL DEFAULT NOW(),
    description       VARCHAR(255),
    area_id           INT          NOT NULL,
    spec_id           INT          NOT NULL,
    deleted           BOOLEAN      NOT NULL DEFAULT FALSE,
    PRIMARY KEY (vacancy_id),
    FOREIGN KEY (area_id) REFERENCES area(area_id),
    FOREIGN KEY (spec_id) REFERENCES specialization(spec_id)
);
CREATE TABLE cv (
    cv_id      SERIAL       NOT NULL,
    name       VARCHAR(100) NOT NULL,
    title      VARCHAR(50)  NOT NULL,
    skills     VARCHAR(255) NOT NULL,
    area_id    INT          NOT NULL,
    spec_id    INT          NOT NULL,
    created_at DATE         NOT NULL DEFAULT NOW(),
    deleted    BOOLEAN      NOT NULL DEFAULT FALSE,
    PRIMARY KEY (cv_id),
    FOREIGN KEY (area_id) REFERENCES area(area_id),
    FOREIGN KEY (spec_id) REFERENCES specialization(spec_id)
);
CREATE TABLE reply (
    reply_id   SERIAL NOT NULL,
    vacancy_id INT    NOT NULL,
    cv_id      INT    NOT NULL,
    created_at DATE   NOT NULL DEFAULT NOW(),
    PRIMARY KEY (reply_id),
    FOREIGN KEY (vacancy_id) REFERENCES vacancy(vacancy_id),
    FOREIGN KEY (cv_id)      REFERENCES cv(cv_id)
);

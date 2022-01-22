CREATE INDEX compensation_index ON vacancy (compensation_from, compensation_to);
CREATE INDEX vacancy_created_index on vacancy (created_at);
CREATE INDEX reply_created_index on reply (created_at);

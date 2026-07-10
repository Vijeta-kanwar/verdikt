CREATE EXTENSION IF NOT EXISTS "pgcrypto";

CREATE TABLE users (
    id            UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    username      VARCHAR(30)  NOT NULL UNIQUE,
    email         VARCHAR(255) NOT NULL UNIQUE,
    password_hash TEXT         NOT NULL,
    role          VARCHAR(10)  NOT NULL DEFAULT 'USER'
                  CHECK (role IN ('USER', 'ADMIN')),
    created_at    TIMESTAMPTZ  NOT NULL DEFAULT now()
);

CREATE TABLE problems (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    slug            VARCHAR(100) NOT NULL UNIQUE,
    title           VARCHAR(200) NOT NULL,
    statement_md    TEXT         NOT NULL,
    difficulty      VARCHAR(10)  NOT NULL
                    CHECK (difficulty IN ('EASY', 'MEDIUM', 'HARD')),
    time_limit_ms   INT          NOT NULL DEFAULT 2000,
    memory_limit_mb INT          NOT NULL DEFAULT 256,
    created_at      TIMESTAMPTZ  NOT NULL DEFAULT now()
);

CREATE TABLE test_cases (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    problem_id      UUID NOT NULL REFERENCES problems(id) ON DELETE CASCADE,
    ordinal         INT  NOT NULL,
    input           TEXT NOT NULL,
    expected_output TEXT NOT NULL,
    is_sample       BOOLEAN NOT NULL DEFAULT FALSE,
    UNIQUE (problem_id, ordinal)
);

CREATE TABLE submissions (
    id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id     UUID NOT NULL REFERENCES users(id),
    problem_id  UUID NOT NULL REFERENCES problems(id),
    language    VARCHAR(20) NOT NULL DEFAULT 'PYTHON',
    source_code TEXT        NOT NULL,
    status      VARCHAR(10) NOT NULL DEFAULT 'QUEUED'
                CHECK (status IN ('QUEUED','RUNNING','AC','WA','TLE','RE','IE')),
    runtime_ms  INT,
    created_at  TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX idx_submissions_user    ON submissions (user_id, created_at DESC);
CREATE INDEX idx_submissions_problem ON submissions (problem_id, status);

CREATE TABLE submission_results (
    submission_id UUID NOT NULL REFERENCES submissions(id) ON DELETE CASCADE,
    test_case_id  UUID NOT NULL REFERENCES test_cases(id),
    verdict       VARCHAR(10) NOT NULL,
    runtime_ms    INT,
    PRIMARY KEY (submission_id, test_case_id)
);
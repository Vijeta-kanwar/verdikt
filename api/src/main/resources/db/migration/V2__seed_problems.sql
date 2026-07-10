INSERT INTO problems (slug, title, statement_md, difficulty) VALUES
('sum-two-numbers', 'Sum of Two Numbers',
 E'## Sum of Two Numbers\n\nRead two integers from input (one per line) and print their sum.\n\n**Sample input:**\n```\n3\n5\n```\n**Sample output:**\n```\n8\n```', 'EASY');

INSERT INTO test_cases (problem_id, ordinal, input, expected_output, is_sample)
SELECT id, 1, E'3\n5', '8', TRUE  FROM problems WHERE slug = 'sum-two-numbers';
INSERT INTO test_cases (problem_id, ordinal, input, expected_output, is_sample)
SELECT id, 2, E'100\n-250', '-150', FALSE FROM problems WHERE slug = 'sum-two-numbers';
INSERT INTO test_cases (problem_id, ordinal, input, expected_output, is_sample)
SELECT id, 3, E'0\n0', '0', FALSE FROM problems WHERE slug = 'sum-two-numbers';

INSERT INTO problems (slug, title, statement_md, difficulty)
VALUES
(
    'reverse-string',
    'Reverse String',
    E'## Reverse String\n\nRead a string from input and print its reverse.\n\n### Input\nA single string.\n\n### Output\nPrint the reversed string.',
    'EASY'
);

INSERT INTO test_cases (problem_id, ordinal, input, expected_output, is_sample)
SELECT id, 1, E'hello', 'olleh', TRUE
FROM problems
WHERE slug = 'reverse-string';

INSERT INTO test_cases (problem_id, ordinal, input, expected_output, is_sample)
SELECT id, 2, E'OpenAI', 'IAnepO', FALSE
FROM problems
WHERE slug = 'reverse-string';

INSERT INTO test_cases (problem_id, ordinal, input, expected_output, is_sample)
SELECT id, 3, E'a', 'a', FALSE
FROM problems
WHERE slug = 'reverse-string';


INSERT INTO problems (slug, title, statement_md, difficulty)
VALUES
(
    'fibonacci',
    'Fibonacci',
    E'## Fibonacci\n\nRead an integer n and print the nth Fibonacci number.\n\nAssume:\n- fib(1) = 1\n- fib(2) = 1\n\n### Input\nA single integer n.\n\n### Output\nPrint the nth Fibonacci number.',
    'EASY'
);

INSERT INTO test_cases (problem_id, ordinal, input, expected_output, is_sample)
SELECT id, 1, E'5', '5', TRUE
FROM problems
WHERE slug = 'fibonacci';

INSERT INTO test_cases (problem_id, ordinal, input, expected_output, is_sample)
SELECT id, 2, E'1', '1', FALSE
FROM problems
WHERE slug = 'fibonacci';

INSERT INTO test_cases (problem_id, ordinal, input, expected_output, is_sample)
SELECT id, 3, E'10', '55', FALSE
FROM problems
WHERE slug = 'fibonacci';
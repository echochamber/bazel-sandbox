-- psql -d rssandbox
------------------------------------------------------------

INSERT INTO movies (title, release_date)
VALUES
    ('Die hard', DATE '1988-07-22'),
    ('Predator', DATE 'June 12, 1987')
ON CONFLICT (title) DO NOTHING;

INSERT INTO characters(firstn, lastn, movie_id)
VALUES
    ('John', 'McClane', 1),
    ('Dutch', NULL, 2)
ON CONFLICT (firstn) DO NOTHING;

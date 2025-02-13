WITH UserRatingCount AS (
    SELECT u.name, COUNT(*) AS rating_count
    FROM MovieRating mr
    JOIN Users u ON mr.user_id = u.user_id
    GROUP BY u.name
    ORDER BY rating_count DESC, u.name ASC
    LIMIT 1
),
MovieAverageRating AS (
    SELECT m.title, AVG(mr.rating) AS avg_rating
    FROM MovieRating mr
    JOIN Movies m ON mr.movie_id = m.movie_id
    WHERE mr.created_at BETWEEN '2020-02-01' AND '2020-02-29'
    GROUP BY m.title
    ORDER BY avg_rating DESC, m.title ASC
    LIMIT 1
)
SELECT name AS results FROM UserRatingCount
UNION ALL
SELECT title AS results FROM MovieAverageRating;

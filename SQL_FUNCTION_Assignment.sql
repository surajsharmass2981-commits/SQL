SQL Functions Assignment.

Q1. Create a ranking of students based on score (highest first).

SELECT
    name,
    score,
    RANK() OVER (ORDER BY score DESC) AS student_rank
FROM
    Student_Performance
ORDER BY
    student_rank;
    
    
    
Q2. Show each student's score and the previous student’s score (based on score order).
    
SELECT
    name,
    score,
    LAG(score, 1, 0) OVER (ORDER BY score DESC) AS previous_score
FROM
    Student_Performance
ORDER BY
    score DESC;
    
    
    
Q3. Convert all student names to uppercase and extract the month name from join_date.

SELECT
    UPPER(name) AS uppercase_name,
    join_date,
    MONTHNAME(join_date) AS join_month_name
FROM
    Student_Performance;



Q4. Show each student's name and the next student’s attendance (ordered by attendance).

SELECT
    name,
    attendance,
    LEAD(attendance, 1, 0) OVER (ORDER BY attendance DESC) AS next_student_attendance
FROM
    Student_Performance
ORDER BY
    attendance DESC;



Q5. Assign students into 4 performance groups using NTILE().

SELECT
    name,
    score,
    NTILE(4) OVER (ORDER BY score DESC) AS performance_group
FROM
    Student_Performance
ORDER BY
    score DESC;
    
    
    
Q6. For each course, assign a row number based on attendance (highest first).

SELECT
    name,
    course,
    attendance,
    ROW_NUMBER() OVER (PARTITION BY course ORDER BY attendance DESC) AS course_attendance_rank
FROM
    Student_Performance
ORDER BY
    course, attendance DESC;



Q7. Calculate the number of days each student has been enrolled (from join_date to today).

(Assume current date = '2025-01-01')

SELECT
    name,
    join_date,
    DATEDIFF('2025-01-01', join_date) AS days_enrolled
FROM
    Student_Performance;



Q8. Format join_date as “Month Year” (e.g., “June 2023”).

SELECT
    name,
    join_date,
    DATE_FORMAT(join_date, '%M %Y') AS formatted_join_date
FROM
    Student_Performance;



Q9.  Replace the city ‘Mumbai’ with ‘MUM’ for display purposes.

SELECT
    name,
    city,
    REPLACE(city, 'Mumbai', 'MUM') AS display_city
FROM
    Student_Performance;



Q10.  For each course, find the highest score using FIRST_VALUE().

SELECT
    name,
    course,
    score,
    FIRST_VALUE(score) OVER (PARTITION BY course ORDER BY score DESC) AS highest_course_score
FROM
    Student_Performance
ORDER BY
    course, score DESC;
    
    
    -- END OF FILE


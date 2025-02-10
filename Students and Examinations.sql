SELECT 
    st.student_id, 
    st.student_name, 
    sb.subject_name, 
    IFNULL(COUNT(e.subject_name),0) AS attended_exams
FROM Students st
JOIN Subjects sb
LEFT JOIN Examinations e 
ON st.student_id = e.student_id AND sb.subject_name = e.subject_name
GROUP BY st.student_id, st.student_name, sb.subject_name
ORDER BY st.student_id, sb.subject_name;

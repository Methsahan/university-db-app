package com.example.university_db_app.repository;

import com.example.university_db_app.model.Enrollment;
import com.example.university_db_app.dto.CourseEnrollmentCount;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface EnrollmentRepository
        extends JpaRepository<Enrollment, Long> {

    List<Enrollment> findByStudent_StudentCode(String studentCode);

    List<Enrollment> findByCourse_Code(String courseCode);

    List<Enrollment> findByGrade(String grade);

    List<Enrollment> findByGradeIn(List<String> grades);

    List<Enrollment> findByStudent_StudentCodeAndGrade(
            String studentCode, String grade);

    long countByCourse_Code(String courseCode);

    @Query("""
        SELECT c.code AS courseCode,
               c.title AS title,
               COUNT(e.student.id) AS studentCount
        FROM Enrollment e
        JOIN e.course c
        GROUP BY c.code, c.title
        ORDER BY c.code
    """)
    List<CourseEnrollmentCount> countStudentsPerCourse();
}
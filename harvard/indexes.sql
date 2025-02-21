-- database: harvard.db
CREATE INDEX student_id_enrollments ON enrollments(student_id);
CREATE INDEX course_id_enrollments ON enrollments(course_id);
CREATE INDEX department_courses ON courses(department);
CREATE INDEX number_courses ON courses(number);
CREATE INDEX semester_courses ON courses(semester);
CREATE INDEX course_id_satisfies ON satisfies(course_id);
CREATE INDEX requirement_id_satisfies ON satisfies(requirement_id);

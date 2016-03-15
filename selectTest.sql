select stuNo,stuname
from student
where stuClass='软件2班'
	and stuSex='女';

select stuNo,stuname
from student
where stuDateJoined<'2002-1-1';

select stuNo,stuname
from student
where stuAge<'19'
	or stuSex='女';

select corName
from Course
where preCorNo is null;

select stuNo,stuName,sutDept
from student
where sutDept!='会计学'
	and sutDept!='电子学';

select max(score) as topScore
from Score
where corNo='C801';

select stuSex as sex, count(stuNo) as count, avg(stuAge) as averageAge
from student
group by(stuSex);


select studentCourse.stuNo, count(studentCourse.stuNo) as courseCount
from (select student.stuNo
		from student,Score
		where student.stuNo=Score.stuNo)
		as studentCourse
group by studentCourse.stuNo
having count(studentCourse.stuNo)>='1';


select stuNo, stuName
from student
where stuClass in (select stuClass
					from student
					where stuName='沈香娜');


select selectedCourseStudent.stuAge, count(selectedCourseStudent.stuNo) as studentCount
from (select stuAge, student.stuNo
		from student, Score
		where student.stuNo=Score.stuNo
		) as selectedCourseStudent
group by selectedCourseStudent.stuAge;


select StudentAverageScore.stuNo,StudentAverageScore.averageScore as topAverageScore
from (select ScoreWithCredit.stuNo, sum(score*corCredit+0.00)/sum(corCredit) as averageScore
		from (select stuNo, score, corCredit
				from Course, Score
				where Course.corNo=Score.corNo
				)as ScoreWithCredit
		group by ScoreWithCredit.stuNo
		)as StudentAverageScore;
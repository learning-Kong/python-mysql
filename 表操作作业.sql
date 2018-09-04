CREATE TABLE class (
	cid int primary key auto_increment,
	caption varchar(32) not null
)ENGINE=innodb default charset=utf8;

create TABLE teacher(
	tid int PRIMARY KEY auto_increment,
	tname varchar(32) not null
)engine=innodb default charset=utf8;

CREATE TABLE student(
	sid int not null auto_increment,
	sname varchar(32) not null,
	gender enum('male','female') not null default 'male',
	class_id int not NULL,
	PRIMARY key (`sid`),
	CONSTRAINT `student_clss_id` foreign key (class_id) references `class`(cid)
)engine=innodb default charset=utf8;

CREATE TABLE course (
	cid int not null auto_increment,
	cname varchar(32) not null,
	teacher_id int not null,
	PRIMARY key (`cid`),
	constraint `course_teacher_id` foreign key (teacher_id) REFERENCES `teacher`(tid)
)engine=innodb default charset=utf8;

create TABLE score(
	sid int not null auto_increment,
	student_id int not null,
	corse_id int not null,
	number int,
	PRIMARY KEY (`sid`),
	constraint `score_student_id` foreign key (student_id) REFERENCES `student`(sid),
	constraint `score_corse_id` FOREIGN key (corse_id) REFERENCES `course`(cid)
)engine=innodb default charset=utf8;

insert into class (caption) values('三年级二班'),('一年级三班'),('三年级一班');
select * from class;
INSERT into student (sname,gender,class_id) values ('钢蛋','female',1),('铁锤','female',1),('山炮','male',2);
select * from student;
INSERT INTO teacher (tname) VALUES('波多'),('苍空'),('饭岛');
SELECT * from teacher;
INSERT into course (cname,teacher_id) values('生物',1),('体育',1),('物理',2);
SELECT * from course;
INSERT into score (student_id,corse_id,number) VALUES (1,1,60),(1,2,59),(2,2,100);
SELECT * from score;
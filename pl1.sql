/* drop procedure if exists pro1;
delimiter $
create procedure pro1()
BEGIN
	SELECT "Hello";
end $
delimiter ; */


/*drop procedure if exists addUser;
delimiter $
create procedure addUser(in username varchar(20),in password varchar(20),in email varchar(20))
BEGIN
	INSERT into login values(username,password,email) values(username,password,email);
end $
delimiter ;*/



/*drop procedure if EXISTS checkUser;
delimiter $
create procedure checkUser(in emailID varchar(20))
BEGIN
declare flag bool;
select true into flag from login where email=emailID;
select flag;

IF flag THEN 
	SELECT username,password from login where email=email;
ELSE
	INSERT INTO LOG(curr_date,curr_time,message) values(CURDATE(),CURTIME(),"Email not found!");
	SELECT * FROM log;
END IF;

end $
delimiter ;*/



/*drop procedure if EXISTS getQualification;
delimiter $
create procedure getQualification(in identityy int)
BEGIN
DECLARE flag bool;
SELECT true into flag from student where id=identityy;

IF flag THEN
    select * from student s join student_qualifications sq on s.id=sq.studentID where s.id=identityy;
ELSE
    select "Student not found";
END IF;

end $
delimiter ;*/
	
	
/* drop procedure if exists addStudent;
delimiter $
create procedure addStudent(in i_d int,in firstname varchar(45),in DO_B varchar(45),in EmailID varchar(45),in IDD int,in contact int,in active bool,in IDDD int, in addr varchar(45))
BEGIN 

INSERT INTO VALUES(62223,firstname,DO_B,EmailID);
INSERT INTO VALUES(DD,contact,active);
INSERT INTO VALUES(i_d,IDDD,addr);

end $
delimiter ; */ 


/*drop procedure if exists addQualification;
delimiter $
create procedure addQualification( I_D int, _name varchar(20), _college varchar(30), _uni varchar(30), _marks varchar(10), _year int)
BEGIN

DECLARE flag bool;
DECLARE q_max_count int ;
SELECT true into flag from student where id=I_D;
set q_max_count:= (select max(id) from student_qualifications) + 1;

IF flag THEN
   insert into student_qualifications(id,studentID,name,college,university,marks,year)VALUES(q_max_count, I_D, _name, _college, _uni, _marks, _year);
   SELECT "Record Inserted";
   
   ELSE
   SELECT "Student Not Found !";
end if;

end $
delimiter ;/*
	
      
	  
/*

delimiter $
create procedure addStudent(in i_d int,in firstname varchar(45),in DO_B varchar(45),in EmailID varchar(45),in IDD int,in contact int,in active bool,in IDDD int, in addr varchar(45))
BEGIN 

INSERT INTO VALUES(62223,firstname,DO_B,EmailID);
INSERT INTO VALUES(DD,contact,active);
INSERT INTO VALUES(i_d,IDDD,addr);

end $
delimiter ; */



/*drop procedure if exists addStudent;
delimiter $
create procedure addStudent(_id int, _saID int,_spID int,_namefirst varchar(20),_namelast varchar(20),_DOB date,_emailID varchar(20),_address varchar(20),_number varchar(20), _isActive bool)
BEGIN 
    insert into student values(_id,_namefirst,_namelast,_DOB,_emailID);
    insert into student_address values(_saID,_id,_address);
    insert into student_phone values(_spID,_id,_number,_isActive);
END $
delimiter ; */

/*drop Procedure if EXISTS sepChar;
DELIMITER $
create Procedure sepChar(s varchar(70))
BEGIN
    DECLARE ch varchar(1);
    DECLARE count int;
    set count:=1;
        L1 : LOOP
            if count <= length(s) THEN
                set ch:= substring(s,count,1);
                select ch;
                set count:=count+1;
            ELSE
                leave L1;
            end if;
        end LOOP L1;
end $
DELIMITER ;



drop Procedure if EXISTS sepChar;
DELIMITER $
create Procedure sepChar(s varchar(70))
BEGIN
    DECLARE _str varchar(70);
    DECLARE ch varchar(1);
    DECLARE count int;
    set count:=1;
    set _str := "";
    set _str := concat(_str,substring(s,count,1));
        L1 : LOOP
            if count < length(s) THEN
                set count:=count+1;
                set ch:= substring(s,count,1);
                set _str = concat(_str,",",ch);
            ELSE
                leave L1;
            end if;
        end LOOP L1;
    select _str;
end $
DELIMITER*/ 


/* drop PROCEDURE IF EXISTS alphanum;
delimiter $
CREATE PROCEDURE alphanum(s varchar(50))
BEGIN
	DECLARE ch varchar(1);
	DECLARE count int;
	DECLARE _alpha varchar(50);
	DECLARE _num varchar(50);
	set count :=1;
	set _alpha := "";
	set _num := "";
	
	l1:LOOP
		IF count <= length(s) THEN
			set ch :=substring(s,count,1);
			set count := count+1;
			IF ASCII(ch) >= (48) AND ASCII(ch) <= (57) THEN
				set _num :=concat(_num,ch);
			else
				set _alpha := concat(_alpha,ch);
			end if;
		ELSE 
			leave l1;
		end if;
	end LOOP l1;
	select _alpha,_num;
end $
delimiter ;   */

/* drop PROCEDURE IF EXISTS uplow;
delimiter $
create PROCEDURE uplow(s varchar(50))
BEGIN
	DECLARE ch varchar(1);
	DECLARE _count int;
	DECLARE _upper varchar(30);
	DECLARE _lower varchar(30);
	set _count := 1;
	set _upper := "";
	set _lower := "";
	l1:LOOP
		IF _count <= length(s) THEN
			set ch :=substring(s,_count,1);
			IF ASCII(ch) >= (65) AND ASCII(ch) <=(90) THEN
				set _upper := concat(_upper,ch);
			else IF ASCII(ch) >= (97) AND ASCII(ch) <=(122) THEN
				set _lower := concat(_lower,ch);
			end if;
			end if;
		ELSE 
			leave l1;
		end if;
		set _count := _count+1;
	end LOOP l1;
	select _upper,_lower;	
end $
delimiter ; */

/* DROP PROCEDURE IF EXISTS vowelchar;
delimiter $
create PROCEDURE vowelchar(s varchar(40))
BEGIN
    DECLARE count int;
	DECLARE v_count int;
	DECLARE d_count int;
	DECLARE W_count int;
	DECLARE ch varchar(1);
	set v_count = 0;
	set d_count = 0;
	set w_count = 0;
	set count := 1;
	L1: LOOP
		if count <= length(s) THEN
			set ch = substring(s,count,1);
			if ch = 'a' or ch = 'e' or ch = 'i' or ch = 'o' or ch = 'u' THEN
				set v_count := v_count + 1;
			else if ASCII(ch) >= (48) and ASCII(ch) <= (57) THEN
				set d_count := d_count + 1;
			else if ch = ' ' THEN
				set w_count := w_count + 1;
			end if;
			end if;
			end if;
		ELSE
			leave L1;
		end if;
		set count := count +1;
	end LOOP L1;
	select v_count, d_count, w_count;
end $
delimiter ;

drop PROCEDURE if EXISTS sumdigit;
delimiter $
create procedure sumdigit(num int)
BEGIN
DECLARE _sum int;
DECLARE _rem int;
set _sum = 0;
set _rem = 0;
	L1 : LOOP
		if num != 0 THEN
			set _rem := num % 10;
			set _sum := _sum + _rem;
			set num := num / 10;
		else 
			leave L1;
		end if;
	end loop l1;
	select _sum;
end $
delimiter ; */

/*drop procedure IF EXISTS order_det;
delimiter $
create procedure order_det(_cnum int)
BEGIN
declare flag bool;
select TRUE into flag from customers where cnum=_cnum;
IF flag THEN
select * from customers c inner join orders o where c.cnum=o.cnum and c.cnum=_cnum;
ELSE 
select "Customer not found";
end if;
end $
delimiter ;*/


/*drop PROCEDURE IF EXISTS alpha;
delimiter $
create PROCEDURE alpha(s varchar(50))
BEGIN
	DECLARE ch varchar(1);
	DECLARE _count int;
	DECLARE _str varchar(30);

	set _count := 1;
	set _str := "";
	
	l1:LOOP
		IF _count <= length(s) THEN
			set ch :=substring(s,_count,1);
			IF ASCII(ch) >= (97) AND ASCII(ch) <=(122)  THEN
				set _str := concat(_str,ch);
		     end if;
		ELSE 
			leave l1;
		end if;
		set _count := _count+1;
	end LOOP l1;
	select _str;	
end $
delimiter ;*/

/* drop procedure if exists insertrow;
delimiter $
create procedure insertrow()
BEGIN
	DECLARE _count int;
	set _count:=0;
	L1:LOOP 
		set _count := _count + 1;
		if (_count <= 10) THEN
			IF (_count%2=0) THEN
				insert into P values(_count,"i is even");
			else
				insert into P values(_count,"i is odd");
			end if;
		else
			leave L1;
		end if;
	end LOOP L1;
end $
delimiter ; */
	
	
/*drop PROCEDURE IF EXISTS empjob;
delimiter $
create procedure empjob()
BEGIN
	DECLARE _count int;
	DECLARE _max int;
	DECLARE _namefirst varchar(30);
	DECLARE _job varchar(30);
	set _count := 1;
	set _max := (select count(emp) from emp);
	L1 : LOOP
		if _count <= _max THEN
			set _namefirst := (select ename from emp where empno = _count)
	
	*/
	
	
/* drop procedure if EXISTS numintowords;
delimiter $
CREATE PROCEDURE numintowords(num int)
BEGIN
	DECLARE _str varchar (500);
	DECLARE rem int;
	set rem := 0;
	set _str := "";
	L1 : LOOP
		if num!=0 THEN
			set rem := num%10;
			if rem = 0 THEN
				set _str := concat(_str," ","Zero");
			else if rem = 1 THEN
				set _str := concat(_str," ","One");
			else if rem = 2 THEN
				set _str := concat(_str," ","Two");
			else if rem = 3 THEN
				set _str := concat(_str," ","Three");
			else if rem = 4 THEN
				set _str := concat(_str," ","Four");
			else if rem = 5 THEN
				set _str := concat(_str," ","Five");
			else if rem = 6 THEN
				set _str := concat(_str," ","Six");
			else if rem = 7 THEN
				set _str := concat(_str," ","Seven");
			else if rem = 8 THEN
				set _str := concat(_str," ","Eight");
			else if rem = 9 THEN
				set _str := concat(_str," ","Nine");
			end if;
			end if;
			end if;
			end if;
			end if;
			end if;
			end if;
			end if;
			end if;
			end if;
			set num := num / 10;
		else 
			leave L1;
		end if;
	end LOOP L1;
	select _str;
end $
delimiter ; ....//////////////////////////// Incomplete */



/*drop procedure if exists sepemp;
delimiter $
create procedure sepemp()
BEGIN
DECLARE _empno int;
	L1:LOOP 
		
	end LOOP L1;
end $




Sql :
create table log(id int primary key auto_increment,curr_date varchar(20), curr_time  varchar(20),message varchar(20));

pl/sql:



         drop procedure if EXISTS checkUser;
delimiter $
create procedure checkUser(in emailID varchar(20))
BEGIN
declare flag bool;
select true into flag from login where email=emailID;
select flag;

IF flag THEN 
	SELECT username,password from login where email=email;
ELSE
	INSERT INTO LOG(curr_date,curr_time,message) values(CURDATE(),CURTIME(),"Email not found!");
	SELECT * FROM log;
END IF;

end $
delimiter ; */




/* drop procedure if EXISTS findemp;
delimiter $
create PROCEDURE findemp()
BEGIN 
	DECLARE  _SAL, x int;
	DECLARE _ENAME varchar(30);
	DECLARE c1 CURSOR for select * from (select dense_rank() over(order by sal desc ) R1, ename, sal from emp) e where R1 <= 5;
	open c1;
		L1 : LOOP
			fetch c1 into x, _ename, _SAL;
					select x, _ename, _SAL;
			
		end LOOP L1;
	close c1;
end $
delimiter ;   */




/* drop procedure if EXISTS date_weekday;
delimiter $
create procedure date_weekday(_date date, _day varchar(10))
BEGIN
declare temp int ; 
	set temp := dayofweek(_date);
	if _day = "Sunday" THEN  
		select Date_add(_date, INTERVAL (1-temp) DAY) Day_Output;
	else if _day = "Monday" THEN
		select Date_add(_date, INTERVAL (2-temp) DAY) Day_Output;
	else if _day = "Tuesday" THEN
		select Date_add(_date, INTERVAL (3-temp) DAY) Day_Output;
	else if _day = "Wednesday" THEN
		select Date_add(_date, INTERVAL (4-temp) DAY) Day_Output;
	else if _day = "Thursday" THEN
		select Date_add(_date, INTERVAL (5-temp) DAY) Day_Output;
	else if _day = "Friday" THEN
		select Date_add(_date, INTERVAL (6-temp) DAY) Day_Output;
	else if _day = "Saturday" THEN
		select Date_add(_date, INTERVAL (7-temp) DAY) Day_Output;
	end if;
	end if;
	end if;
	end if;
	end if;
	end if;
	end if;
end $
delimiter ; */

DROP PROCEDURE IF EXISTS vowelchar;
delimiter $
create PROCEDURE vowelchar(s varchar(40))
BEGIN
    DECLARE count int;
	DECLARE v_count int;
	DECLARE d_count int;
	DECLARE W_count int;
	DECLARE ch varchar(1);
	set v_count = 0;
	set d_count = 0;
	set w_count = 0;
	set count := 1;
	L1: LOOP
		if count <= length(s) THEN
			set ch = substring(s,count,1);
			if ch = 'a' or ch = 'e' or ch = 'i' or ch = 'o' or ch = 'u' THEN
				set v_count := v_count + 1;
			else if ASCII(ch) >= (48) and ASCII(ch) <= (57) THEN
				set d_count := d_count + 1;
			else if ch = ' ' THEN
				set w_count := w_count + 1;
			end if;
			end if;
			end if;
		ELSE
			leave L1;
		end if;
		set count := count +1;
	end LOOP L1;
	select v_count, d_count, w_count;
end $
delimiter ;

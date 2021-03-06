drop table tb_sam_budget;
drop table tb_Sam_Budget_Category;
drop table tb_Sam_Loan_Debt;

drop table tb_sam_income_category
drop table tb_sam_expense_category
drop table tb_sam_expense
drop table tb_sam_income
drop table tb_sam_loan
drop table tb_sam_debt
drop table tb_Sam_Budget_Memo
tb_Sam_Budget_Memo
select * from tb_sam_income_category
select * from tb_sam_expense_category
select * from tb_sam_expense
select * from tb_sam_income
select * from tb_sam_loan
select * from tb_sam_debt

select * from tb_sam_user


select * from tb_sam_memo
tb_Sam_Budget_Memo

select * from tb_sam_user
14.32.66.123
insert into tb_sam_user (
	user_id,
	password
) values( 
	'김현영',
	'1234'
)

delete from tb_sam_memo


insert into tb_sam_loan ( 
				user_id,
				debtor,
				loan_content,
				loan_date,
				loan_amount
			) values ( 
				'김현영',
				'홍길동',
				'ㅋㅋ',
				'2017-04-10',
				1000
)

delete from tb_sam_expense
  where expense_no =38
  
  
update tb_sam_expense
  set user_id = '김현영'

  


create table tb_sam_income_category( 
	income_category_no 		int(6)	auto_increment primary key,
	income_category_name 	varchar(50) not null,
	User_Id				 	varchar(60),
	FOREIGN KEY(User_Id) REFERENCES tb_sam_user(User_Id)
)

create table tb_sam_expense_category( 
	expense_category_no  	int(6)	auto_increment primary key,
	expense_category_name   varchar(50) not null,	
	User_Id				 	varchar(60),
	FOREIGN KEY(User_Id) REFERENCES tb_sam_user(User_Id)
)

create table tb_sam_expense (
	expense_no 				int(6) auto_increment primary key,
	user_id	  				varchar(60) not null,
	expense_category_no 	int(2) not null,
	expense_content 	    varchar(1000) null,
	expense_amount 			int(6) not null,
	expense_date 			char(10) not null,
	FOREIGN KEY(expense_category_no) REFERENCES tb_sam_expense_category(expense_category_no),
	FOREIGN KEY(User_Id) REFERENCES tb_sam_user(User_Id)
)

create table tb_sam_income (
	income_no				 int(6) auto_increment primary key,
	user_id 				 varchar(60) not null,
	income_category_no		 int(2) not null,
	income_content 			 varchar(1000) null,
	income_amount 			 int(6) not null,
	income_date 			 char(10) not null,
	FOREIGN KEY(income_category_no) REFERENCES tb_sam_income_category(income_category_no),
	FOREIGN KEY(User_Id) REFERENCES tb_sam_user(User_Id)
)

create table tb_sam_loan (
	loan_no 				int(6) auto_increment primary key,
	User_Id 				varchar(60) not null,
	debtor 					varchar(60) not null,
	loan_content 			varchar(1000),
	loan_amount 			int(6) 	not null,
	loan_date 			 	char(10) not null,
	FOREIGN KEY(User_Id) REFERENCES tb_sam_user(User_Id)
)

create table tb_sam_debt (
	debt_no 				int(6) auto_increment primary key,
	User_Id			    	varchar(60) not null,
	money_lender		 	varchar(60) not null,
	debt_content 			varchar(1000) null,
	debt_amount				int(6)	 not null,
	debt_date			 	char(10) not null,
	FOREIGN KEY(User_Id) REFERENCES tb_sam_user(User_Id)
)

create table tb_sam_expense_plan (
	expense_plan_date char(7) primary key,
	expense_goal int(7) not null,
	user_id varchar(60) not null,
	plan_status char(1) not null,
	FOREIGN KEY(User_Id) REFERENCES tb_sam_user(User_Id)
)

select *
  from tb_sam_expense_plan



create table tb_Sam_Memo (
	Memo_No 		int(6) auto_increment		primary key,
	User_Id 		varchar(60)					not null,
	Pos_X 			int 						not null,
	Pos_Y 			int 						not null,
	Memo_Content 		varchar(2000) 				null,
	Reg_Date 		datetime 					default now(),
	FOREIGN KEY(User_Id) REFERENCES tb_Sam_User(User_Id)
);


select reg_date
  from tb_sam_chat_msg
  
  
  
		where user_id = '김현영'
		  and expense_plan_date = '2017-04'
  
delete 
  from tb_Sam_Memo
  

-- 데이터 --

update tb_sam_income_category set user_id = 'admin' where user_id is null
update tb_sam_expense_category set user_id = 'admin' where user_id is null

insert into tb_sam_income_category( income_category_name) 
values('급여')
insert into tb_sam_income_category( income_category_name) 
values('소득')
insert into tb_sam_income_category( income_category_name) 
values('수익')
insert into tb_sam_income_category( income_category_name) 
values('용돈')

insert into tb_sam_expense_category(expense_category_name) 
values('교통비')
insert into tb_sam_expense_category(expense_category_name) 
values('미용비')
insert into tb_sam_expense_category(expense_category_name) 
values('식비')
insert into tb_sam_expense_category(expense_category_name) 
values('의류비')
insert into tb_sam_expense_category(expense_category_name) 
values('통신비')
insert into tb_sam_expense_category(expense_category_name) 
values('기타')

update tb_sam_expense_category
  set user_id = 'admin'
  

 
select * from tb_Sam_Memo



-- alter 예시--

alter table tb_Sam_Budget
add column budget_code char(1) not null;

alter table tb_Sam_Memo
add column memo_height int not null;

alter table tb_Sam_Memo
drop memo_width


delete * 
from tb_Sam_Memo




---------------

		select * 
		  from tb_sam_expense_category
		where user_id = 'admin'
		   or user_id = 'admin'
		order by expense_category_no
		
select * from tb_board

		select 	income.income_no,
				income.user_id,  				
				inc.income_category_name, 	
				inc.income_category_no, 	
				income.income_content, 	    
				income.income_amount,
				income.income_date 			
			  from tb_sam_income income, tb_sam_income_category inc
			where  income.income_category_no = inc.income_category_no
			  and  income.user_id = '김현영'
			  and  income.income_date= '2017-04-04'
			  
select 	count(*) 			
			  from tb_sam_income income, tb_sam_income_category inc
			where income.income_category_no = income.income_category_no
			   and  income.user_id= '김현영'
			   and  income.income_date between STR_TO_DATE ('2017-04-02', '%Y-%m-%d') 
						  			    and STR_TO_DATE ('2017-04-08', '%Y-%m-%d')
			group by income.income_date
			order by income.income_date
		
			
			select * 
		  from tb_sam_expense_category
		where user_id = 'admin'
		   or user_id =  'admin'
		order by expense_category_no		
		
		
		
		
select exc.expense_category_name , sum(ex.expense_amount) eachSum
  from tb_sam_expense ex, tb_sam_expense_category exc
where ex.expense_category_no = exc.expense_category_no
  and ex.user_id = '김현영'
  and ex.expense_date between STR_TO_DATE ('2017-04-01', '%Y-%m-%d') 
						     and STR_TO_DATE ('2017-04-30', '%Y-%m-%d')
  and ex.expense_category_no = 3
  

select expense_category_no,expense_date 
  from tb_sam_expense
  
select expense_category_no,expense_category_no
  from tb_sam_expense
  
  

select expense_category_no,expense_date 
  from tb_sam_expense
where user_id = '김현영'
  and expense_date between STR_TO_DATE ('2017-04-01', '%Y-%m-%d') 
					   and STR_TO_DATE ('2017-04-30', '%Y-%m-%d')
  and ex.expense_category_no = 1



select exc.expense_category_name expenseCategoryName, sum(ex.expense_amount) eachSum
		  from tb_sam_expense ex, tb_sam_expense_category exc
		where ex.expense_category_no = exc.expense_category_no
		  and ex.user_id = '김현영'
		  and ex.expense_date between STR_TO_DATE ('2017-04-01', '%Y-%m-%d') 
								     and STR_TO_DATE ('2017-04-30', '%Y-%m-%d')
		and ex.expense_category_no = 1
		
		
		
	select inc.income_category_name incomeCategoryName, sum(income.income_amount) eachSum
		  from tb_sam_income income, tb_sam_income_category inc
		where income.income_category_no = inc.income_category_no
		  and income.user_id = '김현영'
		  and income.income_date between STR_TO_DATE ('2017-04-02', '%Y-%m-%d') 
								     and STR_TO_DATE ('2017-04-08', '%Y-%m-%d')
		group by income.income_category_no	
		
		
		
	select *
		  from tb_sam_debt
		where user_id = '김현영'
		  and  debt_date = '2017-04-10'
			  
	select *
		  from tb_sam_loan
		where user_id = '김현영' 
		  and  loan_date = '2017-04-10'
			  
		    select *
            from tb_sam_expense
            
			
	select * into outfile 'mini.csv' fields terminated by ',' from tb_sam_expense
		
	select * from tb_board 
	into outfile 'C:/ProgramData/MySQL/MySQL Server 5.7/Uploads/kdm.csv' fields terminated by ','
		
	
	select * from tb_sam_expense 
	into outfile 'C:/ProgramData/MySQL/MySQL Server 5.7/Uploads/dff.csv' fields terminated by ','
	
		
	select *      from tb_sam_expense   where user_id = '김현영'  
	into outfile 'C:/ProgramData/MySQL/MySQL Server 5.7/Uploads/zcx.xlsx' fields terminated by ','
	
	
	
		select * 
		  from tb_sam_expense
		where user_id = '김현영'
		into outfile 
		'C:/java90/tomcat-work/wtpwebapps/b90ft4/accountBookFile/kim.csv'
		fields terminated by ','
		

		select CONCAT('C:/ProgramData/MySQL/MySQL Server 5.7/Uploads/','kim','.csv')

		
		

	
		
	select 	CONCAT('C:/ProgramData/MySQL/MySQL Server 5.7/Uploads/','kim','.csv')
	
	
	
	
	
		select ex.expense_no,
			   ex.user_id,
			   exc.expense_category_name,
			   ex.expense_content,
			   ex.expense_amount,
			   ex.expense_date
		  from tb_sam_expense ex,
		       tb_sam_expense_category exc
		where  ex.expense_category_no = exc.expense_category_no
		  and  ex.user_id = '김현영'
		into outfile 
		'C:/accountBookFile/asdff.csv';
		fields terminated by ','
		
		
	
		select * 
		  from tb_sam_expense
		where user_id = '김현영'
		into outfile 
		'C:/accountBookFile/asdf.csv';
		fields terminated by ','
	
		
			select *
		  from tb_sam_expense ex,
		       tb_sam_expense_category exc
		where  ex.expense_category_no = exc.expense_category_no
			   ex.user_id = '김현영'
		into outfile 
		'C:/accountBookFile/sdfsd.csv';
		fields terminated by ','
	
		
	  -- 가계부 안 쓴 날짜.
	  select (abs((select count(*)
	  			    from (
					select expense_date 
					  from tb_sam_expense
					where substring(expense_date,1,7) = substring(now(),1,7)
					group by expense_date
					union
					select income_date 
					  from tb_sam_income
					where substring(income_date,1,7) = substring(now(),1,7)
					group by income_date
					) cnt ) 
			 - 
				  (select dayofmonth(now()))))
		
	 	 select 
	  		round(((select count(*)
	  			   from (
					select expense_date 
					  from tb_sam_expense
					where substring(expense_date,1,7) = substring(now(),1,7)
					  and user_id = #{userId}
					group by expense_date
					union
					select income_date 
					  from tb_sam_income
					where substring(income_date,1,7) = substring(now(),1,7)
					  and user_id = #{userId}
					group by income_date
			 		) cnt )) / dayofmonth(now()) * 100,1)
			 		
	 	 select 
	  		round(((select count(*)
	  			   from (
					select expense_date 
					  from tb_sam_expense
					where substring(expense_date,1,7) = substring(now(),1,7)
					  and user_id = '김현영'
					group by expense_date
					union
					select income_date 
					  from tb_sam_income
					where substring(income_date,1,7) = substring(now(),1,7)
					  and user_id = '김현영'
					group by income_date
			 		) cnt )) / dayofmonth(now()) * 100,1)
			 		
			 		
			
		
		
		
		
		
		
	
		
		
		  
		 
		select substring(now(),1,7)
		
		select * from tb_sam_expense
		select * from tb_sam_income
		select * from tb_sam_loan
		select * from tb_sam_debt
		select * from tb_sam_expense_plan
		select * from tb_sam_memo
		
		
		select *
		  from tb_sam_user
		where user_id = 'Durad  Han'
		
		
		update tb_sam_expense
		   set user_id = 'Durad  Han'
		where user_id = '김현영';
		
		update tb_sam_income
		   set user_id = 'Durad  Han'
		where user_id = '김현영';
		
		update tb_sam_loan
		   set user_id = 'Durad  Han'
		where user_id = '김현영';
		
		update tb_sam_debt
		   set user_id = 'Durad  Han'
		where user_id = '김현영';
		
		update tb_sam_expense_plan
		   set user_id = 'Durad  Han'
		where user_id = '김현영';
		
		update tb_sam_memo
		   set user_id = 'Durad  Han'
		where user_id = '김현영';
		
		
		select * 
		  from tb_sam_chat_room
		
		delete 
		  from tb_sam_chat_room
		  
		delete 
		  from tb_sam_chat_msg
		  
		 delete
		   from tb_sam_chat_room
		 where room_no = 1;
		 
		
		
		 select  last_day('2017-04-01')
		 select  concat('2017','-','04','-','01')

		 select concat('2017','-','05')
		  
		 select substring(last_day(concat('2017','-','05','-01')),9,2)	
		  
		 select substring(now(),1,7)
		 select concat('2017','-','05','-01')
		 
		 
		 select dayofmonth(now()) 
		 
		  
		  select 
	  		round(((select count(*)
	  			   from (
					select expense_date 
					  from tb_sam_expense
					where substring(expense_date,1,7) = concat('2017','-','04')
					  and user_id = 'Durad  Han'
					group by expense_date
					union
					select income_date 
					  from tb_sam_income
					where substring(income_date,1,7) = concat('2017','-','04')
					  and user_id = 'Durad  Han'
					group by income_date
			 		) cnt )) 
			 		/
			 	   CASE concat('2017','-','04')
						WHEN substring(now(),1,7) THEN dayofmonth(now()) 
						ELSE substring(last_day(concat('2017','-','04','-01')),9,2)		  
					 END
			 		* 
			 		100,1)
		  
			 		
			 		
			 		dayofmonth(now()) 
		  
			 		 CASE concat('2017','-','05')
						WHEN substring(now(),1,7) THEN dayofmonth(now()) 
						ELSE substring(last_day(concat('2017','-','05','-01')),9,2)		  
					 END
		  
		  
		  select  date_format(reg_date,'%Y-%m-%d %H:%i:%s') reg_date
		    from tb_sam_chat_msg
		    
		    
		  select no,room_no,user,msg,substring(reg_date,1,19) reg_date
		    from tb_sam_chat_msg
		    
		  
		  
		  
	
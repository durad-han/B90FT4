drop table tb_sam_budget;
drop table tb_Sam_Budget_Category;
drop table tb_Sam_Loan_Debt;

drop table tb_sam_income_category
drop table tb_sam_expense_category
drop table tb_sam_expense
drop table tb_sam_income
drop table tb_sam_loan
drop table tb_sam_debt
drop table tb_sam_memo

select * from tb_sam_income_category
select * from tb_sam_expense_category
select * from tb_sam_expense
select * from tb_sam_income
select * from tb_sam_loan
select * from tb_sam_debt
select * from tb_sam_memo

create table tb_sam_income_category( 
	income_category_id 		int(6)	auto_increment primary key,
	income_category_name 	varchar(50) not null,
	User_Id				 	varchar(60),
	FOREIGN KEY(User_Id) REFERENCES tb_sam_user(User_Id)
)

create table tb_sam_expense_category( 
	expense_category_id  	int(6)	auto_increment primary key,
	expense_category_name   varchar(50) not null,	
	User_Id				 	varchar(60),
	FOREIGN KEY(User_Id) REFERENCES tb_sam_user(User_Id)
)

create table tb_sam_expense (
	expense_no int(6) auto_increment primary key,
	user_id	   varchar(60) not null,
	expense_category_id int(2) not null,
	expense_content varchar(1000) null,
	expense_amount int(6) not null,
	expense_date date not null,
	FOREIGN KEY(expense_category_id) REFERENCES tb_sam_expense_category(expense_category_id),
	FOREIGN KEY(User_Id) REFERENCES tb_sam_user(User_Id)
)

create table tb_sam_income (
	income_no				 int(6) primary key,
	user_id 				 varchar(60) not null,
	income_category_id		 int(2) not null,
	income_content 			 varchar(1000) null,
	income_amount 			 int(6) not null,
	income_date datetime 	 not null,
	FOREIGN KEY(income_category_id) REFERENCES tb_sam_income_category(income_category_id),
	FOREIGN KEY(User_Id) REFERENCES tb_sam_user(User_Id)
)

create table tb_sam_loan (
	loan_no 				int(6) auto_increment primary key,
	User_Id 				varchar(60) not null,
	debtor 					varchar(60) not null,
	loan_content 			varchar(1000),
	loan_amount 			int(6) 	not null,
	loan_date datetime 		not null,
	FOREIGN KEY(User_Id) REFERENCES tb_sam_user(User_Id)
)

create table tb_sam_debt (
	debt_no 				int(6) auto_increment primary key,
	User_Id			    	varchar(60) not null,
	money_lender		 	varchar(60) not null,
	debt_content 			varchar(1000) null,
	debt_amount				int(6)		not null,
	debt_date datetime 		not null,
	FOREIGN KEY(User_Id) REFERENCES tb_sam_user(User_Id)
)

create table tb_Sam_Budget_Memo (
	Memo_No 		int(6) auto_increment		primary key,
	User_Id 		varchar(60)					not null,
	Pos_X 			int 						not null,
	Pos_Y 			int 						not null,
	Content 		varchar(2000) 				null,
	Reg_Date 		datetime 					default now(),
	FOREIGN KEY(User_Id) REFERENCES tb_Sam_User(User_Id)
);

-- 데이터 --

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


-- alter 예시--

alter table tb_Sam_Budget
add column budget_code char(1) not null;



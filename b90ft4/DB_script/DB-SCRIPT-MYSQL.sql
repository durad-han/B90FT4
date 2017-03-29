------------------------------------------------------------------------------
-- SAMPLE
------------------------------------------------------------------------------
--CREATE TABLE staff (
--    staff_No 		int(3) auto_increment,
--    staff_Name 		VARCHAR(14) 			NOT NULL,
--    jumin_No 		CHAR(14) 				NOT NULL UNIQUE,
--    school_Code 	int(3) 					NOT NULL,
--    religion_Code 	int(3) 					NOT NULL,
--    graduate_Day 	char(10) 				NOT NULL,
--    FOREIGN KEY(religion_Code) 				REFERENCES code_religion(religion_Code),
--    FOREIGN KEY(school_Code) 				REFERENCES code_School(school_Code),
--    PRIMARY KEY(staff_No)
--);


------------------------------------------------------------------------------
-- USER
------------------------------------------------------------------------------
create table tb_Sam_User (
	User_Id					varchar(60) 	primary key,			-- 유저 고유번호
	Password				varchar(60) 	not null,				-- 비밀번호
	Email					varchar(60)								-- 이메일
);


------------------------------------------------------------------------------
-- DIARY
------------------------------------------------------------------------------
create table tb_Sam_Diary (
	Diary_No				int(6) auto_increment		primary key,	-- 스케줄 고유번호 (시퀀스)
	User_Id					varchar(60)					not null,		-- 작성자 시퀀스 (FK)
	Latitude				float(14,9),								-- 시작
	Longitude				float(14,9),								-- 종료
	Weather_City			varchar(200)				not null,		-- 제목
	Title					varchar(200)				not null,		-- 설명
	Content					varchar(200)				not null,		-- 설명
	File_Ori				varchar(200),								-- 종류
	File_New				varchar(200),								-- 중요도
	File_Path				varchar(200),								-- 완료여부
	FOREIGN KEY(User_Id) 	REFERENCES tb_Sam_User(User_Id)
);


------------------------------------------------------------------------------
-- SCHEDULE
------------------------------------------------------------------------------
create table tb_Sam_Schedule (
	Schedule_No				int(6) auto_increment		primary key,	-- 스케줄 고유번호
	User_Id					varchar(60)					not null,		-- 작성자 아이디
	Start					datetime					not null,		-- 시작시각
	End						datetime 					not null,		-- 종료시각
	Title					varchar(60) 				not null,		-- 제목
	Content					varchar(200),								-- 설명
	Category				int(1) 						not null,		-- 종류
	Importance				int(1),										-- 중요도 (1: 보통, 2: 높음, 3: 매우높음)
	Achieve					int(1),										-- 완료여부
	FOREIGN KEY(User_Id) 	REFERENCES tb_Sam_User(User_Id)
);


------------------------------------------------------------------------------
-- ACCOUNT BOOK
------------------------------------------------------------------------------
create table tb_Sam_Budget_Category( 
	Budget_Category_No 		int(6) auto_increment		primary key,
	Category_Name 			varchar(50) 				not null	
);

create table tb_Sam_Budget (
	Budget_No 						int(6) auto_increment 	primary key,
	User_Id 						varchar(60) 			not null,
	Budget_Category_No 				int(6) 					not null,
	Content 						varchar(1000),
	Amount 							int(6) 					not null,
	Budget_Date						datetime 				not null,
	FOREIGN KEY(Budget_Category_No) REFERENCES tb_Sam_Budget_Category(Budget_Category_No),
	FOREIGN KEY(User_Id) 	 		REFERENCES tb_Sam_User(User_Id)
);

create table tb_Sam_Loan_Debt (
	Loan_Debt_No 			int(6) auto_increment 		primary key,
	User_Id 				varchar(60) 				not null,
	Partner 				varchar(20) 				not null,
	Content 				varchar(1000),
	Amount 					int(6) 						not null,
	Debt_Date 				datetime 					not null,
	FOREIGN KEY(User_Id) 	REFERENCES tb_Sam_User(User_Id)
);

create table tb_Sam_Budget_Memo (
	Memo_No 		int(6) auto_increment		primary key,
	User_Id 		varchar(60)					not null,
	Pos_X 			int 						not null,
	Pos_Y 			int 						not null,
	Content 		varchar(2000) 				null,
	Reg_Date 		datetime 					default now(),
	FOREIGN KEY(User_Id) REFERENCES tb_Sam_User(User_Id)
);


------------------------------------------------------------------------------
-- COMMON
------------------------------------------------------------------------------
-- 어차피 여러군데서 사용하는 img 테이블이라면 공용으로 만들 방법을 고민해보자
-- 각자 사용하는 쪽으로?
--create table tb_Sam_img ( 
--	Img_No 			int(6) auto_increment	primary key,
--	Ori_Name 		varchar(250) 			not null,
--	Sys_Name 		varchar(500) 			not null,
--	Size 			int(8) 					not null,
--	Path 			varchar(500) 			not null
--);


------------------------------------------------------------------------------
-- WORKOUT
------------------------------------------------------------------------------
create table tb_Sam_Workout (
	Workout_No					int(6) auto_increment	primary key,			--
	Workout_Id 					varchar(60) not null,
	User_Id						varchar(60) not null,									-- 
	Is_Basic					int(1) not null,											-- 
	FOREIGN KEY(User_Id) 		REFERENCES tb_Sam_User(User_Id)			
				
);

create table tb_Sam_Workout_Statistics (
	Workout_Day					datetime				primary key,
	Workout_No					int(6)					not null,				-- 								-- 
	Spent_Cal					int(6)					default 0,				-- 
	Intake_Cal					int(6)					default 0,				-- 
	FOREIGN KEY(Workout_No) 		REFERENCES tb_Sam_Workout(Workout_No)	
	
);

create table tb_Sam_Workout_Set (
	Workout_Set_No				int(6) auto_increment	primary key,				--
	Workout_No					int(6)					not null,					-- 
	Workout_Day					datetime				not null,					-- 세트 시작 날자. 이걸로 tb_Sam_Workout_Statistics 테이블에서 날자별로 뽑아낼거임
	Type_A_Count				int(6)					default 0,												-- 
	Type_B_Time					varchar(200)			default 0,							-- 
	Spent_Cal					int(6)					default 0,					-- 
	Interval_Time				varchar(200)			default 0,					-- 
	Workout_Description			varchar(100)			default	'No Description',	-- 
	FOREIGN KEY(Workout_No) 	REFERENCES tb_Sam_Workout(Workout_No)		
	
);

create table tb_Sam_Workout_Set_Img (
	Img_No						int(6) auto_increment	primary key,			--
	Workout_Set_No				int(6)					not null,				-- 
	Ori_Name					varchar(250)			not null,				-- 
	Sys_Name					varchar(500)			not null,				-- 
	Size						int(8)					not null,				-- 
	Path						varchar(500)			not null,				-- 
	FOREIGN KEY(Workout_Set_No) REFERENCES tb_Sam_Workout_Set(Workout_Set_No)		
);









------------------------------------------------------------------------------
-- Unity
------------------------------------------------------------------------------
create table tb_Sam_Unity( 
	Unity_No 					int(6) auto_increment 	primary key,
	User_Id						varchar(60)				not null,
	Unity_Name					varchar(60),
	Category					int(1)					not null,
	Category_No					int(6)					not null,
	Schedule_No					int(6)					not null,
	FOREIGN KEY(User_Id) 		REFERENCES tb_Sam_User(User_Id),
	FOREIGN KEY(Schedule_No) 	REFERENCES tb_Sam_Schedule(Schedule_No)
);
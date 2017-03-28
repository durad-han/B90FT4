------------------------------------------------------------------------------
-- SAMPLE
------------------------------------------------------------------------------
CREATE TABLE staff (
    staff_No 		int(3) auto_increment,
    staff_name 		VARCHAR(14) 			NOT NULL,
    jumin_No 		CHAR(14) 				NOT NULL UNIQUE,
    school_code 	int(3) 					NOT NULL,
    religion_code 	int(3) 					NOT NULL,
    graduate_day 	char(10) 				NOT NULL,
    FOREIGN KEY(religion_code) 				REFERENCES code_religion(religion_code),
    FOREIGN KEY(school_code) 				REFERENCES code_school(school_code),
    PRIMARY KEY(staff_No)
);


------------------------------------------------------------------------------
-- USER
------------------------------------------------------------------------------
create table tb_Sam_User (
	User_No			int(6) 			primary key,			-- 유저 고유번호 (시퀀스)
	Id				varchar(60) 	not null,				-- 아이디
	Password		varchar(60) 	not null,				-- 비밀번호
	Email			varchar(60)								-- 이메일
);


------------------------------------------------------------------------------
-- Unity
------------------------------------------------------------------------------
create table tb_sam_Unity( 
	Unity_No 					int(6) auto_increment 	primary key,
	budget_No					int(6),
	Schedule_No					int(6),
	Workout_No					int(6),
	FOREIGN KEY(budget_No) 		REFERENCES tb_sam_budget(budget_No),
	FOREIGN KEY(Schedule_No) 	REFERENCES tb_sam_schedule(Schedule_No),
	FOREIGN KEY(Workout_No) 	REFERENCES tb_sam_workout(Workout_No)
);


------------------------------------------------------------------------------
-- ACCOUNT BOOK
------------------------------------------------------------------------------
create table tb_sam_budget_category( 
	Category_No 		int(6)					primary key,
	Category_name 		varchar(50) 			not null	
);

create table tb_sam_budget (
	budget_No 				int(6) auto_increment 	primary key,
	user_No 				int(6) 					not null,
	Category_No 			int(6) 					not null,
	content 				varchar(1000) 			null,
	amount 					int(6) 					not null,
	budget_date				datetime 				not null,
	FOREIGN KEY(Category_No) REFERENCES tb_sam_budget_category(Category_No),
	FOREIGN KEY(user_No) 	 REFERENCES tb_sam_user(user_No)
);

create table tb_sam_loan_debt (
	loan_debt_no 		int(6) auto_increment 		primary key,
	user_no 			int(6) 						not null,
	partner 			varchar(20) 				not null,
	content 			varchar(1000) 				null,
	amount 				int(6) 						not null,
	debt_date 			datetime 					not null,
	FOREIGN KEY(user_No) REFERENCES tb_sam_user(user_No)
);

create tb_sam_memo (
	memo_No 		int(6) auto_increment		primary key,
	user_No 		int(6),
	pos_x 			int 						not null,
	pos_y 			int 						not null,
	content 		varchar(2000) 				null,
	reg_date 		datetime 					default now(),
	FOREIGN KEY(user_No) REFERENCES tb_sam_user(user_No)
);


------------------------------------------------------------------------------
-- COMMON
------------------------------------------------------------------------------
-- 어차피 여러군데서 사용하는 img 테이블이라면 공용으로 만들 방법을 고민해보자

create tb_sam_img ( 
	Img_No 			int(6) auto_increment	primary key,
	Ori_name 		varchar(250) 			not null,
	Sys_name 		varchar(500) 			not null,
	Size 			int(8) 					not null,
	Path 			varchar(500) 			not null
);


------------------------------------------------------------------------------
-- SCHEDULE
------------------------------------------------------------------------------
create tb_Sam_Schedule (
	Schedule_No				int(6) auto_increment		primary key,	-- 스케줄 고유번호 (시퀀스)
	User_No					int(6),							-- 작성자 시퀀스 (FK)
	SchStart				datetime		not null,		-- 시작
	SchEnd					datetime 		not null,		-- 종료
	Title					varchar(60) 	not null,		-- 제목
	Content					varchar(200),					-- 설명
	Category				int(1)			default 0,		-- 종류
	Importance				int(1)			default 0,		-- 중요도
	Achieve					int(1)			default 0,		-- 완료여부
	FOREIGN KEY(user_No) 	REFERENCES tb_sam_user(user_No)
	
);


------------------------------------------------------------------------------
-- WORKOUT
------------------------------------------------------------------------------
create tb_Sam_Workout (
	Workout_No				int(6) auto_increment	primary key,			-- 
	User_No					int(6),											-- 
	Title					varchar(60) 	not null,						-- 
	Is_Basic				varchar(1),										-- 
	FOREIGN KEY(user_No) 	REFERENCES tb_sam_user(user_No)					
	
);

--create tb_Sam_w2 (
--	Workout_No					int(6) auto_increment	primary key,	-- 스케줄 고유번호 (시퀀스)
--	Schedule_No				int(6),							-- 작성자 시퀀스 (FK)
--	SchStart				datetime			not null,		-- 시작
--	SchEnd					datetime 			not null,		-- 종료
--	FOREIGN KEY(Schedule_No) 	REFERENCES tb_sam_Schedule(Schedule_No)
--	
--);

create tb_Sam_Workout_statistics (
	Workout_Day				datetime				primary key,			-- 
	Workout_No				int(6) 					not null,				-- 
	Spent_Cal				int(6)					default 0,				-- 
	Intake_Cal				int(6)					default 0,				-- 
	FOREIGN KEY(Workout_No)		REFERENCES tb_Sam_Workout(Workout_No),		
	FOREIGN KEY(Spent_Cal) 		REFERENCES tb_Sam_Workout_Set(Spent_Cal)	
	
);

create tb_Sam_Workout_Set (
	Workout_Set_No			int(6) auto_increment	primary key,			--
	Workout_No				int(6),											-- 
	Workout_Day				datetime				not null,										-- 세트 시작 날자. 이걸로 tb_Sam_Workout_statistics 테이블에서 날자별로 뽑아낼거임
	Type_A_Count			int(6),											-- 
	Type_B_Time				varchar(200),									-- 
	Spent_Cal				int(6)					not null,										-- 
	Interval_Time			varchar(200)			default 0,									-- 
	Workout_Description		varchar(100)			default	'No Description',									-- 
	FOREIGN KEY(Workout_No) 	REFERENCES tb_sam_Workout(Workout_No)		
	
);




------------------------------------------------------------------------------
-- DIARY
------------------------------------------------------------------------------
create tb_Sam_Diary (
	Diary_No				int(6) auto_increment		primary key,	-- 스케줄 고유번호 (시퀀스)
	User_No					int(6),							-- 작성자 시퀀스 (FK)
	Latitude				int(14,9),		-- 시작
	Longitude				int(14,9),		-- 종료
	Weather_City			varchar(200),		-- 제목
	Title					varchar(200),					-- 설명
	Content					varchar(200),					-- 설명
	File_Ori				varchar(200),		-- 종류
	File_New				varchar(200),		-- 중요도
	File_Path				varchar(200),		-- 완료여부
	FOREIGN KEY(user_No) 	REFERENCES tb_sam_user(user_No)
	
);




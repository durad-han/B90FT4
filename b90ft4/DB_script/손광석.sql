

create table tb_Sam_Diary (
	Diary_No				int(6) auto_increment		primary key,	-- 스케줄 고유번호 (시퀀스)
	User_Id					varchar(60)					not null,		-- 작성자 시퀀스 (FK)
	Latitude				float(14,9),								-- 시작
	Longitude				float(14,9),								-- 종료
	Weather_City			varchar(200),								-- 제목
	Title					varchar(200)				not null,		-- 설명
	Content					varchar(200)				not null,		-- 설명
	Weather_Code			int(2)						not null,
	Emotion_Code			int(2)						not null,
	Reg_Date				datetime					default now(),
	FOREIGN KEY(User_Id) 	REFERENCES tb_Sam_User(User_Id)
);

create table tb_Sam_Diary_Img (
	no			   int(6) primary key,
	Diary_No 	   int(6),
	ori_name       varchar(100) not null,
	system_name    varchar(200) not null,
	file_path	   varchar(100) not null,
	file_size	   int(8),
	FOREIGN KEY(Diary_No) 	REFERENCES tb_Sam_diary(Diary_No)
)

drop table tb_Sam_Diary_Img;


alter table tb_Sam_diary
add column Reg_Date datetime default now()


drop table tb_sam_diary

select * from tb_sam_diary


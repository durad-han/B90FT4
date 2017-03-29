insert into tb_team4_test(test_pk,test_col) values ('test_pk4','test_col4');

commit;


-- user sample -------------------------------------------------------------------
insert into tb_Sam_User (User_Id,Password) values ('admin','admin');
insert into tb_Sam_User (User_Id,Password) values ('tester01','tester01');
insert into tb_Sam_User (User_Id,Password) values ('tester02','tester02');
insert into tb_Sam_User (User_Id,Password) values ('tester03','tester03');

commit;

-- schedule sample----------------------------------------------------------------
insert into tb_Sam_Schedule (User_Id,Start,End,Title,Content,Category,Importance,Achieve) 
values ('tester01',now(),now(),'sample01','no data',1,2,0);

insert into tb_Sam_Schedule (User_Id,Start,End,Title,Content,Category,Importance,Achieve) 
values ('tester01',sysdate(),now(),'sample02','no data',1,1,0);

insert into tb_Sam_Schedule (User_Id,Start,End,Title,Content,Category,Importance,Achieve) 
values ('tester01',now(),now(),'sample03','yes data',1,1,0);

insert into tb_Sam_Schedule (User_Id,Start,End,Title,Content,Category,Importance,Achieve) 
values ('tester01',now(),now(),'sample04','노다타',1,1,0);

insert into tb_Sam_Schedule (User_Id,Start,End,Title,Content,Category,Importance,Achieve) 
values ('tester01',now(),now(),'sample05','노데이타',1,3,0);

insert into tb_Sam_Schedule (User_Id,Start,End,Title,Content,Category,Importance,Achieve) 
values ('tester01',now(),now(),'sample06','없엉',1,1,0);

insert into tb_Sam_Schedule (User_Id,Start,End,Title,Content,Category,Importance,Achieve) 
values ('tester01',now(),now(),'샘플넣기','ㄴㄴ',1,3,0);

insert into tb_Sam_Schedule (User_Id,Start,End,Title,Content,Category,Importance,Achieve) 
values ('tester01',now(),now(),'으엉','으앙',2,1,0);



-- workout sample----------------------------------------------------------------

insert into tb_Sam_Workout(User_Id,Workout_Id,Is_Basic) values ('tester01','기본운동A',1);
insert into tb_Sam_Workout(User_Id,Workout_Id,Is_Basic) values ('tester01','기본운동B',1);
insert into tb_Sam_Workout(User_Id,Workout_Id,Is_Basic) values ('tester01','기본운동C',1);

commit;


function workoutMove(workoutNo,workoutType){
	console.log(workoutType);
	console.log(workoutNo);
	location.href="workoutType"+workoutType+".do?workoutNo="+workoutNo;

}

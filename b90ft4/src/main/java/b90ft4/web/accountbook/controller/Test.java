package b90ft4.web.accountbook.controller;

import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Timer;
import java.util.TimerTask;

public class Test {

	public static void main(String[] args) throws IOException {
		
		PrintWriter out = new PrintWriter(new FileWriter("log/deleteLog.txt"));
		Timer mTimer;
		
		try {
			
			mTimer = new Timer();

			// 타이머 취소 메서드
			// mTimer.cancel();
			
			TimerTask task = new TimerTask() {
				@Override
				public void run() {
					out.println("안녕히세요");
					out.println("L 입니다.");
					out.close();
				}
			};
			
			mTimer.schedule(task, 1000);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
}

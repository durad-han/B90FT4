package b90ft4.web.common.file;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Timer;
import java.util.TimerTask;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;

import org.springframework.stereotype.Service;

@Service
public class DeleteAuto {

	private static Timer mTimer = new Timer();
	private static PrintWriter out;
	// 타이머 취소 메서드
	// mTimer.cancel();
	
	@PostConstruct
	public void init() throws IOException{
	
		 File f = new File("C:/java90/git/B90FT4/b90ft4/log/deleteLog.txt");
		 out = new PrintWriter(new FileWriter(f),true);
		 
		TimerTask task = new TimerTask() {
			
			@Override
			public void run() {
				
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
				out.println(sdf.format(new Date()) + " 삭제완료");

				String path = "C:/java90/tomcat-work/wtpwebapps/b90ft4/upload/temp";
				File f = new File(path);

				File[] innerFiles = f.listFiles();
				Calendar c = Calendar.getInstance();
				
				for(int i=0;i<innerFiles.length;i++) {
					
					// 오늘 날짜의 파일 일 경우, 삭제 건너뛴다.
					long time = innerFiles[i].lastModified();
					c.setTimeInMillis(time);
					int modfiedDate = c.get(Calendar.DATE);
					c.setTime(new Date());
					int todayDate = c.get(Calendar.DATE);
							
					if(modfiedDate!=todayDate){
						innerFiles[i].delete();
					}
					
				}
			}
		};
		// 1시간 마다 삭제 : 3600000
		mTimer.schedule(task,0,3600000);
	}
	
	@PreDestroy
	public void destory(){
		mTimer.cancel();
		out.close();
	}
	
}

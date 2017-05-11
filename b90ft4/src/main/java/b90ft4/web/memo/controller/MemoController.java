package b90ft4.web.memo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import b90ft4.web.memo.service.MemoService;
import b90ft4.web.repository.vo.MemoVO;
import b90ft4.web.repository.vo.UserVO;

@RestController
@RequestMapping("/memo")
public class MemoController {
	
	@Autowired
	private MemoService service;
	
	@RequestMapping("/list.do")
	public List<MemoVO> list(UserVO user) throws Exception{
		user.setUserId("durad han");
		return service.list(user);
	}
	
	@RequestMapping("/save.do")
	public int save(MemoVO memo) throws Exception{
		memo.setUserId("durad han");
		service.save(memo);
		return memo.getMemoNo();
	}
	
	@RequestMapping("/edit.do")
	public String edit(MemoVO memo) throws Exception{
		service.edit(memo);
		return "ok";
	}
	
	@RequestMapping("/delete.do")
	public String delete(int memoNo) throws Exception{
		service.delete(memoNo);
		return "ok";
	}


}

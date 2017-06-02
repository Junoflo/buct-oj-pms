package com.ojpms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ojpms.dao.ProblemDao;
import com.ojpms.dto.Problem;

@Service("problemService")
public class ProblemService {
	
	@Autowired
	ProblemDao dao;
	
	public long add(Problem problem){
		return dao.insertProblem(problem);
	}
	
	public List<Problem> queryByUid(long uid){
		return dao.queryByUid(uid);
	}
	
	public Problem queryByPid(long pid){
		return dao.queryByPid(pid);
	}
}

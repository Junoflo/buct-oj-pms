package com.ojpms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ojpms.dao.ResultDao;
import com.ojpms.dto.Result;

@Service("resultService")
public class ResultService {
	
	@Autowired
	ResultDao resultDao;
	
	public long batchSave(List<Result> results){
		long id = 0L;
		for (Result r : results) {
			id = resultDao.save(r);
		}
		return id;
	}
	public List<Result> queryByPid(long problemId){
		return resultDao.queryByPid(problemId);
	}
	public Result queryById(long resultId){
		return resultDao.queryById(resultId);
	}
}

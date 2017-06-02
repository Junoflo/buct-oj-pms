package com.ojpms.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ojpms.dao.CoverageDao;
import com.ojpms.dto.Coverage;
@Service("coverageService")
public class CoverageService {
	
	@Autowired
	CoverageDao coverageDao;
	
	public long addCoverage(Coverage coverage){
		return coverageDao.insertCoverage(coverage);
	}
	public Coverage queryByPid(long pid){
		return coverageDao.queryByPid(pid);
	}
}

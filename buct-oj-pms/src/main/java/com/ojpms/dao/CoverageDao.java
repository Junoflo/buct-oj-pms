package com.ojpms.dao;

import org.springframework.stereotype.Repository;

import com.ojpms.dto.Coverage;

@Repository("coverageDao")
public interface CoverageDao {
	public int insertCoverage(Coverage coverage);
	public Coverage queryByPid(long pid);
}

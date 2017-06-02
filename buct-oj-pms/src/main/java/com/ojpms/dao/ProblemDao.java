package com.ojpms.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ojpms.dto.Problem;

@Repository("problemDao")
public interface ProblemDao {
	public int insertProblem(Problem problem);
	public List<Problem> queryByUid(long uid);
	public Problem queryByPid(long pid);
}

package com.ojpms.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ojpms.dto.Result;

@Repository("resultDao")
public interface ResultDao {
	public long save(Result result);
	public List<Result> queryByPid(long pid);
	public Result queryById(long id);
}

package com.ojpms.dto;

public class Result {
	
	long id;
	long pid;//题目ID
	String input;//输入
	String output;//输出
	String coverage;//覆盖情况 哪些行覆盖了,哪些行没有覆盖(Map<Integer,Boolean>)用的时候解出来
	
	public boolean has(String str){
		if(this.coverage.equals(str)){
			return true;
		}
		return false;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public long getPid() {
		return pid;
	}

	public void setPid(long pid) {
		this.pid = pid;
	}

	public String getInput() {
		return input;
	}

	public void setInput(String input) {
		this.input = input;
	}

	public String getOutput() {
		return output;
	}

	public void setOutput(String output) {
		this.output = output;
	}

	public String getCoverage() {
		return coverage;
	}

	public void setCoverage(String coverage) {
		this.coverage = coverage;
	}

	@Override
	public String toString() {
		return "Result [id=" + id + ", pid=" + pid + ", input=" + input + ", output=" + output + ", coverage="
				+ coverage + "]";
	}
	
}

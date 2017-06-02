package com.ojpms.dto;


public class Coverage {
	
	private long pid;//每道题目对应一条记录
	private double coverageRate;//总的覆盖率
	private String uncoveredLines;
	private String standardProgram;
	private String report;
	public long getPid() {
		return pid;
	}
	public void setPid(long pid) {
		this.pid = pid;
	}
	public double getCoverageRate() {
		return coverageRate;
	}
	public void setCoverageRate(double coverageRate) {
		this.coverageRate = coverageRate;
	}
	public String getUncoveredLines() {
		return uncoveredLines;
	}
	public void setUncoveredLines(String uncoveredLines) {
		this.uncoveredLines = uncoveredLines;
	}
	public String getStandardProgram() {
		return standardProgram;
	}
	public void setStandardProgram(String standardProgram) {
		this.standardProgram = standardProgram;
	}
	public String getReport() {
		return report;
	}
	public void setReport(String report) {
		this.report = report;
	}
	@Override
	public String toString() {
		return "Coverage [pid=" + pid + ", coverageRate=" + coverageRate + ", uncoveredLines=" + uncoveredLines
				+ ", standardProgram=" + standardProgram + ", report=" + report + "]";
	}
	public Coverage() {
		super();
	}
	
}

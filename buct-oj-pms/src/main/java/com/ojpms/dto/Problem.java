package com.ojpms.dto;

public class Problem {
	long id;
	long uid;
	String problemTitle;
	String problemDesc;
	String inputDesc;
	String outputDesc;
	String inputSample;
	String outputSample;
	String notice;
	String source;
	String standardProgramPath;
	String standardProgramName;
	String randomProgramPath;
	String randomProgramName;
	String gcovFilePath;
	String gcovFileName;
	long submitTime;
	String workdir;//工作文件夹(每道题一个文件夹,以时间戳的字符串形式命名)
	String workstation;
	String submitTimeStr;
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public long getUid() {
		return uid;
	}
	public void setUid(long uid) {
		this.uid = uid;
	}
	public String getProblemTitle() {
		return problemTitle;
	}
	public void setProblemTitle(String problemTitle) {
		this.problemTitle = problemTitle;
	}
	public String getProblemDesc() {
		return problemDesc;
	}
	public void setProblemDesc(String problemDesc) {
		this.problemDesc = problemDesc;
	}
	public String getInputDesc() {
		return inputDesc;
	}
	public void setInputDesc(String inputDesc) {
		this.inputDesc = inputDesc;
	}
	public String getOutputDesc() {
		return outputDesc;
	}
	public void setOutputDesc(String outputDesc) {
		this.outputDesc = outputDesc;
	}
	public String getInputSample() {
		return inputSample;
	}
	public void setInputSample(String inputSample) {
		this.inputSample = inputSample;
	}
	public String getOutputSample() {
		return outputSample;
	}
	public void setOutputSample(String outputSample) {
		this.outputSample = outputSample;
	}
	public String getNotice() {
		return notice;
	}
	public void setNotice(String notice) {
		this.notice = notice;
	}
	public String getSource() {
		return source;
	}
	public void setSource(String source) {
		this.source = source;
	}
	public String getStandardProgramPath() {
		return standardProgramPath;
	}
	public void setStandardProgramPath(String standardProgramPath) {
		this.standardProgramPath = standardProgramPath;
	}
	public String getStandardProgramName() {
		return standardProgramName;
	}
	public void setStandardProgramName(String standardProgramName) {
		this.standardProgramName = standardProgramName;
	}
	public String getRandomProgramPath() {
		return randomProgramPath;
	}
	public void setRandomProgramPath(String randomProgramPath) {
		this.randomProgramPath = randomProgramPath;
	}
	public String getRandomProgramName() {
		return randomProgramName;
	}
	public void setRandomProgramName(String randomProgramName) {
		this.randomProgramName = randomProgramName;
	}
	public String getGcovFilePath() {
		return gcovFilePath;
	}
	public void setGcovFilePath(String gcovFilePath) {
		this.gcovFilePath = gcovFilePath;
	}
	public String getGcovFileName() {
		return gcovFileName;
	}
	public void setGcovFileName(String gcovFileName) {
		this.gcovFileName = gcovFileName;
	}
	public long getSubmitTime() {
		return submitTime;
	}
	public void setSubmitTime(long submitTime) {
		this.submitTime = submitTime;
	}
	public String getWorkdir() {
		return workdir;
	}
	public void setWorkdir(String workdir) {
		this.workdir = workdir;
	}
	public String getWorkstation() {
		return workstation;
	}
	public void setWorkstation(String workstation) {
		this.workstation = workstation;
	}
	public String getSubmitTimeStr() {
		return submitTimeStr;
	}
	public void setSubmitTimeStr(String submitTimeStr) {
		this.submitTimeStr = submitTimeStr;
	}
	@Override
	public String toString() {
		return "Problem [id=" + id + ", uid=" + uid + ", problemTitle=" + problemTitle + ", problemDesc=" + problemDesc
				+ ", inputDesc=" + inputDesc + ", outputDesc=" + outputDesc + ", inputSample=" + inputSample
				+ ", outputSample=" + outputSample + ", notice=" + notice + ", source=" + source
				+ ", standardProgramPath=" + standardProgramPath + ", standardProgramName=" + standardProgramName
				+ ", randomProgramPath=" + randomProgramPath + ", randomProgramName=" + randomProgramName
				+ ", gcovFilePath=" + gcovFilePath + ", gcovFileName=" + gcovFileName + ", submitTime=" + submitTime
				+ ", workdir=" + workdir + ", workstation=" + workstation + ", submitTimeStr=" + submitTimeStr + "]";
	}
	
}

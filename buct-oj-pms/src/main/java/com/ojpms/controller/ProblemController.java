package com.ojpms.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ojpms.common.MyUtils;
import com.ojpms.dto.Coverage;
import com.ojpms.dto.Problem;
import com.ojpms.dto.Result;
import com.ojpms.service.CoverageService;
import com.ojpms.service.ProblemService;
import com.ojpms.service.ResultService;

import net.sf.json.JSONObject;

@Controller
@RequestMapping("/problem")
public class ProblemController {
	
	@Autowired
	ProblemService problemService;
	
	@Autowired
	ResultService resultService;
	
	@Autowired
	CoverageService coverageService;
	
	@RequestMapping("/addProblem")
	@ResponseBody
	public Object addProblem(String jsonString){
		JSONObject res = new JSONObject();
		if(StringUtils.isBlank(jsonString)){
			res.put("result", "failed");
			return res;
		}
		String str = MyUtils.decoder(jsonString);
		JSONObject jsonObject = JSONObject.fromObject(str);
		String title = jsonObject.getString("title");
		String desc = jsonObject.getString("desc");
		String inputDesc = jsonObject.getString("input_desc");
		String outputDesc = jsonObject.getString("output_desc");
		String inputSample = jsonObject.getString("input_sample");
		String outputSample = jsonObject.getString("output_sample");
		String notice = jsonObject.getString("notice");
		String source = jsonObject.getString("source");
		Problem problem = new Problem();
		problem.setProblemTitle(title);
		problem.setProblemDesc(desc);
		problem.setInputDesc(inputDesc);
		problem.setOutputDesc(outputDesc);
		problem.setInputSample(inputSample);
		problem.setOutputSample(outputSample);
		problem.setNotice(notice);
		problem.setSource(source);
		if(problemService.add(problem) > 1 ){
			res.put("result", "success");
			res.put("problem", problem);
			return res;
		}
		res.put("result", "failed");
		return res;
	}
	@RequestMapping("/queryByUid")
	@ResponseBody
	public Object queryByUid(String jsonString){
		JSONObject res = new JSONObject();
		if(StringUtils.isBlank(jsonString)){
			res.put("result", "failed");
			return res;
		}
		String str = MyUtils.decoder(jsonString);
		JSONObject jsonObject = JSONObject.fromObject(str);
		long uid = jsonObject.getLong("uid");
		List<Problem> problems = problemService.queryByUid(uid);
		for (Problem p : problems) {
			p.setSubmitTimeStr(MyUtils.converseDate(p.getSubmitTime()));
		}
		if(problems == null || problems.size() == 0){
			res.put("result", "failed");
			res.put("msg", "没有查询到相关记录");
			return res;
		}
		res.put("result", "success");
		res.put("problems", problems);
		return res;
	}
	
	@RequestMapping("/viewSFile")
	@ResponseBody
	public Object viewSFile(String jsonString) throws IOException{
		JSONObject res = new JSONObject();
		if(StringUtils.isBlank(jsonString)){
			res.put("result", "failed");
			return res;
		}
		String str = MyUtils.decoder(jsonString);
		JSONObject jsonObject = JSONObject.fromObject(str);
		long pid = jsonObject.getLong("pid");
		Problem problem = problemService.queryByPid(pid);
		
		String title = problem.getProblemTitle();
		String sfilePath = problem.getStandardProgramPath();
		String sfileName = problem.getStandardProgramName();
		File file = new File(sfilePath,sfileName);
		if(!file.exists()){
			res.put("result", "failed");
			res.put("msg", "标程文件不存在!");
			return res;
		}
		List<String> array = MyUtils.readFileToArray(file);
		res.put("result", "success");
		res.put("title", title);
		res.put("array", array);
		return res;
	}
	@RequestMapping("/viewRFile")
	@ResponseBody
	public Object viewRFile(String jsonString) throws IOException{
		JSONObject res = new JSONObject();
		if(StringUtils.isBlank(jsonString)){
			res.put("result", "failed");
			return res;
		}
		String str = MyUtils.decoder(jsonString);
		JSONObject jsonObject = JSONObject.fromObject(str);
		long pid = jsonObject.getLong("pid");
		Problem problem = problemService.queryByPid(pid);
		
		String title = problem.getProblemTitle();
		String rfilePath = problem.getRandomProgramPath();
		String rfileName = problem.getRandomProgramName();
		File file = new File(rfilePath,rfileName);
		if(!file.exists()){
			res.put("result", "failed");
			res.put("msg", "随机程序文件不存在!");
			return res;
		}
		List<String> array = MyUtils.readFileToArray(file);
		res.put("result", "success");
		res.put("title", title);
		res.put("array", array);
		return res;
	}
	@RequestMapping("/viewResultSet")
	@ResponseBody
	public Object viewResultSet(String jsonString){
		JSONObject res = new JSONObject();
		if(StringUtils.isBlank(jsonString)){
			res.put("result", "failed");
			return res;
		}
		String str = MyUtils.decoder(jsonString);
		JSONObject jsonObject = JSONObject.fromObject(str);
		long pid = jsonObject.getLong("pid");
		List<Result> results = new ArrayList<Result>();
		results = resultService.queryByPid(pid);
		String problemTitle = problemService.queryByPid(pid).getProblemTitle();
		if(results == null || results.size() == 0){
			res.put("result", "failed!");
			res.put("msg", "没有查询到相关记录!");
			return res;
		}
		for(int i = 0; i < results.size(); i++){
			String s = "";
			JSONObject jsonObject2 = JSONObject.fromObject(results.get(i).getCoverage());
			Map<Integer, Boolean> map = jsonObject2;
			Iterator iterator = map.entrySet().iterator();
			while(iterator.hasNext()){
				Entry<Integer, Boolean> entry = (Entry<Integer, Boolean>) iterator.next();
				if (entry.getValue() == true) { 
					s += entry.getKey()+",";
				}
			}
			results.get(i).setCoverage(s);
		}
		
		Coverage coverage = coverageService.queryByPid(pid);
		Coverage insertCoverage = coverage;
		insertCoverage.setPid(pid+100);
		coverageService.addCoverage(insertCoverage);
		String report = "共生成 "+results.size()+" 条测试用例!\n"
				+ "覆盖率为 "+coverage.getCoverageRate()*100+"%\n"
				+ "未覆盖代码行为: "+coverage.getUncoveredLines()+"\n";
		res.put("result", "success"); 
		res.put("array", results);
		res.put("report", report);
		res.put("title", problemTitle);
		res.put("coverage", coverage);
		return res;
	}
	@RequestMapping("/viewDetail")
	@ResponseBody
	public Object viewDetail(String jsonString){
		JSONObject res = new JSONObject();
		if(StringUtils.isBlank(jsonString)){
			res.put("result", "failed");
			return res;
		}
		String str = MyUtils.decoder(jsonString);
		JSONObject jsonObject = JSONObject.fromObject(str);
		long pid = jsonObject.getLong("pid");
		Problem problem = problemService.queryByPid(pid);
		res.put("result", "success");
		res.put("problem", problem);
		return res;
	}
	@RequestMapping("/download")
	@ResponseBody
	public Object download(String jsonString){
		JSONObject res = new JSONObject();
		return res;
	}
	
}

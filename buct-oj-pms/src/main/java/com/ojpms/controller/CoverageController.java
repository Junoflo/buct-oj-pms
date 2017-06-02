package com.ojpms.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ojpms.common.MyUtils;
import com.ojpms.dto.Problem;
import com.ojpms.service.CoverageService;
import com.ojpms.service.ProblemService;
import com.ojpms.service.ResultService;

import net.sf.json.JSONObject;
@Controller
@RequestMapping("/coverage")
public class CoverageController {
	
	@Autowired
	ProblemService problemService;
	
	@Autowired
	CoverageService coverageService;
	
	@Autowired
	ResultService resultService;
	
	@RequestMapping("/getUncoveredLines")
	@ResponseBody
	public Object getUncoveredLines(String jsonString) throws IOException{
		JSONObject res = new JSONObject();
		if(jsonString == null){
			res.put("result", "failed");
			return res;
		}
		String str = MyUtils.decoder(jsonString);
		JSONObject jsonObject = JSONObject.fromObject(str);
		long pid = jsonObject.getLong("pid");
		
		Problem problem = problemService.queryByPid(pid);
		
		String title = problem.getProblemTitle();
		String gcovFilePath = problem.getGcovFilePath();
		String gcovFileName = problem.getGcovFileName();
		File file = new File(gcovFilePath,gcovFileName);
		if(!file.exists()){
			res.put("result", "failed");
			res.put("msg", "gcov文件未找到");
			return res;
		}
		FileReader fr = new FileReader(file);
		BufferedReader br = new BufferedReader(fr);
		String s = null;
		List<String> array = new ArrayList();
		while((s = br.readLine()) != null){
			array.add(s);
		}
		br.close();
		fr.close();
		res.put("result", "success");
		res.put("array", array);
		res.put("title", title);
		res.put("uncoveredLines",coverageService.queryByPid(pid).getUncoveredLines().trim());
		
		return res;
	}
	
	@RequestMapping("/viewCoverage")
	@ResponseBody
	public Object viewCoverage(String jsonString) throws IOException{
		JSONObject res = new JSONObject();
		if(jsonString == null){
			res.put("result", "failed");
			return res;
		}
		String str = MyUtils.decoder(jsonString);
		JSONObject jsonObject = JSONObject.fromObject(str);
		long pid = jsonObject.getLong("pid");
		long resultId = jsonObject.getLong("result_id");
		Problem problem = problemService.queryByPid(pid);
		
		String title = problem.getProblemTitle();
		String gcovFilePath = problem.getGcovFilePath();
		String gcovFileName = problem.getGcovFileName();
		File file = new File(gcovFilePath,gcovFileName);
		if(!file.exists()){
			res.put("result", "failed");
			res.put("msg", "gcov文件未找到");
			return res;
		}
		FileReader fr = new FileReader(file);
		BufferedReader br = new BufferedReader(fr);
		String s = null;
		List<String> array = new ArrayList();
		while((s = br.readLine()) != null){
			array.add(s.substring(s.indexOf(":") + 1,s.length()));
		}
		br.close();
		fr.close();
		String coverage = resultService.queryById(resultId).getCoverage();
		res.put("result", "success");
		res.put("array", array);
		res.put("title", title);
		res.put("lines",coverage.substring(coverage.indexOf('{') + 1, coverage.indexOf('}')));
		return res;
	}
	
	
}

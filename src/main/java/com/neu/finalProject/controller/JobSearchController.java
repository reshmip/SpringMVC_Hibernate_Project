package com.neu.finalProject.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.neu.finalProject.dao.JobDAO;
import com.neu.finalProject.pojo.JobPost;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

@Controller
public class JobSearchController {
	
	@RequestMapping(value="/searchJobByKey.htm",method=RequestMethod.POST)
	public String getSearchResult(@RequestParam("key") String title,@RequestParam("loc") String location,
			Model model,HttpServletResponse hsr1) throws Exception{
		System.out.println("inside search contr");
		List<JobPost> searchList = new ArrayList<JobPost>();
		String key = title.toLowerCase();
		String loc = location.toLowerCase();
		JobDAO jobDao = new JobDAO();
		//if(action.equalsIgnoreCase("searchJob")){
		if(!(key.isEmpty()&&loc.isEmpty())){
			searchList = jobDao.getJobByKeyLoc(key,loc);
			model.addAttribute("jobList",searchList);
			if(searchList.size()>0){
				model.addAttribute("success",true);
			}else{
				model.addAttribute("error",false);
			}
		}
		if(!key.isEmpty() && loc.isEmpty()){
			searchList = jobDao.getJobByKey(key);
			System.out.println("list size:" +searchList.size());
			model.addAttribute("joblist",searchList);
			if(searchList.size()>0){
				model.addAttribute("success",true);
			}else{
				model.addAttribute("error",false);
			}
		}
		if(key.isEmpty() && !loc.isEmpty()){
			searchList = jobDao.getJobByLoc(loc);
			model.addAttribute("joblist", searchList);
			if(searchList.size()>0){
				model.addAttribute("success",true);
			}else{
				model.addAttribute("error",false);
			}
		}
			
			//JSONObject obj = new JSONObject();
            //obj.put("joblist", searchList);
            //PrintWriter out = hsr1.getWriter();
            //out.println(obj);
					
		
		return "home";
		
	}
	
	@RequestMapping(value="/searchJobKey.htm",method=RequestMethod.POST)
	public String getSeachResult(@RequestParam("key") String title,@RequestParam("loc") String location,
			Model model,HttpServletResponse hsr1) throws Exception{
		System.out.println("inside search contr");
		List<JobPost> searchList = new ArrayList<JobPost>();
		JobDAO jobDao = new JobDAO();
		String key = title.toLowerCase();
		String loc = location.toLowerCase();
		//if(action.equalsIgnoreCase("searchJob")){
			searchList = jobDao.getJobByKey(key);
			System.out.println("list size:" +searchList.size());
			model.addAttribute("joblist",searchList);
			if(!(key.isEmpty()&&loc.isEmpty())){
				searchList = jobDao.getJobByKeyLoc(key,loc);
				model.addAttribute("jobList",searchList);
				if(searchList.size()>0){
					model.addAttribute("success",true);
				}else{
					model.addAttribute("error",false);
				}
			}
			if(!key.isEmpty() && loc.isEmpty()){
				searchList = jobDao.getJobByKey(key);
				System.out.println("list size:" +searchList.size());
				model.addAttribute("joblist",searchList);
				if(searchList.size()>0){
					model.addAttribute("success",true);
				}else{
					model.addAttribute("error",false);
				}
			}
			if(key.isEmpty() && !loc.isEmpty()){
				searchList = jobDao.getJobByLoc(loc);
				model.addAttribute("joblist", searchList);
				if(searchList.size()>0){
					model.addAttribute("success",true);
				}else{
					model.addAttribute("error",false);
				}
			}
					
		
		return "jobSeekerSeachJobs";
		
	}
}

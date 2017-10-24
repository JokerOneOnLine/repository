package org.lanqiao.handler.company;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.lanqiao.entity.company.CompanyRegist;
import org.lanqiao.service.company.TagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 
 * 渭南师范二期-张金浩 2017年8月24日下午4:10:11
 */
@RequestMapping("tag")
@Controller
public class TagController {
	@Autowired
	TagService tagService;

	// 增加标签
	@RequestMapping(value="insertTag",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> insertTag(String[] tagList,HttpSession httpSession) {
		int companyId = (int) httpSession.getAttribute("Id");
		boolean b = tagService.insertTag(tagList,companyId);
		Map<String, Object> result = null;  
        if(b==false){  
            result = new HashMap<String, Object>();  
            result.put("msg", "请稍后重试！");  
            return result;  
        }
	    return result; 
	}

	// 删
	@RequestMapping(value = "deleteTag", method = RequestMethod.DELETE)
	public String deleteTag(@PathVariable Integer id) {
		tagService.deleteTag(id);
		return "company/companyTag";
	}

}

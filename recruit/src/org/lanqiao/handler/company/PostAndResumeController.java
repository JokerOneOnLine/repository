package org.lanqiao.handler.company;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.lanqiao.entity.company.PostAndResume;
import org.lanqiao.entity.user.MyResume;
import org.lanqiao.service.company.PostAndResumeService;
import org.lanqiao.service.user.MyResumeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
/**
 * 
 * @author 渭南师范二期-许园园
 *2017年9月9日 上午11:37:16
 */
@Controller
public class PostAndResumeController {
	@Autowired
	PostAndResumeService postAndResumeService;
	@Autowired
	MyResumeService myResumeService;
	/**
	 * 投简历
	 *渭南师范二期-许园园
	 *2017年9月9日 上午11:40:00 
	 *@return
	 *@throws IOException 
	 */
	@RequestMapping("insertpar")
	public void insertpar(Integer userId,Integer postId,HttpServletResponse response) throws IOException{
		int i=0;
		PrintWriter out = response.getWriter();
		MyResume myResume = myResumeService.getMyResumeByUserId(userId);
		List<PostAndResume> postAndResumes = postAndResumeService.selectpar(postId);
		if(myResume!=null){
			for(PostAndResume par :postAndResumes){
				if(par.getResumeId()==myResume.getId()){
					i=-1;
				}
			}
			if(i!=-1){
				PostAndResume postAndResume = new PostAndResume(postId,myResume.getId());
				i = postAndResumeService.insertPar(postAndResume);
			}
		}
		if(i==1){
			out.print(1);
		}
		if(i==-1){
			out.print(2);
		}
		if(i==0){
			out.print(0);
		}
	}
}

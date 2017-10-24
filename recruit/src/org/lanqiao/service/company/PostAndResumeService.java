package org.lanqiao.service.company;

import java.util.List;

import org.lanqiao.entity.company.PostAndResume;
import org.lanqiao.mapper.company.PostAndResumeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
/**
 * 投简历
 * @author 渭南师范二期-许园园
 *2017年9月9日 上午11:29:50
 */
@Service
public class PostAndResumeService {
	@Autowired
	PostAndResumeMapper postAndResumeMapper;
	//增加职位和简历的对应(投个简历)
	public int insertPar(PostAndResume postAndResume){
		return postAndResumeMapper.insertpar(postAndResume);
	}
	//根据职位id查询该职位的所有简历
	public List<PostAndResume> selectpar(Integer postId){
		return postAndResumeMapper.selectpar(postId);
	}
	public List<PostAndResume> getByResumeId(Integer id) {
		return postAndResumeMapper.getByResumeId(id);
	}
	
}

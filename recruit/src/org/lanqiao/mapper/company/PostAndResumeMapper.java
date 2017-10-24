package org.lanqiao.mapper.company;

import java.util.List;

import org.lanqiao.entity.company.PostAndResume;
/**
 * 
 * @author 渭南师范二期-许园园
 *2017年9月9日 上午10:19:28
 */
public interface PostAndResumeMapper {
	//投个简历(增加一条对应的PostAndResume记录)
	int insertpar(PostAndResume postAndResume);
	//根据职位id查询该职位的所有简历
	List<PostAndResume> selectpar(Integer postId);
	//根据简历id查询该简历的投递的所有职位
	List<PostAndResume> getByResumeId(Integer resumeId);
}

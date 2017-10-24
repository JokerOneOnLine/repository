package org.lanqiao.mapper.company;

import java.util.List;

import org.lanqiao.entity.company.Tag;

/**
 * 
 *渭南师范二期-张金浩
 * 2017年8月24日上午10:09:07
 */
public interface TagMapper {
	
	//标签的增加
	int insertTagTocompany (Tag t);
	
	//根据公司id获取标签
	List<Tag> getTagByCompanyId(int companyId);
	
	//标签的删除
	boolean deleteTag (int id);
	
	//根据标签id查询
	String getStrTagById(int id);

}

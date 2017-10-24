package org.lanqiao.service.company;

import org.lanqiao.entity.company.Tag;
import org.lanqiao.mapper.company.TagMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 渭南师范二期-张金浩 2017年8月24日上午8:40:43
 * 
 * @author Administrator
 */
@Service
public class TagService {
	@Autowired
	TagMapper tagMapper;
	
	//添加标签
	public boolean insertTag(String[] tagList, int companyId) {
		boolean boo = true;
		for (String tag : tagList) {
			Tag t = new Tag(tag, companyId);
			int i = tagMapper.insertTagTocompany(t);
			if (i == 0) {
				boo = false;
				break;
			}
		}
		return boo;
	}

	/**
	 * 删除Tag的content 渭南师范二期-张金浩 2017年8月24日上午9:52:32
	 */
	public boolean deleteTag(int id) {
		return tagMapper.deleteTag(id);
	}

}

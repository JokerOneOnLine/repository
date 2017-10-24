package org.lanqiao.mapper.company;

import java.util.List;

import org.lanqiao.entity.company.Label;

/**
 * 
 *渭南师范二期-张金浩
 * 2017年8月24日上午11:48:58
 */
public interface LabelMapper {
		//根据公司id查询其标签id集合
		List<Integer> getTagIds(int companyId);
		
		//增加
		boolean insertLabel (Label label);
		
		//删除
		boolean deleteLabel (int id);
		
		//更改
		int updateLabel (Label label);

		//查询
		Label getLabelById(int id);
		
		//查询集合
		List<Label> getLabels();
}

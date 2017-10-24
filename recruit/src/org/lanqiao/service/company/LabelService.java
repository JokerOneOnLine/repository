package org.lanqiao.service.company;

import java.util.List;

import org.lanqiao.entity.company.Label;
import org.lanqiao.entity.company.Tag;
import org.lanqiao.mapper.company.LabelMapper;
import org.lanqiao.mapper.company.TagMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 渭南师范二期-张金浩 2017年8月24日上午8:40:43
 * 
 * @author Administrator
 */
@Service
public class LabelService {
	@Autowired
	LabelMapper labelMapper;

	/**
	 * 增加Tag的content 渭南师范二期-张金浩 2017年8月24日上午9:52:05
	 */
	public boolean insertLabel(Label label) {
		return labelMapper.insertLabel(label);
	}

	/**
	 * 删除Tag的content 渭南师范二期-张金浩 2017年8月24日上午9:52:30
	 */
	public boolean deleteTag(int id) {
		return labelMapper.deleteLabel(id);
	}

	/**
	 * 
	 * 更改Tag的content 渭南师范二期-张金浩 2017年8月24日上午9:52:50
	 */
	public int updateTag(Label label) {
		return labelMapper.updateLabel(label);
	}

	/**
	 * 查询 渭南师范二期-张金浩 2017年8月24日上午9:53:13
	 */
	public Label getLabelById(int id) {
		return labelMapper.getLabelById(id);
	}

	/**
	 * 查询标签集合 渭南师范二期-张金浩 2017年8月24日上午10:11:19
	 */
	public List<Label> getLabels() {
		return labelMapper.getLabels();
	}

}

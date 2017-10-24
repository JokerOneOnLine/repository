package org.lanqiao.service.user;

import java.util.List;

import org.lanqiao.entity.user.Position;
import org.lanqiao.mapper.user.PositionMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author layla 
 * 渭南师范二期梁琼
 * 2017年8月24日 下午4:06:08
 */
@Service
public class PositionService {
	@Autowired
	PositionMapper pm;
	
	//查询三级职位是否存在
	public Position selectByName(String name){
		return pm.selectByName(name);
	}
	
	//根据position2Id查询所有的三级职位
	public List<Position> selectPosition(int id){
		List<Position> list = pm.selectPosition(id);
		return list;
	}
	//增加一个三级职位
	public int insertPosition(Position position){
		int i = pm.insertPosition(position);
		return i; 
	}
	//修改一个三级职位
	public int updatePosition(Position position){
		int i = pm.updatePosition(position);
		return i;
	}
	//删除一个三级职位
	public int deletePosition(int id){
		int i = pm.deletePosition(id);
		return i;
	}
	
	/**
	 *渭南师范二期—杨璐@return
	 * 2017年8月25日上午10:56:24
	 * @param id
	 * @return
	 * 根据id获取对象
	 */
	public Position selectPositionById( int id) {
		return pm.selectPositionById(id);
	}
	
	/**
	 *渭南师范二期-李晨
	 *2017年8月24日下午10:36:29
	 */
	@Autowired
	PositionMapper positionMapper;
	//根据关键字进行模糊查询
	public List<Position> selectKeys(String key){
		return positionMapper.likeSelectKeysByName(key);
	}
	
	/**
	 * 分页显示要查询二级职位的名字
	 *渭南师范二期-刘如艳
	 *2017年8月27日下午11:36:46
	 * @param id
	 * @return
	 */
	
	public String getPositionName(int id){
		String name = pm.getPosition(id);
		return name;
	}
	
	public Integer getId(String name){
		Integer id = pm.getId(name);
		return id;
	}
} 



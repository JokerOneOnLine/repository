package org.lanqiao.service.user;

import java.util.List;

import org.lanqiao.entity.user.Position2;
import org.lanqiao.mapper.user.Position2Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 
 * @author layla 
 * 渭南师范二期梁琼
 * 2017年8月24日 下午3:15:42
 */
@Service
public class Position2Service {
	@Autowired
	Position2Mapper p2m;
	//查询不带三级职位信息的 二级职位
		public List<Position2> getPositions3(int id){
			List<Position2> list = p2m.getPosition2(id);
			return list;
		}
	//查询带有三级职位信息的 二级职位
	public List<Position2> selectPositions3(int id){
		List<Position2> list = p2m.selectPosition2(id);
		return list;
	}
	//增加二级职位
	public int insertPosition2(Position2 p2){
		int i = p2m.insertPosition2(p2);
		return i;
	}
	//删除二级职位
	public int deletePosition2(int id){
		int i = p2m.deletePosition2(id);
		return i;
	}
	//更新二级职位
	public int updatePosition2(Position2 p2){
		int i = p2m.updatePosition2(p2);
		return i;
	}
	/**
	 * 分页显示要查询二级职位的名字
	 *渭南师范二期-刘如艳
	 *2017年8月27日下午11:36:46
	 * @param id
	 * @return
	 */
	
	public String getPosition2Name(int id){
		String name = p2m.getPositions(id);
		return name;
	}
	public Integer getId(String name){
		Integer id = p2m.getId(name);
		return id;
	}
	public Integer getPosition2IdByp1IdAndP2Name(String name,Integer id){
		Integer p2Id = p2m.getPosition2IdByp1IdAndP2Name(name,id);
		return p2Id;
	}
	
	//查询所有二级职位
	public List<Position2> getAllPositions(){
		List<Position2> position2 = p2m.selectAllPosition2();
		return position2;
	}
	public int getIdByP3Id(int id) {
		return p2m.getIdByP3Id(id);
	}
	
}

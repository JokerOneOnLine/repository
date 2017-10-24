package org.lanqiao.service.user;

import java.util.List;

import org.lanqiao.entity.user.Position1;
import org.lanqiao.entity.user.Position2;
import org.lanqiao.mapper.user.Position1Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 
 * @author 渭南师范二期-许园园
 *2017年8月24日 下午5:44:33
 */
@Service
public class Position1Service {
	@Autowired
	Position1Mapper position1Mapper;
	//查询所有一级职位
	public List<Position1> selectPositions1(){
		return position1Mapper.selectPositions1();
	}
	//根据一级职位id查询一个带有二级职位的一级职位
	public List<Position2> selectPositions2(int p1Id){
		return position1Mapper.selectPositions2(p1Id);
	}
	//插入一个一级职位
	public int insertPosition1(Position1 position1){
		return position1Mapper.insertPosition1(position1);
	}
	//删除一个一级职位
	public int deletePosition1(int id){
		return position1Mapper.deletePosition1(id);
	}
	//更新一个职位
	public int updatePosition1(Position1 position1){
		return position1Mapper.updatePosition1(position1);
	}
	
}

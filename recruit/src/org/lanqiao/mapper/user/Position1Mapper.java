package org.lanqiao.mapper.user;

import java.util.List;

import org.lanqiao.entity.user.Position1;
import org.lanqiao.entity.user.Position2;

/**
 * 一级职位增删改查
 * @author 渭南师范二期-许园园
 *2017年8月24日 下午4:37:49
 */
public interface Position1Mapper {
	//查询所有一级职位
	List<Position1> selectPositions1();
	//根据一级id查询对应的二级职位
	List<Position2> selectPositions2(int p1Id);
	//增加一个一级职位
	int insertPosition1(Position1 position1);
	//更新一个一级职位
	int updatePosition1(Position1 position1);
	//删除一个一级职位
	int deletePosition1(int p1Id);
	
}

package org.lanqiao.mapper.user;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.lanqiao.entity.user.Position;

/**
 * 
 * 第二次更新  渭南师范二期  李晨晨
 * 
 * 三级职位增删改查
 * @author 渭南师范二期-许园园
 *2017年8月24日 下午1:51:59
 */
public interface PositionMapper {
	//根据二级职位id查询对应的三级职位
	List<Position> selectPosition(int p2_id);
	//插入一个三级职位
	int insertPosition(Position position);
	//修改一个三级职位
	int updatePosition(Position position);
	//删除一个三级职位
	int deletePosition(int id);
	//根据三级职位的id获取一个对象
	Position selectPositionById(int id);
	//根据关键字进行模糊查询
	List<Position> likeSelectKeysByName(@Param("name") String key);
	/**
	 * 分页显示职位根据ID查询三级职位的名字
	 *渭南师范二期-刘如艳
	 *2017年8月27日下午11:40:50
	 * @param id
	 * @return
	 */
	
	
	String getPosition(int id);
	Integer getId(String name);
	/**
	 * 查询三级职位是否存在
	 *渭南师范二期-张四宝 
	 * 2017年9月8日 下午5:03:28
	 * @param name
	 * @return
	 */
	Position selectByName(String name);
}

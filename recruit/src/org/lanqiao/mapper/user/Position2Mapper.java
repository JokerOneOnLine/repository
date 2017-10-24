package org.lanqiao.mapper.user;

import java.util.List;

import org.lanqiao.entity.user.Position2;

/**
 * 
 * @author layla 渭南师范二期梁琼 2017年8月24日 上午11:53:19
 */
public interface Position2Mapper {

	// 根据以及职位id和二级职位名字查询二级职位的id
	Integer getPosition2IdByp1IdAndP2Name(String name, int id);

	// 根据一级id查询不带三级职位的二级职位集合
	List<Position2> getPosition2(int id);

	// 根据一级id查询带着三级职位的二级职位集合
	List<Position2> selectPosition2(int id);

	// 添加二级职位
	int insertPosition2(Position2 p2);

	// 删除二级职位
	int deletePosition2(int id);

	// 更新二级职位
	int updatePosition2(Position2 p2);

	// 分页显示职位根据ID查询二级职位的名字(刘如艳)
	String getPositions(int id);

	Integer getId(String name);

	// 查询所有二级职位
	List<Position2> selectAllPosition2();

	int getIdByP3Id(int id);
}

package org.lanqiao.mapper.company;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.lanqiao.entity.company.Post;
import org.lanqiao.entity.company.PostSearch;
import org.lanqiao.entity.company.Tag;
import org.lanqiao.entity.company.postDetail;
import org.springframework.stereotype.Repository;

/**
 * 
 * 加了通过companyid查询本公司上下线职位    代旭波
 * 
 * 职位的增删改查
 * 
 * @author 蓝桥软件学院 渭南师范二期-郝磊 2017年8月25日 下午3:48:50
 */

@Repository
public interface PostMapper {
	// 增加一个职位信息
	int insertPost(Post post);

	// 删除一个职位信息
	int deletePost(int id);

	// 修改一个职位信息
	int updatePost(Post post);

	// 查询一个职位信息
	Post selectPost(int id);

	// 查询所有职位
	List<Post> selectAll();
	
	//查询带着公司基本信息的post
	Post select(int id);
	
	// 模糊查询公司ID
	List<PostSearch> selectPostLike(@Param("keyName") String keyName,@Param("wName")int wName,@Param("eName") int eName,@Param("min")int min,@Param("max")int max,@Param("city")String city);

	// 查询公司所有的post的方法
	List<Post> getPostByCompanyId(int companyID);
/**
 * 刘如艳修改为用分页查询上下线的职位
 *渭南师范二期-刘如艳
 *2017年8月27日上午9:37:01
 * @param pageNo
 * @param pageSize
 * @param onlineOrNotOnline
 * @return
 */
	// 查询某公司的上线职位
//	List<Post> getOnlinePost(int companyid);
//
//	// 查询某公司的下线职位
//	List<Post> getOutlinePost(int companyid);
	List<Post> queryPost(@Param("online")int online,@Param("companyID")Integer companyID,@Param("pageSize")Integer pageSize,@Param("startIndex")Integer startIndex);
	List<Post> queryPosts(@Param("online")int online,@Param("companyID")Integer companyID);
	
	Integer getCount(@Param("online")int online,@Param("companyID")Integer companyID);

	List<Post>  selectPostAndResmes(@Param("postName")int postName,@Param("companyID")int companyID);

	List<Post> selectMyPost(@Param("userId")int userId);

	/**
	 * 
	 * @author layla 
	 * 渭南师范二期梁琼
	 * 2017年9月27日 下午9:52:01
	 * @param id
	 * @return
	 */
	postDetail selectDetails(@Param("id") int id);
	List<Tag> selectCompanyTags(@Param("id") int id);
	
}
package org.lanqiao.service.company;

import java.util.List;

import org.lanqiao.entity.company.Post;
import org.lanqiao.entity.company.PostSearch;
import org.lanqiao.entity.company.Tag;
import org.lanqiao.entity.company.postDetail;
import org.lanqiao.mapper.company.PostMapper;
import org.lanqiao.page.PostPage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 
 * 加了通过companyid查询本公司上下线职位    代旭波
 * 
 * @author 蓝桥软件学院 渭南师范二期-郝磊 2017年8月25日 下午3:49:27
 */

@Service
public class PostService {
	@Autowired
	PostMapper postMapper;

	// 增加一个职位信息
	public int insertPost(Post post) {
		return postMapper.insertPost(post);
	}

	// 删除一个职位信息
	public int deletePost(int id) {
		return postMapper.deletePost(id);
	}

	// 修改一个职位信息
	public int updatePost(Post post) {
		return postMapper.updatePost(post);
	}

	// 查询一个职位信息
	public Post selectPost(int id) {
		return postMapper.selectPost(id);
	}

	// 模糊查询公司ID
	public List<PostSearch> selectPostLike(String keyName,int wName,int eName,int min,int max,String city) {
		 List<PostSearch> list = postMapper.selectPostLike(keyName,wName,eName,min,max,city);
		 return list; 
	}

	// 查询所有
	public List<Post> selectAll() {
		return postMapper.selectAll();
	}

	// 徐总让我加一个查询公司所有的post的方法
	public List<Post> getPostByCompanyId(int companyId) {
		List<Post> posts = postMapper.getPostByCompanyId(companyId);
		return posts;
	}
/**
 * 刘如艳修改为分页查询上下线职位 
 *渭南师范二期-刘如艳
 *2017年8月27日上午9:37:53
 * @param pageNo
 * @param pageSize
 * @param onlineOrNotOnline
 * @return
 */
	// 查询某公司的上线职位
//	public List<Post> getOnlinePost(int companyid) {
//		return postMapper.getOnlinePost(companyid);
//	}
//
//	// 查询某公司的下线职位
//	public List<Post> getOutlinePost(int companyid) {
//		return postMapper.getOutlinePost(companyid);
//	}
	
	
	public List<Post> getAll(int onlineOrNotOnline,Integer companyId){
		return  postMapper.queryPosts(onlineOrNotOnline, companyId);
		
		
		
	}
	public  PostPage queryPostPage(int pageNo,int pageSize,int onlineOrNotOnline,Integer baseinforid,Integer startIndex){
		
		PostPage page=new PostPage();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		page.setStartIndex(startIndex);
		Integer count = postMapper.getCount(onlineOrNotOnline, baseinforid);
//		page.setCount(count);
		int totalPage=0;
		if(count!=null){
			if(count%pageSize==0){
				totalPage=count/pageSize;
				page.setTotalPage(totalPage);
			}else{
				totalPage=count/pageSize+1;
				page.setTotalPage(totalPage);
			}
		}
	
		List<Post> posts = postMapper.queryPost(onlineOrNotOnline, baseinforid,startIndex,pageSize);
		page.setPosts(posts);
		return page;
		
	}

	public List<Post>selectostAndResumes(int postName,int companyID){
		return postMapper.selectPostAndResmes(postName,companyID);
	}
/**
 * 
 * @author layla 
 * 渭南师范二期梁琼
 * 2017年9月27日 下午9:52:38
 * @param id
 * @return
 */
	public postDetail selectDetails(int id) {
		return postMapper.selectDetails(id);
	}
	public List<Tag> selectCompanyTags(int id) {
		return postMapper.selectCompanyTags(id);
	}

	
	
}

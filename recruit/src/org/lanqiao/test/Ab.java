package org.lanqiao.test;

import java.util.List;

import org.junit.Test;
import org.lanqiao.entity.company.Post;
import org.lanqiao.mapper.company.PostMapper;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * 测试类
 * @author 渭南师范二期-许园园
 *2017年8月25日 上午8:23:17
 */
public class Ab {
	@Test
	public void tetstA() {
		ClassPathXmlApplicationContext ac = new ClassPathXmlApplicationContext("applicationContext.xml");
		PostMapper post = (PostMapper) ac.getBean("postMapper");
		List<Post> list = post.getPostByCompanyId(70);
		for(Post p:list) {
			System.out.println("id:****************"+p.getId());
			
		}
	}

}

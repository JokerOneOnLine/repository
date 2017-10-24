package org.lanqiao.mapper.user;

import org.lanqiao.entity.user.Practice;

/**
 * 渭南师范二期-王笑
 *2017年8月25日 下午3:55:26
 * @author wld
 *
 */

public interface PracticeMapper {
	Practice selectPractice(int id);

	int deletePractice(int id);

	int insertPractice(Practice practice);

	int updatePractice(Practice practice);
	
	Practice selectPracticeByMyResumeId(int myresumeid);
	
	Practice getPracticeByUserid(int userid);
}

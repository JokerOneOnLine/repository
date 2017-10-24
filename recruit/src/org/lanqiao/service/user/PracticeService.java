package org.lanqiao.service.user;

import org.lanqiao.entity.user.Practice;
import org.lanqiao.mapper.user.PracticeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 渭南师范二期-王笑
 *2017年8月25日 下午3:55:50
 * @author wld
 *
 */
@Service
public class PracticeService {

	@Autowired
	PracticeMapper practicemapper;

	/**
	 * 渭南师范二期-王笑
	 *2017年8月25日 下午3:55:40
	 * @param id
	 * @return
	 */

	public Practice selectPractice(int id) {

		return practicemapper.selectPractice(id);
	}

	public int deletePractice(int id) {

		return practicemapper.deletePractice(id);
	}

	public int insertPractice(Practice practice) {

		return practicemapper.insertPractice(practice);
	}

	public int updatePractice(Practice practice) {

		return practicemapper.updatePractice(practice);
	}
	
	public Practice selectPracticeByMyResumeId(int myResumeId){
		
		return practicemapper.selectPracticeByMyResumeId(myResumeId);
	}
	
	public Practice getPracticeByUserid(int userid){
		return practicemapper.getPracticeByUserid(userid);
	}

}

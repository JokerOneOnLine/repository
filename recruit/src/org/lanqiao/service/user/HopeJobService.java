package org.lanqiao.service.user;

import java.util.ArrayList;
import java.util.List;

import org.lanqiao.entity.user.HopeJob;
import org.lanqiao.entity.user.Position;
import org.lanqiao.mapper.user.HopeJobMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class HopeJobService {
	@Autowired
	PositionService positionService;
	@Autowired
	HopeJobMapper hopejobMapper;

	/**
	 * 
	 * 渭南师范二期—杨璐@param myResumeId 渭南师范二期—杨璐@return 2017年8月24日下午10:38:32
	 * 
	 * @param myResumeId
	 * @return 查询hopejob
	 */
	public HopeJob selectHopeJob(int myResumeId) {
		HopeJob hopeJob = hopejobMapper.selectHopeJobsByMyResumedId(myResumeId);
		return hopeJob;
	}

	/**
	 * 渭南师范二期—杨璐@return 2017年8月24日下午9:34:20
	 * 
	 * @param myResumeId
	 * @return 根据简历id删除期望工作 渭南师范二期—杨璐@param myResumeId
	 */
	public int deleteHopeJob(int id) {
		HopeJob hopeJob = hopejobMapper.selectHopeJobsById(id);
		int i=1;
		//先删职位
		if(hopeJob.getPositions().size()!=0) {
			for( Position p:hopeJob.getPositions()) {
				i=hopejobMapper.deleteUserPositionsByHopeJobId(hopeJob.getId(), p.getId());
				if(i==0) {
					return i;
					
				}
				
			}
			
		}
		i=hopejobMapper.deleteHopeJobs(hopeJob.getId());
		
		return i;

	}

	/**
	 * 渭南师范二期—杨璐@param hopeJob 2017年8月24日下午9:32:08
	 * 
	 * @param hopeJob
	 * @param id
	 * @return 新增或更新一个期望工作 渭南师范二期—杨璐@param id
	 */
	public int insertOrUpdate(HopeJob hopeJob) {
		List<Position> positions = new ArrayList<Position>();
		int i = 1;
		if (hopeJob == null) {
			return i;

		}
		if (hopeJob.getId() != null) {
			i = hopejobMapper.insertHopeJobBy(hopeJob);
			if (i == 0) {
				return i;
			}
			// 获取positions
			positions = hopeJob.getPositions();
			for (Position p : positions) {
				i = hopejobMapper.insertUserPosition(hopeJob.getId(), p.getId());
				if (i == 0) {
					return i;
				}
			}

		} // 更新
		else {
			i = hopejobMapper.updtaeHopeJob(hopeJob);
			if (i == 0) {
				return i;
			}
			for (Position p : positions) {
				i = hopejobMapper.updateUserPositionsByHopeJobId(hopeJob.getId(), p.getId());
				if (i == 0) {
					return i;
				}
			}

		}

		return i;
	}
	
	public int insertHopejob(HopeJob hopejob){
		int i = hopejobMapper.insertHopeJobBy(hopejob);
		return i;
	}
	
	public int updateHopejob(HopeJob hopejob){
		int i = hopejobMapper.updtaeHopeJob(hopejob);
		return i;
	}

	public HopeJob getHopejobByUserId(int userid) {
		return hopejobMapper.getHopejobByUserID(userid);
	}
}

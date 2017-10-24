package org.lanqiao.mapper.user;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.lanqiao.entity.user.HopeJob;
import org.lanqiao.entity.user.Position;

/**
 * 
 * @author渭南师范二期—杨璐 2017年8月23日下午10:26:49
 */

public interface HopeJobMapper {
	
	int insertHopeJobBy(HopeJob hopeJob);

	HopeJob selectHopeJobsByMyResumedId(int myResumeId);
	HopeJob selectHopeJobsById(int id);
	int updtaeHopeJob(HopeJob hopeJob);

	int deleteHopeJobs(int id);
	
	int insertUserPosition(@Param("hopejob_id")int hopeJobId, @Param("p3Id") int p3Id);
	
	int deleteUserPositionsByHopeJobId(@Param("hopejob_id")int hopeJobId, @Param("p3Id") int p3Id);
	
	int updateUserPositionsByHopeJobId(@Param("hopejob_id")int hopeJobId, @Param("p3Id") int p3Id);
	List<Position> selectUserPositionsByHopeJobId(int id);
	
	HopeJob getHopejobByUserID(int userid);

}

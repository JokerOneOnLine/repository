package org.lanqiao.mapper.user;

import org.apache.ibatis.annotations.Param;
import org.lanqiao.entity.user.User;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

@Repository
public interface UserMapper {
	/**
	 * 
	 *蓝桥软件学院 渭南师范二期-郝磊
	 *2017年8月23日 上午11:38:16
	 * @param 
	 * @return
	 */
	int insertUser(User user);
	User selectUser(int id);
	User selectUserByEmail(String email);
	User selectUserByEmailAndPwd(@Param("email")String email,@Param("pwd")String pwd);
	int updateUser(User user);
	int deleteUser(int id);
	int update(User user);
	User getUserById(int id);
	
	int userRegist(User user);
	
	User getUserInfo(int userId);
}

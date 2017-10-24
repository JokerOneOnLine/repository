package org.lanqiao.service.user;

import org.lanqiao.entity.user.User;
import org.lanqiao.mapper.user.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {
/**
	 * 
	 *蓝桥软件学院 渭南师范二期-郝磊
	 *2017年8月23日 下午16:42:16
	 * @param 
	 * @return
	 */
	@Autowired
	UserMapper userMapper;
	public int insertUser(User user){
		return userMapper.insertUser(user);
	}
	public User selectUser(int id){
		return userMapper.selectUser(id);
	}
	public User selectUserByEmail(String email){
		return userMapper.selectUserByEmail(email);
	}
	public User selectUserByEmailAndPwd(String email,String pwd){
		return userMapper.selectUserByEmailAndPwd(email,pwd);
	}
	public int updateUser(User user){
		return userMapper.updateUser(user);
	}
	public int deleteUser(int id){
		return userMapper.deleteUser(id);
	}
	public int update(User user){
		return userMapper.update(user);
	}
	public User getUserById(int id){
		return userMapper.getUserById(id);
	}
	
	public int userRegist(User user){
		return userMapper.userRegist(user);
	}
	
	public User getUserInfo(int userId){
		return userMapper.getUserInfo(userId);
	}
}

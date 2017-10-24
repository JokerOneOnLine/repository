package org.lanqiao.service.company;

import java.util.List;

import org.lanqiao.entity.company.BaseInfo;
import org.lanqiao.mapper.company.CompanyBaseInfoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 
 * 渭南师范二期-程建波
 * 2017年8月24日上午9:48:10
 */
@Service
public class BaseInfoService {

	@Autowired
	CompanyBaseInfoMapper cbi;

	/**
	 * 增加公司信息
	 *渭南师范二期-程建波
	 *2017年8月24日上午9:40:14
	 */
	public int insertBaseInfo(BaseInfo b) {

		return cbi.insertBaseInfo(b);
	}

	/**
	 * 删除公司信息
	 *渭南师范二期-程建波
	 *2017年8月24日上午9:41:27
	 */
	public int deleteBaseInfoByCompanyId(int id) {

		return cbi.deleteBaseInfoByCompanyId(id);
	}

	/**
	 * 更新公司信息
	 *渭南师范二期-程建波
	 *2017年8月24日上午9:42:08
	 */
	public int updataBaseInfoByCompanyId(BaseInfo b) {

		return cbi.updataBaseInfoByCompanyId(b);
	}

	/**
	 * 查询公司信息
	 *渭南师范二期-程建波
	 *2017年8月24日上午9:42:22
	 */
	public BaseInfo getBaseInfoByCompanyId(int id) {

		return cbi.getBaseInfoByCompanyId(id);
	}
	/**
	 * 根据城市查询公司
	 * 渭南师范二期-杨萌
	 * 2017年8月28日
	 * 下午3:31:46
	 * @param companyCity
	 * @return
	 */
	public List<BaseInfo> getBaseInfoByCompanyCity(String companyCity){	
		return cbi.getBaseInfoByCompanyCity(companyCity);
	}
	/**
	 * 查詢所有的公司
	 * 渭南师范二期-杨萌
	 * 2017年8月28日
	 * 下午3:33:49
	 * @return
	 */
	public List<BaseInfo> getAllCompany(){	
		return cbi.getAllCompany();
	}
}

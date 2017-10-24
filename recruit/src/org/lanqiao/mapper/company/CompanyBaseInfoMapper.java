package org.lanqiao.mapper.company;

import java.util.List;

import org.lanqiao.entity.company.BaseInfo;

/**
 * 增加根据城市ID查找公司详情
 * 2017年9月19 16:27 易孝凡
 * 
 * 
 * 增加根据城市查找公司和查询所有的公司
 * 渭南师范二期-杨萌
 * 2017年8月28日
 * 
 * 下午3:27:18
 * 渭南师范二期-程建波
 * 2017年8月24日上午8:53:50
 */

public interface CompanyBaseInfoMapper {
	int insertBaseInfo(BaseInfo b);

	int deleteBaseInfoByCompanyId(int id);

	int updataBaseInfoByCompanyId(BaseInfo b);

	BaseInfo getBaseInfoByCompanyId(int id);

	List<BaseInfo> getBaseInfoByCompanyCity(String companyCity);
	
	List<BaseInfo> getAllCompany();
	
	BaseInfo getBaseInfoByCompanyId();
}

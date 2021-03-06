package org.lanqiao.mapper.company;

import java.util.List;

import org.lanqiao.entity.company.CompanyRegist;
import org.lanqiao.entity.company.Post;

/**
 * 渭南师范二期-吴鹏飞、
 * 2017年8月23日 下午5:56:47
 * @author
 */
public interface CompanyMapper {
	CompanyRegist selectCompanyById(int id);
	
	int insertCompany(CompanyRegist companyRegist);
	int update(CompanyRegist companyRegist);
	
	int updateCompany(CompanyRegist companyRegist);
	
	int deleteCompany(int id);
	
	//根据email查询公司信息
	CompanyRegist selectCompanyByEmail(String email);
	
	//获取所有公司信息
	List<CompanyRegist> selectAllCompany();
	
	//审核
	int toAuthentication(int companyId);

	CompanyRegist getCompany(CompanyRegist company);
	
	
	CompanyRegist getCompanyById(int companyId);

	CompanyRegist getCompany(String email, String pwd);
	//查询未通过审核的公司
	List<CompanyRegist> getAllNoCompany(int a);

	CompanyRegist getCompanyByCompanyId(Integer companyId);
	//更新公司密码
//	int updatePwdByEmail(CompanyRegist cr);
}

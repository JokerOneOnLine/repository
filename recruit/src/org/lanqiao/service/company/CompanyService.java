package org.lanqiao.service.company;

import java.util.List;

import org.lanqiao.entity.company.CompanyRegist;
import org.lanqiao.mapper.company.CompanyMapper;
import org.lanqiao.mapper.company.LabelMapper;
import org.lanqiao.mapper.company.TagMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CompanyService {

	@Autowired
	CompanyMapper cm;
	@Autowired
	LabelMapper lm;
	@Autowired
	TagMapper tm;
	/**
	 * 查询未通过审核的公司
	 *渭南师范二期-程建波
	 *2017年9月19日下午11:53:43
	 */
public List<CompanyRegist> getAllNoCompany(int a){
	
	return cm.getAllNoCompany(a);
}
	/**
	 * 注册公司 渭南师范二期-吴鹏飞、 2017年8月24日 上午1:59:52
	 * 
	 * @author
	 * @param companyRegist
	 * @return
	 */
	public int insertCompany(CompanyRegist companyRegist) {
		return cm.insertCompany(companyRegist);
	}

	/**
	 * 修改公司信息 渭南师范二期-吴鹏飞、 2017年8月24日 上午2:01:15
	 * 
	 * @author
	 * @param companyRegist
	 * @return
	 */
	public int dateCompany(CompanyRegist companyRegist) {
		return cm.updateCompany(companyRegist);
	}

	/**
	 * 根据公司id查询公司信息 渭南师范二期-吴鹏飞、 2017年8月24日 上午2:02:23
	 * 
	 * @author
	 * @param companyId
	 * @return
	 */
	public CompanyRegist selectCompany(int companyId) {
		CompanyRegist regist = cm.selectCompanyById(companyId);
		return regist;
	}
	
	/**
	 * 查询所有公司信息
	 * 渭南师范二期-吴鹏飞、
	 * 2017年8月26日 上午10:58:55
	 * @author
	 * @return
	 */
	public List<CompanyRegist> getAllCompany(){
		List<CompanyRegist> companies = cm.selectAllCompany();
		return companies;
	}

	/**
	 * 删除公司 渭南师范二期-吴鹏飞、 2017年8月24日 上午2:04:01
	 * 
	 * @author
	 * @param companyId
	 * @return
	 */
	public int deleteCompany(int companyId) {
		return cm.deleteCompany(companyId);
	}
	
	//通过email查询公司信息
	public CompanyRegist selectCompanyByEmail(String email) {
		return cm.selectCompanyByEmail(email);
	}
	
	//审核
	public int toAuthentication(int companyId){
		int i = cm.toAuthentication(companyId);
		return i;
	}
	
	//登陆
	public CompanyRegist getCompany(CompanyRegist company) {
		CompanyRegist com = cm.getCompany(company);
		return com;
	}

	public CompanyRegist getCompany(String email, String pwd) {
		CompanyRegist com = cm.getCompany(email,pwd);
		return com;
	}
	
	public CompanyRegist selectCompanyById(int id){
		return cm.selectCompanyById(id);
	}
	/**
	 * 根据公司id查询
	 *渭南师范二期-程建波
	 *2017年9月21日下午4:10:29
	 */
	public CompanyRegist getCompanyByCompanyId(Integer companyId) {
		// TODO Auto-generated method stub
		return cm.getCompanyByCompanyId(companyId);
	}
	public int updateCompany(CompanyRegist company) {
		// TODO Auto-generated method stub
		return cm.update(company);
	}
	
	public CompanyRegist getCompanyById(int companyId) {
		return cm.getCompanyById(companyId);
	}
	
}

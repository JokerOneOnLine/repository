package org.lanqiao.service.company;

import java.util.List;

import org.lanqiao.entity.company.CompanyEnterTeam;
import org.lanqiao.mapper.company.CompanyEnterTeamMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 渭南师范二期-樊璐璐 2017年8月24日上午8:53:43
 * 
 * @author lenovo
 */
@Service
public class CompanyEnterTeamService {
	@Autowired
	CompanyEnterTeamMapper companyEnterTeamMapper;

	// 获取一条记录集合
	public List<CompanyEnterTeam> getEnterTeamByComponyId(int ce) {
		return companyEnterTeamMapper.getEnterTeamByComponyId(ce);
	}

	// 删除一条记录
	public boolean deleteEnterTeamByComponyId(int companyId) {
		return companyEnterTeamMapper.deleteEnterTeamByComponyId(companyId);
	}

	// 更新一条记录
	public int updateEnterTeamByComponyId(CompanyEnterTeam ce) {
		return companyEnterTeamMapper.updateEnterTeamByComponyId(ce);
	}

	// 插入一条记录
	public int insertEnterTeamToCompany(CompanyEnterTeam companyEnterTeam) {

		return companyEnterTeamMapper.insertEnterTeamToCompany(companyEnterTeam);

	}

	// 查看所有记录
	public List<CompanyEnterTeam> getAllEnterTeam() {
		return companyEnterTeamMapper.getAllEnterTeam();
	}

}

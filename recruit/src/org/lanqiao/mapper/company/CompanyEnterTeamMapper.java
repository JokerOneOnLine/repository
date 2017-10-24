package org.lanqiao.mapper.company;

import java.util.List;

import org.lanqiao.entity.company.CompanyEnterTeam;
/**
 * 
 *渭南师范二期-樊璐璐
 * 2017年8月24日上午8:50:20
 * @author lenovo
 *
 */
public interface CompanyEnterTeamMapper {
	List<CompanyEnterTeam> getEnterTeamByComponyId(int companyId);

	boolean deleteEnterTeamByComponyId(int companyId);

	int updateEnterTeamByComponyId(CompanyEnterTeam ce);

	int insertEnterTeamToCompany(CompanyEnterTeam companyEnterTeam);
	
	List<CompanyEnterTeam> getAllEnterTeam();
}
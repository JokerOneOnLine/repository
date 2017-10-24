package org.lanqiao.service.company;

import java.util.List;

import org.lanqiao.entity.company.CompanyProduct;
import org.lanqiao.mapper.company.CompanyProductMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CompanyProductService {
	/**
	 * 公司产品的增删改查Service
	 * 渭南师范二期-高瑞
	 *2017年8月23日下午8:07:22
	 *@param product
	 *@return
	 */
	@Autowired
	CompanyProductMapper companyProductMapper;
	
	public int insertCompanyProduct(CompanyProduct product){
		return  companyProductMapper.insertCompanyProduct(product);
	}
	
	public int deleteCompanyProduct(int id){
		return  companyProductMapper.deleteCompanyProduct(id);
	}
	
	public int updateCompanyProduct(CompanyProduct product){
		return  companyProductMapper.updateCompanyProduct(product);
	}
	
	public CompanyProduct getCompanyProduct(int id){
		return  companyProductMapper.getCompanyProduct(id);
	}
	
	public List<CompanyProduct> getAllCompanyProduct(){
		return  companyProductMapper.getAllCompanyProduct();
	}
}

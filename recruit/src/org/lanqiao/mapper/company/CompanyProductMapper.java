package org.lanqiao.mapper.company;

import java.util.List;

import org.lanqiao.entity.company.CompanyProduct;

/**
 *   公司产品的增删改查
 *渭南师范二期-高瑞
 *2017年8月23日下午3:48:52
 */
public interface CompanyProductMapper {
	int insertCompanyProduct(CompanyProduct product);
	int deleteCompanyProduct(int id);
	int updateCompanyProduct(CompanyProduct product);
	CompanyProduct getCompanyProduct(int id);
	List<CompanyProduct> getAllCompanyProduct();
}

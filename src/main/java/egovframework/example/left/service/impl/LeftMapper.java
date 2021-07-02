package egovframework.example.left.service.impl;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("leftMapper")
public interface LeftMapper {
	
	List<?> selectMainMenu() throws Exception;
	
	List<?> selectSubMenu(String menuId) throws Exception;
}

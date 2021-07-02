package egovframework.example.left.service;

import java.util.List;

public interface LeftService {

	List<?> selectMainMenu() throws Exception;

	List<?> selectSubMenu(String menuId) throws Exception;
}


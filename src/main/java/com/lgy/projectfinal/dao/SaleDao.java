package com.lgy.projectfinal.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.lgy.projectfinal.dto.SaleDto;
import com.lgy.projectfinal.dto.board_Criteria;

public interface SaleDao {
	public ArrayList<SaleDto> sale_list();
	public ArrayList<SaleDto> sale_listWithPaging(board_Criteria cri);
	public ArrayList<SaleDto> sale_contentView(HashMap<String, String> param);
	public void sale_modify(HashMap<String, String> param);
	public void sale_modifySales(HashMap<String, String> param);
	public void sale_delete(HashMap<String, String> param);
	public int sale_getTotalCount(board_Criteria cri);
	public ArrayList<SaleDto> sale_getSales(HashMap<String, String> param);
}

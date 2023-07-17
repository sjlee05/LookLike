package com.lgy.projectfinal.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.lgy.projectfinal.dto.SaleDto;
import com.lgy.projectfinal.dto.board_Criteria;

public interface SaleService {
	public ArrayList<SaleDto> sale_list();
	public ArrayList<SaleDto> sale_list(board_Criteria cri);
//	public void write(HashMap<String, String> param);
	public ArrayList<SaleDto> sale_contentView(HashMap<String, String> param);
	public void sale_modify(HashMap<String, String> param);
	public void sale_modifySales(HashMap<String, String> param);
	public void sale_delete(HashMap<String, String> param);
	public int sale_getTotalCount(board_Criteria cri);
	public ArrayList<SaleDto> sale_getSales(HashMap<String, String> param);
//	String getFirstOrdKey(HashMap<String, String> param);
//	public void upHit(HashMap<String, String> param);
//	public String getImagePath(HashMap<String, String> param);
//	public SaleDto deleteFile(String deleteFile);
}

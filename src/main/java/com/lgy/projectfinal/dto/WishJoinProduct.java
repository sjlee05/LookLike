package com.lgy.projectfinal.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class WishJoinProduct {
	private int cust_key;
	private int prod_key;
	private int cat_key;
	private int cart_count;
	private String prod_type;
	private String prod_name;
	private int prod_price;
	private String prod_size;
}

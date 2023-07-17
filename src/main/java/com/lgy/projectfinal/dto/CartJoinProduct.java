package com.lgy.projectfinal.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CartJoinProduct {
	private int cust_key;
	private int prod_key;
	private int cat_key;
	private int cart_count;
	private String prod_name;
	private String prod_img;
	private String prod_imgpath;
	private String prod_thumbnail;
	private String prod_thumbnailpath;
	private Timestamp prod_rdate;
	private int prod_cnt;
	private int prod_price;
	private String prod_size;
	private int rating;
}

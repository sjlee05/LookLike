package com.lgy.projectfinal.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SaleDto {
	private int ord_key;
	private int ord_price;
	private int ord_totalprice;
	private String ord_name;
	private String cust_id;
	private String ord_date;
	private String ord_item;
	private String ord_addr;
	private String ord_addrdetail;
	private String ord_zipcode;
	private String ord_tel;
	private String ord_phone;
	private String ord_tnumber;
	private String ord_request;
	private String ord_status;
	private String ord_count;
	private String ord_merchant;
	
}

package com.lgy.projectfinal.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class custdto {
	private int cust_key;
	private String cust_name;
	private String cust_id;
	private String cust_pwd;
	private int cust_gender;
	private String cust_addr;
	private String cust_email;
	private String cust_phone;
	private String cust_tel;
	private String cust_signout;	
	private Timestamp cust_signup;
	private int cust_grade;
}

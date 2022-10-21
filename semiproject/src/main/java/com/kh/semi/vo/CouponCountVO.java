package com.kh.semi.vo;

public class CouponCountVO {
	private String couponId;
	private int cnt;	
	
	public CouponCountVO() {
		super();
	}
	@Override
	public String toString() {
		return "CouponCountVO [couponId=" + couponId + ", cnt=" + cnt + "]";
	}
	public String getCouponId() {
		return couponId;
	}
	public void setCouponId(String couponId) {
		this.couponId = couponId;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	
	
	
	
	
	

	
	
	
	

}

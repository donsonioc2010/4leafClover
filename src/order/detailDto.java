package order;

import java.io.Serializable;

//위 Dto는 주문의 건수별 해당 세부 항목이다
public class detailDto implements Serializable{
	
	private int productSeq;		//상품번호
	private String OrderNum;	//주문번호
	private int orderCount;		//물품주문갯수
	private int orderPrice;		//해당주문 물품의 총 공급가액
	private int PriceTax;		//해당주문 물품의 총 세금
	private int PriceSum;		//해당주문 물품의 총 합계 (공급가액 + 세금)
	private String productName;
	private String productStandard;
	public detailDto() {}

	
	//Getter Setter
	public int getProductSeq() {return productSeq;}
	public void setProductSeq(int productSeq) {this.productSeq = productSeq;}
	public String getOrderNum() {return OrderNum;}
	public void setOrderNum(String orderNum) {OrderNum = orderNum;}
	public int getOrderCount() {return orderCount;}
	public void setOrderCount(int orderCount) {this.orderCount = orderCount;}
	public int getOrderPrice() {return orderPrice;}
	public void setOrderPrice(int orderPrice) {this.orderPrice = orderPrice;}
	public int getPriceTax() {return PriceTax;}
	public void setPriceTax(int priceTax) {	PriceTax = priceTax;}
	public int getPriceSum() {return PriceSum;}
	public void setPriceSum(int priceSum) {PriceSum = priceSum;}
	
	
	public String getProductName() {return productName;}
	public void setProductName(String productName) {this.productName = productName;}
	public String getProductStandard() {return productStandard;}
	public void setProductStandard(String productStandard) {this.productStandard = productStandard;}
}

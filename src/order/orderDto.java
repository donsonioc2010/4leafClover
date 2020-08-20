package order;

import java.io.Serializable;

public class orderDto implements Serializable{
	
	private int BuyerSeq;
	private int OrderSort;
	private String OrderDate;
	private int OrderSupplyValue;
	private int OrderTaxValue;
	private int OrderCollectMoney;
	private int OrderNotCollectMoney;
	private int OrderTotal;
	private String OrderNum;
	
	public orderDto() {}
	
	//Getter Setter
	public int getBuyerSeq() { return BuyerSeq;}
	public void setBuyerSeq(int buyerSeq) { BuyerSeq = buyerSeq;}
	public int getOrderSort() { return OrderSort;}
	public void setOrderSort(int orderSort) { OrderSort = orderSort;}
	public String getOrderDate() { return OrderDate;}
	public void setOrderDate(String orderDate) { OrderDate = orderDate;}
	public int getOrderSupplyValue() {return OrderSupplyValue;}
	public void setOrderSupplyValue(int orderSupplyValue) {OrderSupplyValue = orderSupplyValue;}
	public int getOrderTaxValue() { return OrderTaxValue;}
	public void setOrderTaxValue(int orderTaxValue) {OrderTaxValue = orderTaxValue;}
	public int getOrderCollectMoney() {return OrderCollectMoney;}
	public void setOrderCollectMoney(int orderCollectMoney) {OrderCollectMoney = orderCollectMoney;}
	public int getOrderNotCollectMoney() {return OrderNotCollectMoney;}
	public void setOrderNotCollectMoney(int orderNotCollectMoney) {OrderNotCollectMoney = orderNotCollectMoney;}
	public int getOrderTotal() {return OrderTotal;}
	public void setOrderTotal(int orderTotal) {OrderTotal = orderTotal;}
	public String getOrderNum() {return OrderNum;}
	public void setOrderNum(String orderNum) {OrderNum = orderNum;}

}

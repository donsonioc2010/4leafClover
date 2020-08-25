package order;

import java.io.Serializable;

public class excelDto implements Serializable{
	private String orderNum;
	private String sellerId;
	private String productName;
	private String productUnit;
	private String buyerCompanyName;
	private String orderDate;
	private int productSeq;
	private int ListSupplyPrice;
	private int ListTaxValue;
	private int ListTotal;
	private int detailCount;
	private int detailPrice;
	private int detailPriceTax;
	private int detailPriceSum;
	
	public excelDto() {}

	public int getProductSeq() {
		return productSeq;
	}

	public void setProductSeq(int productSeq) {
		this.productSeq = productSeq;
	}

	public String getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(String orderNum) {
		this.orderNum = orderNum;
	}

	public String getSellerId() {
		return sellerId;
	}

	public void setSellerId(String sellerId) {
		this.sellerId = sellerId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductUnit() {
		return productUnit;
	}

	public void setProductUnit(String productUnit) {
		this.productUnit = productUnit;
	}

	public String getBuyerCompanyName() {
		return buyerCompanyName;
	}

	public void setBuyerCompanyName(String buyerCompanyName) {
		this.buyerCompanyName = buyerCompanyName;
	}

	public String getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

	public int getListSupplyPrice() {
		return ListSupplyPrice;
	}

	public void setListSupplyPrice(int listSupplyPrice) {
		ListSupplyPrice = listSupplyPrice;
	}

	public int getListTaxValue() {
		return ListTaxValue;
	}

	public void setListTaxValue(int listTaxValue) {
		ListTaxValue = listTaxValue;
	}

	public int getListTotal() {
		return ListTotal;
	}

	public void setListTotal(int listTotal) {
		ListTotal = listTotal;
	}

	public int getDetailCount() {
		return detailCount;
	}

	public void setDetailCount(int detailCount) {
		this.detailCount = detailCount;
	}

	public int getDetailPrice() {
		return detailPrice;
	}

	public void setDetailPrice(int detailPrice) {
		this.detailPrice = detailPrice;
	}

	public int getDetailPriceTax() {
		return detailPriceTax;
	}

	public void setDetailPriceTax(int detailPriceTax) {
		this.detailPriceTax = detailPriceTax;
	}

	public int getDetailPriceSum() {
		return detailPriceSum;
	}

	public void setDetailPriceSum(int detailPriceSum) {
		this.detailPriceSum = detailPriceSum;
	}

	@Override
	public String toString() {
		return "excelDto [orderNum=" + orderNum + ", sellerId=" + sellerId + ", productName=" + productName
				+ ", productUnit=" + productUnit + ", buyerCompanyName=" + buyerCompanyName + ", orderDate=" + orderDate
				+ ", productSeq=" + productSeq + ", ListSupplyPrice=" + ListSupplyPrice + ", ListTaxValue="
				+ ListTaxValue + ", ListTotal=" + ListTotal + ", detailCount=" + detailCount + ", detailPrice="
				+ detailPrice + ", detailPriceTax=" + detailPriceTax + ", detailPriceSum=" + detailPriceSum + "]";
	}
	

}

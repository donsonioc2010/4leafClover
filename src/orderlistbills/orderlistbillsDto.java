package orderlistbills;

import java.io.Serializable;
/*
+ " O.BUYER_SEQ, "
	+ " O.ORDER_DATE, "
	+ " O.ORDER_SUPPLY_PRICE, "
	+ " O.ORDER_COLLECT_MONEY, "
	+ " O.ORDER_NOT_COLLECT_MONEY, "
	+ " O.ORDER_TOTAL, "
	+ " O.PRODUCT_SEQ, "
	+ " O.ORDER_COUNT, "
	+ " P.PRODUCT_NAME, "
	+ " O.ORDER_DEL,"
	+ " P.PRODUCT_STANDARD, "
	+ " P.PRODUCT_TRADE_PRICE "
*/
public class orderlistbillsDto implements Serializable {
	
	
	private String order_num;
	private int order_count;
	private int order_price;		// 구매한 상품의 단가 총액
	private int price_tax;		// 구매한 상품의 세액
	private int price_sum;		// 구매한 상품의 총액 (단가 + 세액)
	private String product_name;
	private String product_unit;
	private int product_trade_price;
	private int buyer_seq;
	private String order_date;
	private int order_supply_price;
	private int order_collect_money;
	private int order_not_collect_money;
	private int order_tax_value;	// 해당 일에 구입한 항목의 세액
	private int order_total;		// 해당 일에 구입한 항목의 총액
	private String product_standard;
	
	
	
	
	public orderlistbillsDto() {}




	public orderlistbillsDto(String order_num, int order_count, int order_price, int price_tax, int price_sum,
			String product_name, String product_unit, int product_trade_price, int buyer_seq, String order_date,
			int order_supply_price, int order_collect_money, int order_not_collect_money, int order_tax_value,
			int order_total, String product_standard) {
		super();
		this.order_num = order_num;
		this.order_count = order_count;
		this.order_price = order_price;
		this.price_tax = price_tax;
		this.price_sum = price_sum;
		this.product_name = product_name;
		this.product_unit = product_unit;
		this.product_trade_price = product_trade_price;
		this.buyer_seq = buyer_seq;
		this.order_date = order_date;
		this.order_supply_price = order_supply_price;
		this.order_collect_money = order_collect_money;
		this.order_not_collect_money = order_not_collect_money;
		this.order_tax_value = order_tax_value;
		this.order_total = order_total;
		this.product_standard = product_standard;
	}



	@Override
	public String toString() {
		return "orderlistbillsDto [order_num=" + order_num + ", order_count=" + order_count + ", order_price="
				+ order_price + ", price_tax=" + price_tax + ", price_sum=" + price_sum + ", product_name="
				+ product_name + ", product_unit=" + product_unit + ", product_trade_price=" + product_trade_price
				+ ", buyer_seq=" + buyer_seq + ", order_date=" + order_date + ", order_supply_price="
				+ order_supply_price + ", order_collect_money=" + order_collect_money + ", order_not_collect_money="
				+ order_not_collect_money + ", order_tax_value=" + order_tax_value + ", order_total=" + order_total
				+ ", product_standard=" + product_standard + "]";
	}




	public String getProduct_standard() {
		return product_standard;
	}




	public void setProduct_standard(String product_standard) {
		this.product_standard = product_standard;
	}




	public String getOrder_num() {
		return order_num;
	}




	public void setOrder_num(String order_num) {
		this.order_num = order_num;
	}




	public int getOrder_count() {
		return order_count;
	}




	public void setOrder_count(int order_count) {
		this.order_count = order_count;
	}




	public int getOrder_price() {
		return order_price;
	}




	public void setOrder_price(int order_price) {
		this.order_price = order_price;
	}




	public int getPrice_tax() {
		return price_tax;
	}




	public void setPrice_tax(int price_tax) {
		this.price_tax = price_tax;
	}




	public int getPrice_sum() {
		return price_sum;
	}




	public void setPrice_sum(int price_sum) {
		this.price_sum = price_sum;
	}




	public String getProduct_name() {
		return product_name;
	}




	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}




	public String getProduct_unit() {
		return product_unit;
	}




	public void setProduct_unit(String product_unit) {
		this.product_unit = product_unit;
	}




	public int getProduct_trade_price() {
		return product_trade_price;
	}




	public void setProduct_trade_price(int product_trade_price) {
		this.product_trade_price = product_trade_price;
	}




	public int getBuyer_seq() {
		return buyer_seq;
	}




	public void setBuyer_seq(int buyer_seq) {
		this.buyer_seq = buyer_seq;
	}




	public String getOrder_date() {
		return order_date;
	}




	public void setOrder_date(String order_date) {
		this.order_date = order_date;
	}




	public int getOrder_supply_price() {
		return order_supply_price;
	}




	public void setOrder_supply_price(int order_supply_price) {
		this.order_supply_price = order_supply_price;
	}




	public int getOrder_collect_money() {
		return order_collect_money;
	}




	public void setOrder_collect_money(int order_collect_money) {
		this.order_collect_money = order_collect_money;
	}




	public int getOrder_not_collect_money() {
		return order_not_collect_money;
	}




	public void setOrder_not_collect_money(int order_not_collect_money) {
		this.order_not_collect_money = order_not_collect_money;
	}




	public int getOrder_tax_value() {
		return order_tax_value;
	}




	public void setOrder_tax_value(int order_tax_value) {
		this.order_tax_value = order_tax_value;
	}




	public int getOrder_total() {
		return order_total;
	}




	public void setOrder_total(int order_total) {
		this.order_total = order_total;
	}


	

	
}
package product;

import java.io.Serializable;

public class productDto implements Serializable {
	private int productSeq;
	private String productName;
	private String productUnit;
	private int productTradePrice;
	private String productSort;
	private int productPieceBox;
	private String productStandard;
	
	public productDto() {}

	public int getProductSeq() {
		return productSeq;
	}

	public void setProductSeq(int productSeq) {
		this.productSeq = productSeq;
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

	public int getProductTradePrice() {
		return productTradePrice;
	}

	public void setProductTradePrice(int productTradePrice) {
		this.productTradePrice = productTradePrice;
	}

	public String getProductSort() {
		return productSort;
	}

	public void setProductSort(String productSort) {
		this.productSort = productSort;
	}

	public int getProductPieceBox() {
		return productPieceBox;
	}

	public void setProductPieceBox(int productPieceBox) {
		this.productPieceBox = productPieceBox;
	}

	public String getProductStandard() {
		return productStandard;
	}

	public void setProductStandard(String productStandard) {
		this.productStandard = productStandard;
	}

}
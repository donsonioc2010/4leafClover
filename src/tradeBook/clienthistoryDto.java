package tradeBook;

//판매자id -sellerid
//구분(임시) -ledgersort
//거래일 -ledgerdate
//상품명 -ledgerproductname
//공급가 -ledgersupplyprice
//세액 -ledgertaxvalue
//합계금액 - ledgertotal
//수금액 -ledgercollectmoney
//지불액 -ledgernotcollectmoney
//누계잔액 ledgercompanytotal
//전표잔액 :ledgerordermoney

public class clienthistoryDto {
	private int buyerseq;
	private String ledgerproductname;
	private int ledgersort;
	private String ledgerdate;
	private int ledgersupplyprice;
	private int ledgertaxvalue;
	private int ledgercollectmoney;
	private int ledgernotcollectmoney;
	private int ledgertotal;
	private int ledgercompanytotal;
	private int ledgerordermoney;
	
	public clienthistoryDto() {}
	public clienthistoryDto(int buyerseq, String ledgerproductname, int ledgersort, String ledgerdate,
			int ledgersupplyprice, int ledgertaxvalue, int ledgercollectmoney, int ledgernotcollectmoney, int ledgertotal) {
		super();
		this.buyerseq = buyerseq;
		this.ledgerproductname = ledgerproductname;
		this.ledgersort = ledgersort;
		this.ledgerdate = ledgerdate;
		this.ledgersupplyprice = ledgersupplyprice;
		this.ledgertaxvalue = ledgertaxvalue;
		this.ledgercollectmoney = ledgercollectmoney;
		this.ledgernotcollectmoney = ledgernotcollectmoney;
		this.ledgertotal = ledgertotal;
	}
	
	public clienthistoryDto(int buyerseq, String ledgerproductname, int ledgersort, String ledgerdate,
			int ledgersupplyprice, int ledgertaxvalue, int ledgercollectmoney, int ledgernotcollectmoney, int ledgertotal,
			int ledgercompanytotal, int ledgerordermoney) {
		super();
		this.buyerseq = buyerseq;
		this.ledgerproductname = ledgerproductname;
		this.ledgersort = ledgersort;
		this.ledgerdate = ledgerdate;
		this.ledgersupplyprice = ledgersupplyprice;
		this.ledgertaxvalue = ledgertaxvalue;
		this.ledgercollectmoney = ledgercollectmoney;
		this.ledgernotcollectmoney = ledgernotcollectmoney;
		this.ledgertotal = ledgertotal;
		this.ledgercompanytotal = ledgercompanytotal;
		this.ledgerordermoney = ledgerordermoney;
	}
	public int getLedgercompanytotal() {
		return ledgercompanytotal;
	}
	public void setLedgercompanytotal(int ledgercompanytotal) {
		this.ledgercompanytotal = ledgercompanytotal;
	}
	public int getLedgerordermoney() {
		return ledgerordermoney;
	}
	public void setLedgerordermoney(int ledgerordermoney) {
		this.ledgerordermoney = ledgerordermoney;
	}
	public int getBuyerseq() {
		return buyerseq;
	}
	public void setBuyerseq(int buyerseq) {
		this.buyerseq = buyerseq;
	}
	public String getLedgerproductname() {
		return ledgerproductname;
	}
	public void setLedgerproductname(String ledgerproductname) {
		this.ledgerproductname = ledgerproductname;
	}
	public int getLedgersort() {
		return ledgersort;
	}
	public void setLedgersort(int ledgersort) {
		this.ledgersort = ledgersort;
	}
	public String getLedgerdate() {
		return ledgerdate;
	}
	public void setLedgerdate(String ledgerdate) {
		this.ledgerdate = ledgerdate;
	}
	public int getLedgersupplyprice() {
		return ledgersupplyprice;
	}
	public void setLedgersupplyprice(int ledgersupplyprice) {
		this.ledgersupplyprice = ledgersupplyprice;
	}
	public int getLedgertaxvalue() {
		return ledgertaxvalue;
	}
	public void setLedgertaxvalue(int ledgertaxvalue) {
		this.ledgertaxvalue = ledgertaxvalue;
	}
	public int getLedgercollectmoney() {
		return ledgercollectmoney;
	}
	public void setLedgercollectmoney(int ledgercollectmoney) {
		this.ledgercollectmoney = ledgercollectmoney;
	}
	public int getLedgernotcollectmoney() {
		return ledgernotcollectmoney;
	}
	public void setLedgernotcollectmoney(int ledgernotcollectmoney) {
		this.ledgernotcollectmoney = ledgernotcollectmoney;
	}
	public int getLedgertotal() {
		return ledgertotal;
	}
	public void setLedgertotal(int ledgertotal) {
		this.ledgertotal = ledgertotal;
	}


}

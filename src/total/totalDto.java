package total;

import java.io.Serializable;

public class totalDto implements Serializable {

	private int month_total_avg;
	private int month_collect_money_avg;
	private int month_not_conllect_money_avg;
	private int year_total_avg;
	private int year_collect_money_avg;
	private int year_not_conllect_money_avg;
	private int buyer_seq;
	
	public totalDto() {}

	
	public totalDto(int month_total_avg, int month_collect_money_avg, int month_not_conllect_money_avg,
			int year_total_avg, int year_collect_money_avg, int year_not_conllect_money_avg) {
		super();
		this.month_total_avg = month_total_avg;
		this.month_collect_money_avg = month_collect_money_avg;
		this.month_not_conllect_money_avg = month_not_conllect_money_avg;
		this.year_total_avg = year_total_avg;
		this.year_collect_money_avg = year_collect_money_avg;
		this.year_not_conllect_money_avg = year_not_conllect_money_avg;
	}



	public totalDto(int month_total_avg, int month_collect_money_avg, int month_not_conllect_money_avg) {
		super();
		this.month_total_avg = month_total_avg;
		this.month_collect_money_avg = month_collect_money_avg;
		this.month_not_conllect_money_avg = month_not_conllect_money_avg;
	}

	

	public totalDto(int year_total_avg, int year_collect_money_avg, int year_not_conllect_money_avg,int product_seq,int buyer_seq) {
		super();
		this.year_total_avg = year_total_avg;
		this.year_collect_money_avg = year_collect_money_avg;
		this.year_not_conllect_money_avg = year_not_conllect_money_avg;
		this.  buyer_seq =   buyer_seq;
	}


	public int getMonth_total_avg() {
		return month_total_avg;
	}


	public void setMonth_total_avg(int month_total_avg) {
		this.month_total_avg = month_total_avg;
	}


	public int getMonth_collect_money_avg() {
		return month_collect_money_avg;
	}


	public void setMonth_collect_money_avg(int month_collect_money_avg) {
		this.month_collect_money_avg = month_collect_money_avg;
	}


	public int getMonth_not_conllect_money_avg() {
		return month_not_conllect_money_avg;
	}


	public void setMonth_not_conllect_money_avg(int month_not_conllect_money_avg) {
		this.month_not_conllect_money_avg = month_not_conllect_money_avg;
	}


	public int getYear_total_avg() {
		return year_total_avg;
	}


	public void setYear_total_avg(int year_total_avg) {
		this.year_total_avg = year_total_avg;
	}


	public int getYear_collect_money_avg() {
		return year_collect_money_avg;
	}


	public void setYear_collect_money_avg(int year_collect_money_avg) {
		this.year_collect_money_avg = year_collect_money_avg;
	}


	public int getYear_not_conllect_money_avg() {
		return year_not_conllect_money_avg;
	}


	public void setYear_not_conllect_money_avg(int year_not_conllect_money_avg) {
		this.year_not_conllect_money_avg = year_not_conllect_money_avg;
	}
	
	

	
	

}

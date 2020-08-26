package total;

import java.io.Serializable;

public class totalMMDto implements Serializable {

	private int month_total_avg;
	private int month_collect_money_avg;
	private int month_not_conllect_money_avg;

	
	public totalMMDto() {}


	public totalMMDto(int month_total_avg, int month_collect_money_avg, int month_not_conllect_money_avg) {
		super();
		this.month_total_avg = month_total_avg;
		this.month_collect_money_avg = month_collect_money_avg;
		this.month_not_conllect_money_avg = month_not_conllect_money_avg;
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


	
	

}

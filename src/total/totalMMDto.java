package total;

import java.io.Serializable;

public class totalMMDto implements Serializable {

	private int month_total_avg;
	private int month_collect_money_avg;
	private int month_not_conllect_money_avg;
	private String companyName;
	private int companyTotal;
	private int companyCollect;
	private int companyNotCollect;

	public totalMMDto() {}


	public totalMMDto(int month_total_avg, int month_collect_money_avg, int month_not_conllect_money_avg) {
		super();
		this.month_total_avg = month_total_avg;
		this.month_collect_money_avg = month_collect_money_avg;
		this.month_not_conllect_money_avg = month_not_conllect_money_avg;
	}
	public totalMMDto(String companyName, int companyTotal, int companyCollect, int companyNotCollect) {
		super();
		this.companyName = companyName;
		this.companyTotal = companyTotal;
		this.companyCollect = companyCollect;
		this.companyNotCollect = companyNotCollect;
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
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public int getCompanyTotal() {
		return companyTotal;
	}
	public void setCompanyTotal(int companyTotal) {
		this.companyTotal = companyTotal;
	}
	public int getCompanyCollect() {
		return companyCollect;
	}
	public void setCompanyCollect(int companyCollect) {
		this.companyCollect = companyCollect;
	}
	public int getCompanyNotCollect() {
		return companyNotCollect;
	}
	public void setCompanyNotCollect(int companyNotCollect) {
		this.companyNotCollect = companyNotCollect;
	}

}

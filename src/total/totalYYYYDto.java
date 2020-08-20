package total;

public class totalYYYYDto {

	private int year_total_avg;
	private int year_collect_money_avg;
	private int year_not_conllect_money_avg;
	
	public totalYYYYDto() {}
	
	public totalYYYYDto(int year_total_avg, int year_collect_money_avg, int year_not_conllect_money_avg) {
		super();
		this.year_total_avg = year_total_avg;
		this.year_collect_money_avg = year_collect_money_avg;
		this.year_not_conllect_money_avg = year_not_conllect_money_avg;
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

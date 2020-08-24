package order;

import java.io.File;
import java.io.FileOutputStream;
import java.util.List;

import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class excelDao {
	public excelDao() {}
	
	public String writeToExcel(List<excelDto> list,String buyerSeq,String sellerId) {
		//워크북 생성
		XSSFWorkbook workbook= new XSSFWorkbook();
		//시트생성
		XSSFSheet sheet = workbook.createSheet();
		//셀 생성
		XSSFCell cell;
		
		//헤더 정보 OrderList 작성
		//첫번째줄~
		//행생성
		XSSFRow row = sheet.createRow(0);
		cell = row.createCell(0);
		cell.setCellValue("공급가액");
		cell = row.createCell(1);
		cell.setCellValue(list.get(0).getListSupplyPrice());
		
		cell = row.createCell(2);
		
		cell = row.createCell(3);
		cell.setCellValue("판매처");
		cell = row.createCell(4);
		cell.setCellValue(list.get(0).getBuyerCompanyName());
		
		cell = row.createCell(5);
		
		cell = row.createCell(6);
		cell.setCellValue("판매일");
		cell = row.createCell(7);
		cell.setCellValue(list.get(0).getOrderDate());
		
		//두번째줄~
		row = sheet.createRow(1);
		cell = row.createCell(0);
		cell.setCellValue("총세금");
		cell = row.createCell(1);
		cell.setCellValue(list.get(0).getListTaxValue());
		
		//세번째줄
		row = sheet.createRow(2);
		cell = row.createCell(0);
		cell.setCellValue("총판매액");
		cell = row.createCell(1);
		cell.setCellValue(list.get(0).getListTotal());
		
		cell = row.createCell(2);
		
		cell = row.createCell(3);
		cell.setCellValue("판매자");
		cell = row.createCell(4);
		cell.setCellValue(list.get(0).getSellerId());
		
		cell = row.createCell(5);
		
		cell = row.createCell(6);
		cell.setCellValue("주문번호");
		cell = row.createCell(7);
		cell.setCellValue(list.get(0).getOrderNum());
		
		row = sheet.createRow(3);
		
		//다섯번쨰줄 (헤더)
		row = sheet.createRow(4);
		cell = row.createCell(0);
		cell.setCellValue("상품번호");
		cell = row.createCell(1);
		cell.setCellValue("상품명");
		cell = row.createCell(2);
		cell.setCellValue("상품종류");
		cell = row.createCell(3);
		cell.setCellValue("구매수량");
		cell = row.createCell(4);
		cell.setCellValue("공급가");
		cell = row.createCell(5);
		cell.setCellValue("세금");
		cell = row.createCell(6);
		cell.setCellValue("물품총금액");
		for(int i =0; i<list.size();i++) {
			excelDto dto = list.get(i);
			
			row = sheet.createRow(i+5);
			
			cell = row.createCell(0);
			cell.setCellValue(dto.getProductSeq());
			cell = row.createCell(1);
			cell.setCellValue(dto.getProductName());
			cell = row.createCell(2);
			cell.setCellValue(dto.getProductUnit());
			cell = row.createCell(3);
			cell.setCellValue(dto.getDetailCount());
			cell = row.createCell(4);
			cell.setCellValue(dto.getDetailPrice());
			cell = row.createCell(5);
			cell.setCellValue(dto.getDetailPriceTax());
			cell = row.createCell(6);
			cell.setCellValue(dto.getDetailPriceSum());
		}
		String fileName = "C:\\cloverExcel\\"+sellerId + "_" + list.get(0).getOrderDate()+ "_" + buyerSeq+".xls";
		File file = new File(fileName);
		FileOutputStream fos = null;
		try {
			fos = new FileOutputStream(file);
			workbook.write(fos);
			fos.close();
			workbook.close();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(workbook!=null) workbook.close();
				if(fos!=null) fos.close();
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		return fileName;
	}
	
}

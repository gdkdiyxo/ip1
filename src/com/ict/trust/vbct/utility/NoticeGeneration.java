package com.ict.trust.vbct.utility;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.Date;
import java.util.ResourceBundle;

import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import net.sf.jasperreports.engine.util.JRLoader;

import org.apache.log4j.Logger;

public class NoticeGeneration {
	

	private static final Logger logger = Logger
			.getLogger(NoticeGeneration.class);
	
	public byte[] generatePDF(String jasperName, ArrayList arrBeanData, String type)throws Exception
	{
		try{
		String filePath = CommonUtility.jasper_Path;
		if(filePath != null){
		ResourceBundle resourceBundle = ResourceBundle.getBundle("conf.NoticeConfig");
		FileInputStream fileInputStream = null;
		File jasperFile = null;
		if (type.equalsIgnoreCase("REG"))
		{
			filePath = filePath + resourceBundle.getString("FolderNameForRegistration") + "/" + jasperName + ".jasper";
			System.out.println("Jasper File ::::: "+filePath);
			jasperFile = new File(filePath);
			fileInputStream = getFileFromDirectory(jasperFile);
		}
		JasperReport jasperReport = (JasperReport) JRLoader.loadObject(fileInputStream);
		JRDataSource jrdatasource = new JRBeanCollectionDataSource(arrBeanData);
		JasperPrint jpPrintObj = JasperFillManager.fillReport(jasperReport,	null, jrdatasource);
		byte[] pdfFile = JasperExportManager.exportReportToPdf(jpPrintObj);
		return pdfFile;
	}
		}catch(Exception e){
			System.out.println("Error in Jasper Generation :: "+e);
			e.printStackTrace();
		}
		return null;
	}
	
	
	public FileInputStream getFileFromDirectory(File file)
			throws FileNotFoundException {
		return new FileInputStream(file);
	}
	
	
}

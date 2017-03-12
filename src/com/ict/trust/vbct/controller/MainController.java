
package com.ict.trust.vbct.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.TreeMap;
import java.util.LinkedHashMap;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;


import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.ict.trust.vbct.dao.impl.EmployeeDao;
import com.ict.trust.vbct.dto.CustomJasperReportDTO;
import com.ict.trust.vbct.model.AddAlbumBO;
import com.ict.trust.vbct.model.AddImageGalleryBO;
import com.ict.trust.vbct.model.ApprovalStudentBo;
import com.ict.trust.vbct.model.BalanceSheetBO;
import com.ict.trust.vbct.model.CommonDTO;
import com.ict.trust.vbct.model.CompanyBo;
import com.ict.trust.vbct.model.CountrySTDCodeMstBO;
import com.ict.trust.vbct.model.DonationBO;
import com.ict.trust.vbct.model.InternshipTypeBo;
import com.ict.trust.vbct.model.JasperReportMstBO;
import com.ict.trust.vbct.model.JobBo;
import com.ict.trust.vbct.model.Login;
import com.ict.trust.vbct.model.LoginBo;
import com.ict.trust.vbct.model.ReportBo;
import com.ict.trust.vbct.model.ReportlistBo;
import com.ict.trust.vbct.model.SkillBo;
import com.ict.trust.vbct.model.StudentCertificateBo;
import com.ict.trust.vbct.model.StudentEducationBo;
import com.ict.trust.vbct.model.StudentGpaBo;
import com.ict.trust.vbct.model.StudentInfoBo;
import com.ict.trust.vbct.model.StudentInternshipBo;
import com.ict.trust.vbct.model.StudentJobSkillbo;
import com.ict.trust.vbct.model.StudentSkillBo;
import com.ict.trust.vbct.model.StudentWorkBo;
import com.ict.trust.vbct.model.Student_Job_mapping;
import com.ict.trust.vbct.model.VbctLoginBO;
import com.ict.trust.vbct.utility.CommonUtility;
import com.ict.trust.vbct.utility.NoticeGeneration;
import com.sun.mail.smtp.SMTPTransport;

@Controller
@RequestMapping(value="main")
public class MainController {
	
	Logger log = Logger.getLogger(MainController.class);
	@Autowired
	private EmployeeDao employeeDao;

	public EmployeeDao getEmployeeDao() {
		return employeeDao;
	}

	public void setEmployeeDao(EmployeeDao employeeDao) {
		this.employeeDao = employeeDao;
	}
	
	DateFormat dateandtime = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
	DateFormat date = new SimpleDateFormat("dd/MM/yyyy");
	
	@RequestMapping(value = "/loadlogin")
	public String loadlogin(HttpServletRequest request,Model model) {
		log.info("-START--");
		model.addAttribute("login", new Login());
		request.setAttribute("filename", "login");
		return "welcome";
	}
	@RequestMapping(value = "/donorList")
	public String donorList(HttpServletRequest request) {
		log.info("-START--");
		try{
		String date;
		if(null != request.getParameter("date")){
			date = request.getParameter("date");
		}else{
			date = dateandtime.format(new Date()).split("/")[2].split(" ")[0];
		}
		List<DonationBO> lstDonorlist = employeeDao.getDonorList(date);
		request.setAttribute("donorlst", lstDonorlist);
		request.setAttribute("select", date);
		}catch(Exception e){}
		request.setAttribute("filename", "donorList");
		
		log.info("-END--");
		return "welcome";
	}
	
	@RequestMapping(value = "/loaddeleteDonors")
	public String loaddeleteDonors(HttpServletRequest request) {
		log.info("-START--");
		try{
			String name=null, purpose=null, year=null, country=null;
				year = dateandtime.format(new Date()).split("/")[2].split(" ")[0];
				List<DonationBO> lstDonorlist = employeeDao.admingetDonorList(name, purpose, year, country);
				request.setAttribute("donorlst", lstDonorlist);
				List<String> lstYear = employeeDao.getDonorYearDrop();
				TreeMap<String,String> treeYMap = new TreeMap<String,String>();
				if(lstYear != null && lstYear.size()>0){
					for(int i=0;i<lstYear.size();i++){
						String donyear = lstYear.get(i).split("/")[2];
						treeYMap.put(donyear,donyear);
					}
				}
				request.setAttribute("treeYMap", treeYMap);
			List<CountrySTDCodeMstBO> list=employeeDao.getCountrySTDCodeList();
			request.setAttribute("list", list);
		}catch(Exception e){
			e.printStackTrace();
		}
		request.setAttribute("adminfilename", "admindonorList");
		request.setAttribute("class", "mandon");
		log.info("-END--");
		return "admin/adminwelcome";
	}
	
	@RequestMapping(value = "/ajaxloaddeleteDonors")
	public String ajaxloaddeleteDonors(HttpServletRequest request) {
		log.info("-START--");
		try{
			String name=null, purpose=null, year=null, country=null;
			if(null != request.getParameter("name")){
				name = request.getParameter("name");
				request.setAttribute("name", name);
			}
			if(null != request.getParameter("purpose")){
				purpose = request.getParameter("purpose");
				if(purpose.equalsIgnoreCase("Select")){
					purpose = null;
				}else{
					System.out.println("inside else");
					request.setAttribute("purpose", purpose);
				}
				
			}
			if(null != request.getParameter("year")){
				year = request.getParameter("year");
				request.setAttribute("year", year);
			}
			
			if(null != request.getParameter("country")){
				country = request.getParameter("country");
				if(country.equalsIgnoreCase("Select ") || country.equalsIgnoreCase("Select")){
					country = null;
				}else{
					request.setAttribute("country", country);
				}
			}
			
			List<DonationBO> lstDonorlist = employeeDao.admingetDonorList(name, purpose, year, country);
			request.setAttribute("donorlst", lstDonorlist);
			List<CountrySTDCodeMstBO> list=employeeDao.getCountrySTDCodeList();
			request.setAttribute("list", list);
			List<String> lstYear = employeeDao.getDonorYearDrop();
			TreeMap<String,String> treeYMap = new TreeMap<String,String>();
			if(lstYear != null && lstYear.size()>0){
				for(int i=0;i<lstYear.size();i++){
					String donyear = lstYear.get(i).split("/")[2];
					treeYMap.put(donyear,donyear);
				}
			}
			request.setAttribute("treeYMap", treeYMap);
		}catch(Exception e){
			e.printStackTrace();
		}
		request.setAttribute("adminfilename", "admindonorList");
		request.setAttribute("class", "mandon");
		log.info("-END--^^^^^-");
		return "admin/adminwelcome";
	}
	
	@RequestMapping(value = "/getDonorByNameAjax")
	public void getDonorByNameAjax(HttpServletRequest request,HttpServletResponse response) {
		log.info("--START--Ajax--");
		try{
			String name = (String) request.getParameter("name");
			List<DonationBO> lstDonorlist = employeeDao.getDonorByNameAjax(name);
			
			if(lstDonorlist != null && lstDonorlist.size()>0){
			StringBuilder buffer = new StringBuilder("<tr><td colspan='4' align='center'><b>List of Donor</b></td></tr>" +
					"<tr><th>Name</th><th>Country</th><th>Mobile</th><th>Email id</th></tr>");
				for(int i=0;i<lstDonorlist.size();i++){
					buffer.append("<tr><td><a onclick='setDatainText("+i+")'>"+lstDonorlist.get(i).getDonor_name()+"</a>" +
							"<input type='hidden' id='name_"+i+"' value='"+lstDonorlist.get(i).getDonor_name()+"'/>" +
							"<input type='hidden' id='mob_"+i+"' value='"+lstDonorlist.get(i).getMobile_number()+"'/>" +
							"<input type='hidden' id='country_"+i+"' value='"+lstDonorlist.get(i).getCountry()+"'/>" +
							"<input type='hidden' id='email_"+i+"' value='"+lstDonorlist.get(i).getEmail()+"'/>" +
							"<input type='hidden' id='std_"+i+"' value='"+lstDonorlist.get(i).getStd_code()+"'/>" +
							"<input type='hidden' id='addr_"+i+"' value='"+lstDonorlist.get(i).getAddress()+"'/></td>" +
							"<td>"+lstDonorlist.get(i).getCountry()+"</td><td>"+lstDonorlist.get(i).getStd_code()+" "+lstDonorlist.get(i).getMobile_number()+"</td>" +
									"<td>"+lstDonorlist.get(i).getEmail()+"</td></tr>");
				}
				response.getWriter().print(buffer.toString());
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		log.info("--END--Ajax--");
	}
	
	@RequestMapping(value="/deleteDonor")
	public String deleteDonor(HttpServletRequest request){
		log.info("-START--");
		try{
			String id = null;
			if(null != request.getParameter("hideid")){
				id = request.getParameter("hideid");
			}
			System.out.println(id);
			boolean flag = employeeDao.deleteDonor(id);
			
			if(flag){
				request.setAttribute("success", "Data Successfully Deleted.");
			}else{
				request.setAttribute("error", "Error while Deleting data.");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		log.info("-END--");
		return "forward:loaddeleteDonors.htm";
	}
	
	@RequestMapping(value="/hideDonor")
	public String hideDonor(HttpServletRequest request){
		try{
			String id = null;
			String status = null;
			if(null != request.getParameter("id")){
				id = request.getParameter("id");
			}
			if(null != request.getParameter("val")){
				String val = request.getParameter("val");
				if(val.trim().equalsIgnoreCase("Hide")){
					status = "N";
				}else{
					status = "Y";
				}
			}
			System.out.println(id);
			boolean flag = employeeDao.hideDonor(id,status);
			
			if(flag){
				request.setAttribute("success", "Activity Performed Succesfully.");
			}else{
				request.setAttribute("error", "Error updating data.");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return "forward:loaddeleteDonors.htm";
	}
	
	
	
	@RequestMapping(value = "/downloadPdf")
	public void downloadPdf(HttpServletRequest request,HttpServletResponse response) {
		log.info("-START--");
		String yr = request.getParameter("date");
		try {
			Date d = new Date();
			List<DonationBO> lstDonorlist = employeeDao.getDonorList(yr);
			CustomJasperReportDTO dto = new CustomJasperReportDTO();
			ArrayList<CustomJasperReportDTO> arrayData = new ArrayList<CustomJasperReportDTO>();
			dto.setDate(dateandtime.format(d));
			dto.setHeading("Foreign donor list of year - "+yr);
			dto.setLstDonationBO(lstDonorlist);
			dto.setJasperTitle(CommonUtility.jasper_Path+"reg/subreportDonorList.jasper");
			dto.setBackimagePath(CommonUtility.jasper_Path+"reg/devkalogo22tra.PNG");
			dto.setImagePath(CommonUtility.jasper_Path+"reg/logo2.PNG");
			dto.setImagePath2(CommonUtility.jasper_Path+"reg/2.PNG");
			arrayData.add(dto);
			NoticeGeneration ng = new NoticeGeneration();
			byte[] pdfFile = ng.generatePDF("vrajCharitabldonorList",arrayData , "REG");
			if(null!=pdfFile){
			JasperReportMstBO reportMstBO = new JasperReportMstBO();
			reportMstBO.setCrt_dt(dateandtime.format(d));
			reportMstBO.setUpd_dt(dateandtime.format(d));
			reportMstBO.setUpd_usr(CommonUtility.portalUserIp);
			reportMstBO.setCrt_usr(CommonUtility.portalUserIp);
			reportMstBO.setJasper_decs("Foreign donor list of year - "+yr+" report generated");
			reportMstBO.setJasper_heading("Foreign donor list of year - "+yr);
			reportMstBO.setJasper_id(CommonUtility.donorListJasperVar);
			reportMstBO.setRep_name(CommonUtility.donorListJasperVar);
			reportMstBO.setRep_title(CommonUtility.donorListJasperVar);
			reportMstBO.setStatus("Y");
			reportMstBO.setJasper_data(pdfFile);
			employeeDao.saveDataComon(reportMstBO);
			log.info("Report save success id :: >> "+reportMstBO.getJasper_rep_id());
			
			response.setContentType("application/pdf");
			response.setHeader("Content-Disposition","attachment;filename=\"Foreign donor list "+yr+".pdf\"");
			response.setContentLength(pdfFile.length);
			ServletOutputStream out = response.getOutputStream();    
			request.setAttribute("pdfBytes", pdfFile);
			out.write(pdfFile);
			out.flush();
			out.close();
		}} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		log.info("-END--");
	}
	
	@RequestMapping(value = "/goHome")
	public String goHome(HttpServletRequest request) {
		log.info("-START--");
		HttpSession session = request.getSession();
		/*if(null!=session.getAttribute("admin")){
			return "redirect:donationForm.htm";
		}*/
		request.setAttribute("filename", "content");
		log.info("-END--");
		return "welcome";
	}
	
	@RequestMapping(value = "/login")
	public String login(HttpServletRequest request) {
		log.info("-START--");
//		request.setAttribute("filename", "content");
		return "admin/adminwelcome";
	}

	@RequestMapping(value = "/aboutUs")
	public String aboutUs(HttpServletRequest request) {
		log.info("-START--");
		request.setAttribute("filename", "aboutUs");
		return "welcome";
	}
	
	@RequestMapping(value = "/contact")
	public String contact(HttpServletRequest request) {
		log.info("-START--");
		request.setAttribute("filename", "contact");
		return "welcome";
	}
	
	@RequestMapping(value = "/gallery")
	public String gallery(HttpServletRequest request) {
		log.info("-START--");
		request.setAttribute("filename", "gallery");
		return "welcome";
	}
	@RequestMapping(value = "/logoutnow")
	public String logoutnow(HttpServletRequest request) {
		log.info("-START--");
		request.getSession().invalidate();
		request.setAttribute("filename", "content");
		log.info("-END--");
		return "welcome";
	}
	
	@RequestMapping(value = "/trustees")
	public String trustees(HttpServletRequest request) {
		log.info("-START--");
		log.info("-END--+--");
		request.setAttribute("filename", "trustees");
		return "welcome";
	}
	
	@RequestMapping(value = "/checklogin", method = RequestMethod.POST)
	public String onLoginCheck(@ModelAttribute("Login") Login login,HttpServletRequest request,Model model) throws Exception{
		log.info("-START--" + login.getLogin());
		/*String username = login.getLogin();
		String password = login.getXtxtKllFbbd3ES();
		boolean flag = getEmployeeDao().checkLogin(username, password);
		if(flag){
		HttpSession session  = request.getSession(true);
		VbctLoginBO loginbo = this.employeeDao.getEmployeeList(username,password);
		if(loginbo != null)
		{
			session.setAttribute("adminDtl", loginbo);
		}
		log.info("-END---$$$$--");
		session.setAttribute("admin","ADMIN");
		return "redirect:donationForm.htm";
		}else{
			request.setAttribute("wrong", "Invalid Username or Password !!!");*/
		String username = login.getLogin();
		String password = login.getXtxtKllFbbd3ES();
		System.out.println(username +password);
		if(username.equals("admin") && password.equals("admin"))
		{
		model.addAttribute("login", new Login());
		request.setAttribute("filename", "company");
		System.out.println(request.getAttribute("filename"));
		HttpSession session  = request.getSession(true);
		session.setAttribute("admin","admin");
		return "internship/admin/admin_welcome";
		}
		else
		{
			boolean flag = getEmployeeDao().checkLogin(username, password);
			if(flag){
				HttpSession session  = request.getSession(true);
				LoginBo loginbo = this.employeeDao.getStudentList(username,password);
				if(loginbo != null)
				{
					session.setAttribute("studentDtl", loginbo);
					List<StudentInfoBo> info=employeeDao.getstudentlistfromid(loginbo.getStudent_id());
					session.setAttribute("student", info.get(0).getFname()+" "+ info.get(0).getLname());
					//session.setAttribute(arg0, loginbo.get)
				}
				List<JobBo> lst = employeeDao.getjoblist();
				request.setAttribute("lst", lst);
				LoginBo loginboq=(LoginBo)session.getAttribute("studentDtl");
				int student_id=loginboq.getStudent_id();
				List<JobBo> s=employeeDao.getstudentjoblist(student_id);
				request.setAttribute("s", s);
				
				request.setAttribute("filename", "job_tab");
			return "internship/student/student_welcome";
			}
		}
		model.addAttribute("login", new Login());
		request.setAttribute("filename", "login");
		request.setAttribute("Invalid", "Invalid");
		return "welcome";
		}
		
	//ronak
	@RequestMapping(value = "/changePass")
	public void changePass(HttpServletRequest request,
			HttpServletResponse response)throws Exception 
	{
		log.info("START");
		HttpSession session = request.getSession(false);

		String oldPass = request.getParameter("oldPass").toString();
		String newPass = request.getParameter("newPass").toString();

		VbctLoginBO adminDetail = (VbctLoginBO)session.getAttribute("adminDtl");
		
		boolean flag = this.employeeDao.checkPassword(adminDetail.getLogin_id(), oldPass);

		log.info("CHECK PASS  Flag value" + flag);
		System.out.println("CHECK PASS  Flag value" + flag);

		if (flag) {

			boolean flag1 = this.employeeDao.changePassword(adminDetail.getLogin_id(), newPass);
			if (flag1) {
				String a = "success";
				response.setContentType("text/plain"); // Set content type of
														// the
				// response so that jQuery
				// knows what it can expect.
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write(a);
			}

		} else {
			log.info("-END--Wrong");
			String a = "wrongPass";
			response.setContentType("text/plain"); // Set content type of the
			// response so that jQuery
			// knows what it can expect.
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(a);
		}
	}
	
	@RequestMapping(value = "/adminChangePassword")
	public String adminChangePassword(HttpServletRequest request)throws Exception{
		log.info("-START--");
		HttpSession session = request.getSession(false);
		request.setAttribute("class", "adminpassword");
		request.setAttribute("adminfilename", "AdminChangePassword");
		log.info("-END--");
		return "admin/adminwelcome";
	}
	
	@RequestMapping(value = "/deleteSheet")
	public String deleteSheet(HttpServletRequest request,RedirectAttributes redirectAttributes)throws Exception {
		log.info("-START--");
		boolean flag = false;
		try{
			if(request.getParameter("delsheetID") != null)
			{	
				flag = employeeDao.deleteSheetFromID(request.getParameter("delsheetID").toString());
				if(flag)
				{
					redirectAttributes.addFlashAttribute("success", "Record Deleted Succesfully.");
				}
				else
				{
					redirectAttributes.addFlashAttribute("error", "Something went wrong...please try again later");
				}
			}
		}catch(Exception e){}
		log.info("-END--");
		return "redirect:loadManageBalanceSheet.htm";
	}
	@RequestMapping(value = "/hideSheet")
	public String hideSheet(HttpServletRequest request,RedirectAttributes redirectAttributes)throws Exception {
		log.info("-START--");
		boolean flag = false;
		try{
			if(request.getParameter("hidesheetID") != null)
			{	
				flag = employeeDao.hideSheetFromID(request.getParameter("hidesheetID").toString());
				if(flag)
				{
					redirectAttributes.addFlashAttribute("success", "Activity Performed Succesfully.");
				}
				else
				{
					redirectAttributes.addFlashAttribute("error", "Something went wrong...please try again later");
				}
			}
		}catch(Exception e){}
		log.info("-END--");
		return "redirect:loadManageBalanceSheet.htm";
	}
	@RequestMapping(value = "/showSheet")
	public String showSheet(HttpServletRequest request,RedirectAttributes redirectAttributes)throws Exception {
		log.info("-START--");
		boolean flag = false;
		try{
			if(request.getParameter("showsheetID") != null)
			{	
				flag = employeeDao.showSheetFromID(request.getParameter("showsheetID").toString());
				if(flag)
				{
					redirectAttributes.addFlashAttribute("success", "Activity Performed Succesfully.");
				}
				else
				{
					redirectAttributes.addFlashAttribute("error", "Something went wrong...please try again later");
				}
			}
		}catch(Exception e){}
		log.info("-END--");
		return "redirect:loadManageBalanceSheet.htm";
	}
	
	@RequestMapping(value = "/loadManageBalanceSheet")
	public String loadManageBalanceSheet(HttpServletRequest request)throws Exception {
		log.info("-START--");
		BalanceSheetBO bo = null;
		try{
			List<BalanceSheetBO> lstSheetList = employeeDao.getSheetList();
			request.setAttribute("sheetlst", lstSheetList);
			if(request.getParameter("sheetID") != null)
			{	
				bo = employeeDao.getSheetFromTable(request.getParameter("sheetID").toString());
				request.setAttribute("sheetdata", bo.getSheet_data());
			}
		}catch(Exception e){}
		request.setAttribute("adminfilename", "ManageSheetList");
		request.setAttribute("class", "manbal");
		log.info("-END--");
		return "admin/adminwelcome";
	}
	@RequestMapping(value = "/getSheetFromTableForHome")
	public void getSheetFromTableForHome(HttpServletRequest request,HttpServletResponse response)throws Exception {
		log.info("-START--");
		BalanceSheetBO bo = null;
		try{
			List<BalanceSheetBO> lstSheetList = employeeDao.getSheetListForHome();
			request.setAttribute("sheetlst", lstSheetList);
			if(request.getParameter("sheetID") != null)
			{	
				bo = employeeDao.getSheetFromTable(request.getParameter("sheetID").toString());
				response.setContentType("application/pdf");
				response.setHeader("Content-Disposition","attachment;filename=\""+bo.getSheet_title()+" - Balancesheet of year "+bo.getSheet_year()+".pdf\"");
				response.setContentLength(bo.getSheet_data().length);
				ServletOutputStream out = response.getOutputStream();    
				request.setAttribute("pdfBytes", bo.getSheet_data());
				out.write(bo.getSheet_data());
				out.flush();
				out.close();
				
			}
		}catch(Exception e){}
		request.setAttribute("filename", "SheetList");
		log.info("-END--");
	}
	
	@RequestMapping(value = "/getSheetFromTable")
	public void getSheetFromTable(HttpServletRequest request,HttpServletResponse response)throws Exception {
		log.info("-START--");
		BalanceSheetBO bo = null;
		try{
			if(request.getParameter("sheetID") != null)
			{	
				bo = employeeDao.getSheetFromTable(request.getParameter("sheetID").toString());
				response.setContentType("application/pdf");
				response.setHeader("Content-Disposition","attachment;filename=\""+bo.getSheet_title()+"- Balancesheet of year "+bo.getSheet_year()+".pdf\"");
				response.setContentLength(bo.getSheet_data().length);
				ServletOutputStream out = response.getOutputStream();    
				request.setAttribute("pdfBytes", bo.getSheet_data());
				out.write(bo.getSheet_data());
				out.flush();
				out.close();
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error("ERROR OCCURED");
			log.error(e.getMessage(), e);
		}
	}
	
	@RequestMapping(value = "/sheetList")
	public String sheetList(HttpServletRequest request)throws Exception {
		log.info("-START--");
		try{
		List<BalanceSheetBO> lstSheetList = employeeDao.getSheetListForHome();
		request.setAttribute("sheetlst", lstSheetList);
		}catch(Exception e){}
		request.setAttribute("filename", "SheetList");
		log.info("-END--");
		return "welcome";
	}
	
	@RequestMapping(value="/loadAddBalanceSheet")
	public String loadAddBalanceSheet(HttpServletRequest request,Model model)throws Exception{
		log.info("-START--");
		request.setAttribute("class","addsheet");
		request.setAttribute("adminfilename", "AddBalanceSheet");
		model.addAttribute("BalanceSheet", new BalanceSheetBO());

		log.info("-END--");
		return "admin/adminwelcome";
	}
	
	@RequestMapping(value="/loadAddAlbum")
	public String loadAddAlbum(HttpServletRequest request,Model model)throws Exception{
		request.setAttribute("adminfilename", "adminAddAlbum");
		model.addAttribute("AddAlbum", new AddAlbumBO());
		request.setAttribute("class", "addalb");
		return "admin/adminwelcome";
	}
	
	@RequestMapping(value="/loadAddImages")
	public String loadAddImages(HttpServletRequest request,Model model)throws Exception{
		
		
		List<AddAlbumBO> list = getEmployeeDao().loadAlbumNames();
		request.setAttribute("album", list);
		request.setAttribute("adminfilename", "AddImages");
		request.setAttribute("class", "addimg");
		return "admin/adminwelcome";
	}
	@RequestMapping(value="/saveAddAlbum")
	public String saveAddAlbum(HttpServletRequest request,RedirectAttributes redirectAttributes ,@ModelAttribute("AddAlbum") @Valid AddAlbumBO addAlbumBO)throws Exception{
		HttpSession session = request.getSession(false);
		addAlbumBO.setCrt_dt(dateandtime.format(new Date()));
		addAlbumBO.setCrt_usr(session.getAttribute("admin").toString());
		addAlbumBO.setUpd_dt(dateandtime.format(new Date()));
		addAlbumBO.setUpd_usr(session.getAttribute("admin").toString());
		boolean flag = getEmployeeDao().saveBalanceSheet(addAlbumBO);
		if(flag){
			redirectAttributes.addFlashAttribute("success", "Data saved successfully.");
		}else{
			redirectAttributes.addFlashAttribute("error", "Error while saving data.");
		}
		request.setAttribute("class", "addalb");
		return "redirect:loadAddAlbum.htm";
		
	}
	@RequestMapping(value="/saveBalanceSheet")
	public String saveBalanceSheet(HttpServletRequest request,RedirectAttributes redirect, @ModelAttribute("BalanceSheet") @Valid BalanceSheetBO balanceSheetBO)throws Exception{
		log.info("-START--<<< ");
		HttpSession session = request.getSession(false);
		balanceSheetBO.setCrt_dt(dateandtime.format(new Date()));
		balanceSheetBO.setUpd_dt(dateandtime.format(new Date()));
		balanceSheetBO.setCrt_usr(session.getAttribute("admin").toString());
		balanceSheetBO.setSheet_data(balanceSheetBO.getFile().getBytes());
		boolean flag = employeeDao.saveBalanceSheet(balanceSheetBO);
		request.setAttribute("adminfilename", "AddBalanceSheet");
		if(flag){
			redirect.addFlashAttribute("success", "Data saved successfully.");
		}else{
			redirect.addFlashAttribute("error", "Error while saving data.");
		}
		log.info("-END---<<--");
		request.setAttribute("class", "addsheet");
		return "redirect:loadAddBalanceSheet.htm";
	}
	//end ronak
	
	@RequestMapping(value="/donationForm")
	public String donationForm(HttpServletRequest request, Model model){
		log.info("-START--");
		try {
			List<CountrySTDCodeMstBO> list=employeeDao.getCountrySTDCodeList();
			List<DonationBO> lstDonor = employeeDao.admingetDonorList(null, null, null, null);
			request.setAttribute("lstDonor",lstDonor);
			request.setAttribute("list", list);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("adminfilename", "donationForm");
		model.addAttribute("donation",new DonationBO());
		request.setAttribute("class", "donform");
		log.info("--END--+++");
		return "admin/adminwelcome";
	}
	
	@RequestMapping(value="/saveDonationForm")
	public String saveDonationForm(HttpServletRequest request,RedirectAttributes redirect,@Valid @ModelAttribute("donation") DonationBO donationBO){
		log.info("-START--");
		HttpSession session = request.getSession(false);
		if(null!=session.getAttribute("admin")){
		donationBO.setCrt_dt(dateandtime.format(new Date()));
		donationBO.setUpd_dt(dateandtime.format(new Date()));
		donationBO.setCrt_usr(session.getAttribute("admin").toString());
		donationBO.setUpd_usr(session.getAttribute("admin").toString());
		donationBO.setStatus("Y");
		
		boolean flag = employeeDao.saveDonationForm(donationBO);
		if(flag){
			redirect.addFlashAttribute("success", "Data saved successfully.");
		}else{
			redirect.addFlashAttribute("error", "Error while saving data.");
		}
		}else{
			redirect.addFlashAttribute("error", "Error while saving data.");
		}
		log.info("-START--%%%");
		request.setAttribute("class", "donform");
		return "redirect:donationForm.htm";
	}
	@RequestMapping(value="/viewAlbum")
	public String viewAlbum(HttpServletRequest request) throws Exception{
		List<AddAlbumBO> albumBOs = getEmployeeDao().viewAlbum();
		request.setAttribute("list", albumBOs);
		request.setAttribute("filename", "gallery");
		return "welcome";
	}
	
	@RequestMapping(value="/getAlbumImages")
	public String getAlbumImages(HttpServletRequest request) throws Exception{
		String id=null,name=null;
		if(null != request.getParameter("id")){
			id=request.getParameter("id");
			name=request.getParameter(id);
			request.setAttribute("name", name.toUpperCase());
		}
		List<AddImageGalleryBO> list = getEmployeeDao().getalbumimages(id);
		if(list.size()!=0 && null!=list){
			request.setAttribute("list", list);
			request.setAttribute("count", list.size());
		}
		else{
			request.setAttribute("error", "Error while fetching data.");
		}
		request.setAttribute("filename", "admin/albumImages");
		return "welcome";
	}
	
	@RequestMapping(value="/uploadMulitpleImages")
	public String uploadMulitpleImages(HttpServletRequest request, RedirectAttributes redirect) throws Exception{
		System.out.println("image in controller");
		
		String album = request.getParameter("album");
		System.out.println(album);
		String images[] = request.getParameterValues("datasrc");
		System.out.println("SIZEE ==>>" + images.length);
		boolean flag=getEmployeeDao().saveMultipleImg(album,images);
		if(flag){
			redirect.addFlashAttribute("success", "Data saved successfully.");
		}else{
			redirect.addFlashAttribute("error", "Error while saving data.");
		}
		return "redirect:loadAddImages.htm";
	}
	// Internship
	@RequestMapping(value="/savecompany")
	public String savecompany(HttpServletRequest request,RedirectAttributes redirect, @ModelAttribute("AddCompany") @Valid CompanyBo companybo)throws Exception{
		log.info("-START--<<< ");
		/*HttpSession session = request.getSession(false);
		balanceSheetBO.setCrt_dt(dateandtime.format(new Date()));
		balanceSheetBO.setUpd_dt(dateandtime.format(new Date()));
		balanceSheetBO.setCrt_usr(session.getAttribute("admin").toString());
		balanceSheetBO.setSheet_data(balanceSheetBO.getFile().getBytes());
		boolean flag = employeeDao.saveBalanceSheet(balanceSheetBO);
		request.setAttribute("adminfilename", "AddBalanceSheet");
		if(flag){
			redirect.addFlashAttribute("success", "Data saved successfully.");
		}else{
			redirect.addFlashAttribute("error", "Error while saving data.");
		}
		log.info("-END---<<--");
		request.setAttribute("class", "addsheet");*/
		System.out.println(companybo.getCity());
		 employeeDao.saveDataComon(companybo);
		request.setAttribute("filename", "company");
		System.out.println(request.getAttribute("filename"));
		return "internship/admin/admin_welcome";
		}
	
	@RequestMapping(value="/saveSkill")
	public String saveSkill(HttpServletRequest request,RedirectAttributes redirect, @ModelAttribute("AddSkill") @Valid SkillBo skillbo)throws Exception{
		log.info("-START--<<< ");
		
		
		 employeeDao.saveDataComon(skillbo);
		request.setAttribute("filename", "Skills");
		System.out.println(request.getAttribute("filename"));
		return "internship/admin/admin_welcome";
		}
	@RequestMapping(value = "/loadSkill")
	public String loadSkill(HttpServletRequest request) {
		log.info("-START--");
		request.setAttribute("filename", "Skills");
		return "internship/admin/admin_welcome";
	}
	@RequestMapping(value="/savejob")
	public String savejob(HttpServletRequest request,RedirectAttributes redirect, @ModelAttribute("AddJob") @Valid JobBo jobbo)throws Exception{
		log.info("-START--<<< ");
		 employeeDao.saveDataComon(jobbo);
		 loadjob(request);
		request.setAttribute("filename", "add_job");
		System.out.println(request.getAttribute("filename"));
		return "internship/admin/admin_welcome";
		}
	@RequestMapping(value = "/loadjob")
	public String loadjob(HttpServletRequest request) throws Exception {
		log.info("-START--");
		List<CompanyBo> lst = employeeDao.getcompanylist();
		System.out.println(lst.get(0).getCompany_name());
		request.setAttribute("lst", lst);
		List<SkillBo> skill=employeeDao.getskilllist();
		request.setAttribute("skill",skill);
		request.setAttribute("filename", "add_job");
		return "internship/admin/admin_welcome";
	}
	
	@RequestMapping(value="/loadstudentForm")
	public String loadstudentForm(HttpServletRequest request, Model model) throws Exception{
		System.out.println("in load student form");
		model.addAttribute("common", new CommonDTO());
		request.setAttribute("filename", "student_info");
		return "internship/admin/admin_welcome";
	}
	@RequestMapping(value="/saveDemo")
	public String saveDemo(HttpServletRequest request,RedirectAttributes redirect, @ModelAttribute("common") @Valid CommonDTO commondto)throws Exception{
		
		StudentEducationBo e=commondto.getEdu();
		StudentInfoBo i=commondto.getInfo();
		StudentCertificateBo certificatebo=commondto.getCerti();
		StudentWorkBo work=commondto.getWork();
		Integer stu_id=i.getStudent_id();
		/*employeeDao.savestudentinfo(i);
		employeeDao.savestudentedu(e,stu_id);
        employeeDao.savestucertificate(certificatebo,stu_id);
        employeeDao.saveworkexp(work,stu_id);*/
        String email_id=(String) i.getStu_email();
		  final String username = "vanditshah1294@gmail.com";
		    final String password = "9408754038";
		    
		    
		    Properties props = System.getProperties();
	        props.put("mail.smtps.host","smtp.gmail.com");
	        props.put("mail.smtps.auth","true");
	        props.put("mail.smtp.port", "25");
	        Session session = Session.getInstance(props, null);
	        Message msg = new MimeMessage(session);
	        msg.setFrom(new InternetAddress(username));
	        
	        msg.setRecipients(Message.RecipientType.TO,
	        InternetAddress.parse(email_id, false));
	        String fname=i.getFname();
	        String[] email_id1=email_id.split("@");
	        String upToNCharacters = email_id.substring(0, Math.min(email_id.length(), 4));
	   
	        String stu_id1= String.valueOf(i.getStudent_id());
	        String stu_idPwd=stu_id1.substring(4,8);
	        msg.setSubject("Successfully Register");
	        msg.setText("Dear  " +i.getFname()+" "+ i.getLname()+""+
	        "\n\n You are succesfully register in Internship Management System!" +
	        "\n Your Username is  "+fname+stu_idPwd+" "+" And Password is "+upToNCharacters+stu_idPwd+"");
	        msg.setSentDate(new Date());
	        SMTPTransport t =
	            (SMTPTransport)session.getTransport("smtps");
//	        t.co
	        t.connect("smtp.gmail.com",username, password);
	        t.sendMessage(msg, msg.getAllRecipients());
	        System.out.println("Response: " + t.getLastServerResponse());
	        t.close();
		   /* Properties props = new Properties();
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.smtp.host", "smtp.gmail.com");
			props.put("mail.smtp.port", "587");

			Session session = Session.getInstance(props,
			  new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(username, password);
				}
			  });

			try {

				Message message = new MimeMessage(session);
				message.setFrom(new InternetAddress("vanditshah1294@gmail.com"));
				message.setRecipients(Message.RecipientType.TO,
					InternetAddress.parse("vanditshah1294@gmail.com"));
				message.setSubject("Testing Subject");
				message.setText("Dear Mail Crawler,"
					+ "\n\n No spam to my email, please!");

				Transport.send(message);

				System.out.println("Done");


			} catch (MessagingException se) {
				throw new RuntimeException(se);
			}
		employeeDao.savestudentinfo(i);
		employeeDao.savestudentedu(e,stu_id);
        employeeDao.savestucertificate(certificatebo,stu_id);
        employeeDao.saveworkexp(work,stu_id);
        
       */
	        employeeDao.savestudentinfo(i);
			employeeDao.savestudentedu(e,stu_id);
	        employeeDao.savestucertificate(certificatebo,stu_id);
	        employeeDao.saveworkexp(work,stu_id);
	        LoginBo loginbo=new LoginBo();
	        loginbo.setUsername(fname+stu_idPwd);
	        loginbo.setPwd(upToNCharacters+stu_idPwd);
	        loginbo.setFlag("Y");
	        loginbo.setUser_type("Student");
	        loginbo.setStudent_id(stu_id);
	        employeeDao.saveDataComon(loginbo);
		request.setAttribute("filename", "student_info");
		return "internship/admin/admin_welcome";
		
	}
	
	@RequestMapping(value="/addcompany")
	public String addcompany(HttpServletRequest request, Model model) throws Exception{
		System.out.println("in load student form");
		request.setAttribute("filename", "company");
		return "internship/admin/admin_welcome";
	}

	@RequestMapping(value="/joblist")
	public String joblist(HttpServletRequest request, Model model) throws Exception{
		List<JobBo> lst = employeeDao.getjoblist();
		request.setAttribute("lst", lst);
		HttpSession session = request.getSession(false);
		LoginBo loginbo=(LoginBo)session.getAttribute("studentDtl");
		int student_id=loginbo.getStudent_id();
		List<JobBo> s=employeeDao.getstudentjoblist(student_id);
		request.setAttribute("s", s);
		
		request.setAttribute("filename", "job_tab");
		return "internship/student/student_welcome";
	}
	
	@RequestMapping(value="/jobInterest")
	public String jobInterest(HttpServletRequest request, Model model) throws Exception{
		String jobid=request.getParameter("job_id");
	
				HttpSession session = request.getSession(false);
				LoginBo loginbo=(LoginBo)session.getAttribute("studentDtl");
				int student_id=loginbo.getStudent_id();
				int i = Integer.parseInt(jobid);
				Student_Job_mapping s=new Student_Job_mapping();
				s.setJob_id(i);
				s.setStudent_id(student_id);
				 employeeDao.saveDataComon(s);
				System.out.println(student_id+"ssss"+jobid);
				List<JobBo> lst = employeeDao.getjoblist();
				request.setAttribute("lst", lst);
				List<JobBo> s1=employeeDao.getstudentjoblist(student_id);
				request.setAttribute("s", s1);
	        	request.setAttribute("filename", "job_tab");
		        return "internship/student/student_welcome";
	}
	@RequestMapping(value="/saveinternship")
	public String saveinternship(HttpServletRequest request,RedirectAttributes redirect, @ModelAttribute("AddInternship") @Valid InternshipTypeBo i)throws Exception{
		log.info("-START--<<< ");
		
		
		 employeeDao.saveDataComon(i);
		request.setAttribute("filename", "add_internship");
		System.out.println(request.getAttribute("filename"));
		return "internship/admin/admin_welcome";
		}

	@RequestMapping(value="/loadinternship")
	public String loadinternship(HttpServletRequest request, Model model) throws Exception{
		request.setAttribute("filename", "add_internship");
		return "internship/admin/admin_welcome";
	}
	@RequestMapping(value="/student_report")
	public String student_report(HttpServletRequest request, Model model) throws Exception{
		/*List<CompanyBo> lst = employeeDao.getcompanylist();
		System.out.println(lst.get(0).getCompany_name());
		request.setAttribute("employers_lst", lst);*/
		List<ReportlistBo> year=employeeDao.getstudentyear();
		request.setAttribute("year", year);
		List<ReportlistBo> country=employeeDao.getstudentcountry();
		request.setAttribute("country", country);
		request.setAttribute("filename", "search_report");
		return "internship/admin/admin_welcome";
	}
	@RequestMapping(value="/internshp_type_report")
	public String internshp_type_report(HttpServletRequest request, Model model) throws Exception{
		List<InternshipTypeBo> i=employeeDao.getinternshiplist();
		request.setAttribute("i", i);
		List<StudentInfoBo> li=employeeDao.getstudentinternshipwise();
		request.setAttribute("list_internshiiipStu", li);
		request.setAttribute("filename", "search_internship_type");
		return "internship/admin/admin_welcome";
	}
	@RequestMapping(value="/company_report")
	public String company_report(HttpServletRequest request, Model model) throws Exception{
		List<CompanyBo> lst = employeeDao.getcompanylist();
		System.out.println(lst.get(0).getCompany_name());
		request.setAttribute("employers_lst", lst);
		List<ReportlistBo> city_list=employeeDao.getcompanycity();
		request.setAttribute("city_list", city_list);
		request.setAttribute("filename", "search_report_employers");
		return "internship/admin/admin_welcome";
	}
	
	@RequestMapping(value="/gpa_report")
	public String gpa_report(HttpServletRequest request, Model model) throws Exception{
		/*List<CompanyBo> lst = employeeDao.getcompanylist();
		System.out.println(lst.get(0).getCompany_name());
		request.setAttribute("employers_lst", lst);*/
		List<ReportlistBo> year=employeeDao.getstudentyear();
		request.setAttribute("year", year);
		List<ReportlistBo> country=employeeDao.getstudentcountry();
		request.setAttribute("country", country);
		List<StudentGpaBo> lst=employeeDao.getstudentavggpa();
		request.setAttribute("lst", lst);
		 List<ReportlistBo> university=employeeDao.getuniversity();
		 request.setAttribute("university", university);
		 List<ReportlistBo> university_location=employeeDao.getuniversity_location();
		 System.out.println(university_location);
		 request.setAttribute("university_location", university_location);
		request.setAttribute("filename", "gpa._report");
		return "internship/admin/admin_welcome";
	}
	@RequestMapping(value="/loadinternship_status")
	public String loadinternship_status(HttpServletRequest request, Model model) throws Exception{
		List<StudentInfoBo> info=employeeDao.getallstudentdata();
		request.setAttribute("lst", info);
		request.setAttribute("filename", "student_internshiplist");
		return "internship/admin/admin_welcome";
	}
	@RequestMapping(value="/insert_student_status")
	public String insert_student_status(HttpServletRequest request, Model model) throws Exception{
		int studentid=Integer.parseInt(request.getParameter("student_id"));
		request.setAttribute("studentid", studentid);
		List<CompanyBo> lst = employeeDao.getcompanylist();
		System.out.println(lst.get(0).getCompany_name());
		request.setAttribute("lst", lst);
		List<JobBo> lst1 = employeeDao.getjoblist();
		request.setAttribute("lst1", lst1);
		List<InternshipTypeBo> i=employeeDao.getinternshiplist();
		request.setAttribute("i", i);
		request.setAttribute("filename", "Student_internship_status");
		return "internship/admin/admin_welcome";
	}
	@RequestMapping(value="/getjobfromcompanyajax")
	public void getjobfromcompanyajax(HttpServletRequest request,HttpServletResponse response, Model model) throws Exception{
		String company_id=(String)request.getParameter("company_id");
		
		List<JobBo> lst=employeeDao.getjoblistfromcompany(company_id);
		Map<String, String> ind = new LinkedHashMap<String, String>();
for(int i=0;i<lst.size();i++)
{
	String job_id=Integer.toString(lst.get(i).getJob_id());
	ind.put(job_id, lst.get(i).getJob_position());
}

String json=new Gson().toJson(ind);
System.out.println(json);
response.setContentType("application/json");
response.setCharacterEncoding("UTF-8");
response.getWriter().write(json);
	}
	@RequestMapping(value="/saveInternship_status")
	public String saveInternship_status(HttpServletRequest request,RedirectAttributes redirect, @ModelAttribute("AddStudentInternship") @Valid StudentInternshipBo i)throws Exception{
		log.info("-START--<<< ");
		List<CompanyBo> lst = employeeDao.getcompanylist();
		System.out.println(lst.get(0).getCompany_name());
		request.setAttribute("lst", lst);
		List<JobBo> lst1 = employeeDao.getjoblist();
		request.setAttribute("lst1", lst1);
		List<InternshipTypeBo> is=employeeDao.getinternshiplist();
		request.setAttribute("i", is);
		request.setAttribute("filename", "Student_internship_status");
		System.out.println(request.getAttribute("filename"));
		employeeDao.saveDataComon(i);
		employeeDao.updatestudent_status(i.getStudent_id(),i.getInternship_type());
		return "internship/admin/admin_welcome";
		}
	@RequestMapping(value="/saveInternship_status_company")
	public String saveInternship_status_company(HttpServletRequest request,RedirectAttributes redirect, @ModelAttribute("AddStudentInternshipCompany") @Valid StudentInternshipBo i)throws Exception{
		log.info("-START--<<< ");
		i.setInternship_id(1);
		List<ApprovalStudentBo> info=employeeDao.getstudentapprovedlist();
		request.setAttribute("info", info);
		request.setAttribute("filename","approval_student_list");
		employeeDao.saveDataComon(i);
		employeeDao.updatestudent_status(i.getStudent_id(),i.getInternship_type());
		return "internship/admin/admin_welcome";
		}
	
	@RequestMapping(value="/searchreport")
	public String searchreport(HttpServletRequest request,RedirectAttributes redirect, @ModelAttribute("SearchReport") @Valid ReportBo r)throws Exception{
		log.info("-START--<<< ");
		 List<StudentInfoBo> list=employeeDao.searchreport(r);
		 request.setAttribute("list", list);
		request.setAttribute("filename", "report_student_list");
		System.out.println(request.getAttribute("filename"));
		return "internship/admin/admin_welcome";
		}
	@RequestMapping(value="/searchemployers")
	public String searchemployers(HttpServletRequest request,RedirectAttributes redirect, @ModelAttribute("Searchemployers") @Valid ReportBo r)throws Exception{
		log.info("-START--<<< ");
		 List<CompanyBo> list=employeeDao.searchreportcompany(r);
		 request.setAttribute("employers_lst", list);
		 System.out.println(list.size());
		request.setAttribute("filename", "search_report_employers");
		List<ReportlistBo> city_list=employeeDao.getcompanycity();
		request.setAttribute("city_list", city_list);
		System.out.println(request.getAttribute("filename"));
		return "internship/admin/admin_welcome";
		}
	@RequestMapping(value="/searchinterntype")
	public String searchinterntype(HttpServletRequest request,RedirectAttributes redirect, @ModelAttribute("Searchemployers") @Valid ReportBo r)throws Exception{
		log.info("-START--<<< ");
		 List<StudentInfoBo> list=employeeDao.searchinterntype_student(r);
		 request.setAttribute("list_internshiiipStu", list);
		 List<InternshipTypeBo> i=employeeDao.getinternshiplist();
			request.setAttribute("i", i);
		 System.out.println(list.size());
		request.setAttribute("filename", "search_internship_type");
		System.out.println(request.getAttribute("filename"));
		return "internship/admin/admin_welcome";
		}
	@RequestMapping(value="/searchgpa")
	public String searchgpa(HttpServletRequest request,RedirectAttributes redirect, @ModelAttribute("Searchgpa") @Valid ReportBo r)throws Exception{
		log.info("-START--<<< ");
		List<ReportlistBo> year=employeeDao.getstudentyear();
		request.setAttribute("year", year);
		List<ReportlistBo> country=employeeDao.getstudentcountry();
		request.setAttribute("country", country);
		 List<StudentGpaBo> lst=employeeDao.search_gpa(r);
		 request.setAttribute("lst", lst);		
		 List<ReportlistBo> university=employeeDao.getuniversity();
		 request.setAttribute("university", university);
		 List<ReportlistBo> university_location=employeeDao.getuniversity_location();
		 request.setAttribute("university_location", university_location);
		request.setAttribute("filename", "gpa._report");
		System.out.println(request.getAttribute("filename"));
		return "internship/admin/admin_welcome";
		}
	
	@RequestMapping(value="/student_skill")
	public String student_skill(HttpServletRequest request, Model model) throws Exception{
		List<SkillBo> skill_list=employeeDao.getskilllist();
		request.setAttribute("skill_list", skill_list);
		request.setAttribute("filename","Student_skill");
		return "internship/student/student_welcome";
	}
	@RequestMapping(value="/saveStudentskill")
	public String saveStudentskill(HttpServletRequest request,RedirectAttributes redirect, @ModelAttribute("StudentSkill") @Valid StudentSkillBo r)throws Exception{
		log.info("-START--<<< ");
		String[] shah=request.getParameterValues("student_id");
		String s="";
		for(int i=0;i<shah.length;i++)
		{
			 s= s+shah[i]+","+"";
		}
		s = s.substring(0, s.length()-1);
		System.out.println("skill"+s);
		HttpSession session = request.getSession(false);
		
		LoginBo loginbo=(LoginBo)session.getAttribute("studentDtl");
		int student_id=loginbo.getStudent_id();
		System.out.println(student_id);
		r.setStudent_id(student_id);
		List<SkillBo> skill_list=employeeDao.getskilllist();
		request.setAttribute("skill_list", skill_list);
		employeeDao.savestudent_skill(student_id,shah);
		request.setAttribute("filename", "Student_skill");
		System.out.println(request.getAttribute("filename"));
		return "internship/student/student_welcome";
		}
	
	@RequestMapping(value="/student_basic_info")
	public String student_basic_info(HttpServletRequest request, Model model) throws Exception{
		HttpSession session = request.getSession(false);

		LoginBo loginbo=(LoginBo)session.getAttribute("studentDtl");
		int student_id=loginbo.getStudent_id();
		System.out.println(student_id);
		List<StudentInfoBo> list=employeeDao.getstudentlistfromid(student_id);
		request.setAttribute("list", list);
		request.setAttribute("filename","student_profile_info");
		return "internship/student/student_welcome";
	}
	
	@RequestMapping(value="/student_edu")
	public String student_edu(HttpServletRequest request, Model model) throws Exception{
		HttpSession session = request.getSession(false);

		LoginBo loginbo=(LoginBo)session.getAttribute("studentDtl");
		int student_id=loginbo.getStudent_id();
		System.out.println(student_id);
		List<StudentEducationBo> list=employeeDao.getstudentedulistfromid(student_id);
		request.setAttribute("list", list);
		request.setAttribute("filename","student_edu_info");
		return "internship/student/student_welcome";
	}
	
	@RequestMapping(value="/edit_education_info")
	public String edit_education_info(HttpServletRequest request,RedirectAttributes redirect, @ModelAttribute("EditEdu") @Valid StudentEducationBo r)throws Exception{
		log.info("-START--<<< ");
		HttpSession session = request.getSession(false);

		LoginBo loginbo=(LoginBo)session.getAttribute("studentDtl");
		int student_id=loginbo.getStudent_id();
		int id=r.getStu_edu_id();
		r.setMajor(request.getParameter("major"+id+""));
		r.setDegree_gpa(request.getParameter("degree_gpa"+id+""));
		r.setDegree_type(request.getParameter("degree_type"+id+""));
		r.setUniversity(request.getParameter("university"+id+""));
		r.setUniversity_location(request.getParameter("university_location"+id+""));
		r.setMajor(request.getParameter("major"+id+""));

		System.out.println(r.getMajor());
		r.setStudent_id(student_id);
		employeeDao.updateeducationinfo(r);
		List<StudentEducationBo> list=employeeDao.getstudentedulistfromid(student_id);
		request.setAttribute("list", list);
		request.setAttribute("filename", "student_edu_info");
		System.out.println(request.getAttribute("filename"));
		return "internship/student/student_welcome";
		}
	@RequestMapping(value="/student_certi")
	public String student_certi(HttpServletRequest request, Model model) throws Exception{
		HttpSession session = request.getSession(false);

		LoginBo loginbo=(LoginBo)session.getAttribute("studentDtl");
		String student_id=loginbo.getStudent_id()+"";
		System.out.println(student_id);
		List<StudentCertificateBo> list=employeeDao.getstudentcertilistfromid(student_id);
		request.setAttribute("list", list);
		request.setAttribute("filename","student_certi_info");
		return "internship/student/student_welcome";
	}
	@RequestMapping(value="/student_work")
	public String student_work(HttpServletRequest request, Model model) throws Exception{
		HttpSession session = request.getSession(false);

		LoginBo loginbo=(LoginBo)session.getAttribute("studentDtl");
		String student_id=loginbo.getStudent_id()+"";
		List<StudentWorkBo> list=employeeDao.getstudentworklistfromid(student_id);
		request.setAttribute("list", list);
		request.setAttribute("filename","student_work_info");
		return "internship/student/student_welcome";
	}
	
	@RequestMapping(value="/edit_certi_info")
	public String edit_certi_info(HttpServletRequest request,RedirectAttributes redirect, @ModelAttribute("EditCerti") @Valid StudentCertificateBo r)throws Exception{
		log.info("-START--<<< ");
		HttpSession session = request.getSession(false);

		LoginBo loginbo=(LoginBo)session.getAttribute("studentDtl");
		String student_id=loginbo.getStudent_id()+"";
		int id=r.getCertificate_id();
		r.setCertificate_title(request.getParameter("certificate_title"+id+""));
		r.setCertificate_body(request.getParameter("certificate_body"+id+""));
		r.setStudent_id(student_id);
		employeeDao.updateCERTIcationinfo(r);
		List<StudentCertificateBo> list=employeeDao.getstudentcertilistfromid(student_id);
		request.setAttribute("list", list);
		request.setAttribute("filename", "student_certi_info");
		System.out.println(request.getAttribute("filename"));
		return "internship/student/student_welcome";
		}
	
	@RequestMapping(value="/edit_work_info")
	public String edit_work_info(HttpServletRequest request,RedirectAttributes redirect, @ModelAttribute("EditCerti") @Valid StudentWorkBo r)throws Exception{
		log.info("-START--<<< ");
		HttpSession session = request.getSession(false);

		LoginBo loginbo=(LoginBo)session.getAttribute("studentDtl");
		int student_id=loginbo.getStudent_id();
		String student_id1=student_id+"";
		int id=r.getStu_work_id();
		r.setCompany(request.getParameter("company"+id+""));
		r.setCompany_location(request.getParameter("company_location"+id+""));
		r.setStart_date(request.getParameter("start_date"+id+""));
		r.setPosition(request.getParameter("position"+id+""));
		r.setStudent_id(student_id);
		employeeDao.updateworkcationinfo(r);
		//List<StudentCertificateBo> list=employeeDao.getstudentcertilistfromid(student_id);
		List<StudentWorkBo> list=employeeDao.getstudentworklistfromid(student_id1);

		request.setAttribute("list", list);
		request.setAttribute("filename", "student_work_info");
		System.out.println(request.getAttribute("filename"));
		return "internship/student/student_welcome";
		}
	
	@RequestMapping(value="/job_report")
	public String job_report(HttpServletRequest request, Model model) throws Exception{
		List<CompanyBo> lst = employeeDao.getcompanylist();
		System.out.println(lst.get(0).getCompany_name());
		request.setAttribute("lst", lst);
		/*List<JobBo> lst = employeeDao.getjoblist();
		request.setAttribute("lst", lst);*/
		request.setAttribute("filename","job_report");
		return "internship/admin/admin_welcome";
	}
	
	@RequestMapping(value="/getjobfromcompany")
	public String getjobfromcompany(HttpServletRequest request, Model model) throws Exception{
		
		String company_id=(String)request.getParameter("company_id");
		List<JobBo> lst=employeeDao.getjoblistfromcompany(company_id);

		
		request.setAttribute("lst", lst);
		request.setAttribute("filename","report_joblist");
		return "internship/admin/admin_welcome";
	}
	
	@RequestMapping(value="/getstudentfromjjob")
	public String getstudentfromjjob(HttpServletRequest request, Model model) throws Exception{
		
		String job_id=(String)request.getParameter("job_id");
		List<StudentJobSkillbo> lst=employeeDao.getstudentfromjjob(job_id);
		HttpSession session = request.getSession(false);
		session.setAttribute("job_id", job_id);
		request.setAttribute("lst", lst);
		request.setAttribute("job_id", job_id);
		request.setAttribute("filename","student_job_approval");
		return "internship/admin/admin_welcome";
	}
	@RequestMapping(value="/job_approval")
	public String job_approval(HttpServletRequest request, Model model) throws Exception{
		
		String job_id=(String)request.getParameter("job_id");
		List<StudentJobSkillbo> lst=employeeDao.getstudentfromjjob(job_id);
		request.setAttribute("lst", lst);
		String student_id=(String) request.getParameter("student_id");
		employeeDao.updatestudentjobflag(job_id,student_id);
		System.out.println(job_id+"  "+student_id);
		request.setAttribute("filename","student_job_approval");
		return "internship/admin/admin_welcome";
	}
	@RequestMapping(value="/approved_student")
	public String approved_student(HttpServletRequest request, Model model) throws Exception{
		
		List<ApprovalStudentBo> info=employeeDao.getstudentapprovedlist();
		request.setAttribute("info", info);
		request.setAttribute("filename","approval_student_list");
		return "internship/admin/admin_welcome";
	}
	
	@RequestMapping(value="/insert_company_student_status")
	public String insert_company_student_status(HttpServletRequest request, Model model) throws Exception{
		
		List<ApprovalStudentBo> info=employeeDao.getstudentapprovedlist();
		request.setAttribute("info", info);
		String job_id=(String)request.getParameter("job_id");
		String student_id=(String)request.getParameter("student_id");
		String company_id=(String)request.getParameter("company_id");
		String company_name=(String)request.getParameter("company_name");
		String job_position=(String)request.getParameter("job_position");
		
		request.setAttribute("job_id", job_id);
		request.setAttribute("company_id", company_id);
		request.setAttribute("student_id", student_id);
		request.setAttribute("company_name", company_name);
		request.setAttribute("job_position", job_position);

		request.setAttribute("filename","student_internship_status_company");
		return "internship/admin/admin_welcome";
	}
}

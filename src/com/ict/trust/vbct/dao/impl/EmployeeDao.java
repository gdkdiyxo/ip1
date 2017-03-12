package com.ict.trust.vbct.dao.impl;

import java.util.List;

import org.springframework.stereotype.Component;

import com.ict.trust.vbct.model.AddAlbumBO;
import com.ict.trust.vbct.model.AddImageGalleryBO;
import com.ict.trust.vbct.model.ApprovalStudentBo;
import com.ict.trust.vbct.model.BalanceSheetBO;
import com.ict.trust.vbct.model.CompanyBo;
import com.ict.trust.vbct.model.CountrySTDCodeMstBO;
import com.ict.trust.vbct.model.DonationBO;
import com.ict.trust.vbct.model.Employee;
import com.ict.trust.vbct.model.InternshipTypeBo;
import com.ict.trust.vbct.model.JobBo;
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
import com.ict.trust.vbct.model.StudentWorkBo;
import com.ict.trust.vbct.model.Student_Job_mapping;
import com.ict.trust.vbct.model.VbctLoginBO;

@Component
public interface EmployeeDao {
	
	public List<DonationBO> getDonorByNameAjax(String name);
	public boolean saveDonationForm(DonationBO donationBO);
	//ronak	
	public boolean showSheetFromID(String string)throws Exception;
	public boolean hideSheetFromID(String string)throws  Exception;
	public boolean changePassword(String login_id, String newPass)throws Exception;
	public boolean checkPassword(String login_id, String oldPass)throws Exception;
	public VbctLoginBO getEmployeeList(String username, String password)throws Exception;
	public List<BalanceSheetBO> getSheetListForHome()throws Exception;
	public boolean deleteSheetFromID(String string)throws Exception;
	public boolean saveBalanceSheet(BalanceSheetBO balanceSheetBO)throws Exception;
	public List<BalanceSheetBO> getSheetList()throws Exception;
	public BalanceSheetBO getSheetFromTable(String string)throws Exception;
	//end ronak
	public List<DonationBO> getDonorList(String date) throws Exception;
	public <T> T saveDataComon(T t) throws Exception;
	public boolean deleteDonor(String id) throws Exception;
	public List<CountrySTDCodeMstBO> getCountrySTDCodeList()throws Exception;
	public boolean checkLogin(String username, String password) throws Exception;
	List<DonationBO> admingetDonorList(String name, String purpose, String year, String country) throws Exception;
	public boolean saveBalanceSheet(AddAlbumBO addAlbumBO)throws Exception;
	
//	nishant umang gallery
	public List<AddAlbumBO> viewAlbum() throws Exception;
	public List<AddAlbumBO> loadAlbumNames() throws Exception;
	public boolean saveMultipleImg(String album, String[] images)throws Exception;
	public List<AddImageGalleryBO> getalbumimages(String id)throws  Exception;
//	nishant umang gallery ends
	
	public boolean hideDonor(String id, String status) throws Exception;
	public List<String> getDonorYearDrop();
	public boolean savecompany(CompanyBo companybo)throws Exception;
	public void savestudentinfo(StudentInfoBo i)throws Exception;
	public void savestudentedu(StudentEducationBo e, Integer stu_id)throws Exception;
	public void savestucertificate(StudentCertificateBo certificatebo,
			Integer stu_id)throws Exception;
	public void saveworkexp(StudentWorkBo work, Integer stu_id)throws Exception;
	public List<CompanyBo> getcompanylist()throws Exception;
	public List<JobBo> getjoblist()throws Exception;
	public LoginBo getStudentList(String username, String password);
	public List<JobBo> getstudentjoblist(int student_id)throws Exception;
	public List<SkillBo> getskilllist()throws Exception;
	public List<StudentInfoBo> getallstudentdata()throws Exception;
	public List<JobBo> getjoblistfromcompany(String company_id)throws Exception;
	public List<InternshipTypeBo> getinternshiplist()throws Exception;
	public void updatestudent_status(int i,String internship_type)throws Exception;
	public List<StudentInfoBo> searchreport(ReportBo r)throws Exception;
	public List<CompanyBo> searchreportcompany(ReportBo r)throws Exception;
	public List<StudentInfoBo> searchinterntype_student(ReportBo r)throws Exception;
	public List<StudentInfoBo> getstudentinternshipwise()throws Exception;
	public List<StudentGpaBo> getstudentavggpa()throws Exception;
	public List<StudentGpaBo> search_gpa(ReportBo r)throws Exception;
	public List<StudentInfoBo> getstudentlistfromid(int student_id)throws Exception;
	public List<StudentEducationBo> getstudentedulistfromid(int student_id)throws Exception;
	public void updateeducationinfo(StudentEducationBo r)throws Exception;
	public List<StudentCertificateBo> getstudentcertilistfromid(String student_id)throws Exception;
	public void updateCERTIcationinfo(StudentCertificateBo r)throws Exception;
	public List<StudentJobSkillbo> getstudentfromjjob(String job_id)throws Exception;
	public void savestudent_skill(int student_id, String[] shah);
	public void updatestudentjobflag(String job_id, String student_id)throws Exception;
	public List<ApprovalStudentBo> getstudentapprovedlist()throws Exception;
	public List<ReportlistBo> getstudentyear()throws Exception;
	public List<ReportlistBo> getstudentcountry()throws Exception;
	public List<ReportlistBo> getuniversity()throws Exception;
	public List<ReportlistBo> getuniversity_location()throws Exception;
	public List<StudentWorkBo> getstudentworklistfromid(String student_id)throws Exception;
	public void updateworkcationinfo(StudentWorkBo r)throws Exception;
	public List<ReportlistBo> getcompanycity()throws Exception;

	
	
}

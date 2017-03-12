package com.ict.trust.vbct.dao.impl;

import java.io.Serializable;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;
import org.eclipse.jdt.internal.compiler.flow.FinallyFlowContext;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.transform.Transformers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

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
import com.ict.trust.vbct.model.StudentSkillBo;
import com.ict.trust.vbct.model.StudentWorkBo;
import com.ict.trust.vbct.model.Student_Job_mapping;
import com.ict.trust.vbct.model.VbctLoginBO;

@Component
@Repository
public class EmployeeDaoImpl implements EmployeeDao {

	Logger log = Logger.getLogger(EmployeeDaoImpl.class);
	
	private SessionFactory sessionFactory;
	DateFormat dateandtime = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public boolean saveDonationForm(DonationBO donationBO) {
		Session session = null;
		Transaction tr = null;
		boolean flag = false;
		try{
			session = getSessionFactory().openSession();
			tr = session.beginTransaction();
			
			Serializable serializable = session.save(donationBO);
			
			System.out.println(serializable);
			if(null != serializable){
				flag = true;
			}else{
				flag = false;
			}
			tr.commit();
		}catch(Exception e){
			e.printStackTrace();
		}
		finally{
			session.close();
		}
		return flag;
	}
	//ronak
	public boolean changePassword(String login_id, String newPass)
			throws Exception {
		log.info("START");
		Session session = null;
		Transaction tr = null;
		try{
			session = getSessionFactory().openSession();
			tr = session.beginTransaction();
			Query query= session.createQuery("UPDATE VbctLoginBO SET login_password = '"+newPass+"' where login_id='"+login_id+"'");
			int r = query.executeUpdate();
			log.info("ROWS AFFECTED -- > "+r);
			tr.commit();
			return true;
		}catch(Exception e){
			log.error("ERROR OCCURED");
			log.error(e.getMessage(), e);
			e.printStackTrace();
			tr.rollback();
			return false;
		}
		finally{
			log.info("END");
			session.close();
		}
	}

	public boolean checkPassword(String login_id, String oldPassword)
			throws Exception {
		log.info("START");
		List<VbctLoginBO> UserVerifiedList = null;
		Session s = getSessionFactory().openSession();
		StringBuffer strQuery = new StringBuffer(" from VbctLoginBO  where "
				+ "login_id = ? and login_password = ? ");

		Query query = s.createQuery(strQuery.toString());
		query.setParameter(0, login_id);
		query.setParameter(1, oldPassword);
		UserVerifiedList = query.list();
		s.close();
		if (UserVerifiedList.size() != 0) {
			log.info("END");
			return true;
		} else {
			log.info("END");
			return false;
		}
	}
	public VbctLoginBO getEmployeeList(String username, String password)
			throws Exception {
		log.info("START");
		Session session = null;
		List<VbctLoginBO> list = null;
		VbctLoginBO loginbo = null;
		try{
			session = getSessionFactory().openSession();
			Query query= session.createQuery("From VbctLoginBO where login_name = '"+username+"' and login_password = '"+password+"'");
			list = query.list();
			if(list.size() != 0)
			{
				loginbo = list.get(0);
			}
			return loginbo;
		}catch(Exception e){
			log.error("ERROR OCCURED");
			log.error(e.getMessage(), e);
			e.printStackTrace();
		}
		finally{
			log.info("END");
			session.close();
		}
		return loginbo;
	}
	public List<BalanceSheetBO> getSheetListForHome() throws Exception {
		log.info("START");
		Session session = null;
		Transaction tr = null;
		List<BalanceSheetBO> lstsheet = null;
		try{
			session = getSessionFactory().openSession();
			tr = session.beginTransaction();
			Query query= session.createSQLQuery("Select sheet_id as sheet_id,sheet_title as sheet_title,sheet_year as sheet_year,status as status from (Select sheet_id as sheet_id,sheet_title as sheet_title,sheet_year as sheet_year,status as status from balance_sheet_mst where status = 'N' ORDER BY sheet_year desc) where ROWNUM <= 5").setResultTransformer(Transformers.aliasToBean(BalanceSheetBO.class));
			lstsheet = query.list();
			tr.commit();
		}catch(Exception e){
			log.error("ERROR OCCURED");
			log.error(e.getMessage(), e);
			e.printStackTrace();
			tr.rollback();
		}
		finally{
			log.info("END");
			session.close();
		}
		return lstsheet;
	}
	
	public boolean deleteSheetFromID(String string) throws Exception
	{
		log.info("START");
		Session session = null;
		Transaction tr = null;
		try{
			session = getSessionFactory().openSession();
			tr = session.beginTransaction();
			Query query= session.createQuery("UPDATE BalanceSheetBO SET status = 'Deleted' where sheet_id='"+string+"'");
			int r = query.executeUpdate();
			log.info("ROWS AFFECTED -- > "+r);
			tr.commit();
			return true;
		}catch(Exception e){
			log.error("ERROR OCCURED");
			log.error(e.getMessage(), e);
			e.printStackTrace();
			tr.rollback();
			return false;
		}
		finally{
			log.info("END");
			session.close();
		}
		
	}
	
	public boolean hideSheetFromID(String string) throws Exception
	{
		log.info("START");
		Session session = null;
		Transaction tr = null;
		try{
			session = getSessionFactory().openSession();
			tr = session.beginTransaction();
			Query query= session.createQuery("UPDATE BalanceSheetBO SET status = 'H' where sheet_id='"+string+"'");
			int r = query.executeUpdate();
			log.info("ROWS AFFECTED -- > "+r);
			tr.commit();
			return true;
		}catch(Exception e){
			log.error("ERROR OCCURED");
			log.error(e.getMessage(), e);
			e.printStackTrace();
			tr.rollback();
			return false;
		}
		finally{
			log.info("END");
			session.close();
		}
		
	}
	public boolean showSheetFromID(String string) throws Exception
	{
		log.info("START");
		Session session = null;
		Transaction tr = null;
		try{
			session = getSessionFactory().openSession();
			tr = session.beginTransaction();
			Query query= session.createQuery("UPDATE BalanceSheetBO SET status = 'N' where sheet_id='"+string+"'");
			int r = query.executeUpdate();
			log.info("ROWS AFFECTED -- > "+r);
			tr.commit();
			return true;
		}catch(Exception e){
			log.error("ERROR OCCURED");
			log.error(e.getMessage(), e);
			e.printStackTrace();
			tr.rollback();
			return false;
		}
		finally{
			log.info("END");
			session.close();
		}
		
	}
	public BalanceSheetBO getSheetFromTable(String string) throws Exception {
		log.info("START");
		Session session = null;
		List<BalanceSheetBO> lstboo = null;
		BalanceSheetBO boo = null;
		try{
			session = getSessionFactory().openSession();
			Query query= session.createQuery("from BalanceSheetBO where sheet_id='"+string+"'");
			lstboo = query.list();
			
			if(lstboo.size() != 0)
			{
				boo = lstboo.get(0);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		finally{
			log.info("END");
			session.close();
		}
		return boo;
	}
	public List<BalanceSheetBO> getSheetList() throws Exception
	{
		log.info("START");
		Session session = null;
		Transaction tr = null;
		List<BalanceSheetBO> lstsheet = null;
		try{
			session = getSessionFactory().openSession();
			tr = session.beginTransaction();
			Query query= session.createQuery("Select sheet_id as sheet_id,sheet_title as sheet_title,sheet_year as sheet_year,status as status from BalanceSheetBO ORDER BY sheet_year desc").setResultTransformer(Transformers.aliasToBean(BalanceSheetBO.class));
			lstsheet = query.list();
			tr.commit();
		}catch(Exception e){
			log.error("ERROR OCCURED");
			log.error(e.getMessage(), e);
			e.printStackTrace();
			tr.rollback();
		}
		finally{
			log.info("END");
			session.close();
		}
		return lstsheet;
	}
	public boolean saveBalanceSheet(BalanceSheetBO balanceSheetBO)
			throws Exception {
		log.info("START");
		Session session = null;
		Transaction tr = null;
		boolean flag = false;
		try{
			session = getSessionFactory().openSession();
			tr = session.beginTransaction();
			
			Serializable serializable = session.save(balanceSheetBO);
			
			System.out.println(serializable);
			if(null != serializable){
				flag = true;
			}else{
				flag = false;
			}
			tr.commit();
		}catch(Exception e){
			log.error("ERROR OCCURED");
			log.error(e.getMessage(), e);
			e.printStackTrace();
			tr.rollback();
		}
		finally{
			log.info("END");
			session.close();
		}
		return flag;
	}
	//end ronak

	@SuppressWarnings("unchecked")
	@Override
	public List<DonationBO> getDonorList(String date) throws Exception {
		Session session = null;
		Transaction tr = null;
		List<DonationBO> lstdonor = null;
		try{
			session = getSessionFactory().openSession();
			tr = session.beginTransaction();
			Query query= session.createQuery("from DonationBO where receipt_dt like '%"+ date +"' and status='Y' and country <> 'India'");
			lstdonor = query.list();
			tr.commit();
		}catch(Exception e){
			e.printStackTrace();
		}
		finally{
			session.close();
		}
		return lstdonor;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<DonationBO> admingetDonorList(String name, String purpose, String year, String country) throws Exception {
		Session session = null;
		Transaction tr = null;
		List<DonationBO> lstdonor = null;
		try{
			session = getSessionFactory().openSession();
			tr = session.beginTransaction();
			Query query = null;
			String sql = "from DonationBO where ";
			if(null != year && !"".equalsIgnoreCase(year)){
				sql = sql + "receipt_dt like '%"+ year.trim() +"' and ";
			}
			if(null != name && !"".equalsIgnoreCase(name))
			{
				sql = sql + "upper(donor_name) like '%"+ name.toUpperCase() +"%' and ";
			}
			if(null != purpose && !"".equalsIgnoreCase(purpose)){
				sql = sql + "donation_purpose = '"+ purpose.trim() +"' and ";
			}
			if(null != country && !"".equalsIgnoreCase(country)){
				sql = sql + "country = '"+ country.trim() +"' and ";
			}
			System.out.println("Final sql ==>>" + sql +" status <>'deleted'");
			query = session.createQuery(sql + " status <>'deleted'");
			lstdonor = query.list();
			tr.commit();
		}catch(Exception e){
			e.printStackTrace();
		}
		finally{
			session.close();
		}
		return lstdonor;
	}

	@Override
	public boolean deleteDonor(String id) throws Exception {
		// TODO Auto-generated method stub
		Session session= null;
		Transaction tr = null;
		boolean flag = false;
		try{
			session = getSessionFactory().openSession();
			tr = session.beginTransaction();
			
			String hql = "UPDATE DonationBO SET status='deleted' WHERE donor_id='"+ id +"'";
			
			Query query = session.createQuery(hql);
			
			int i = query.executeUpdate();
			if(i>0){
				flag = true;
				tr.commit();
			}else{
				flag = false;
			}
		}catch(Exception e){
			e.printStackTrace();
			tr.rollback();
		}finally{
			session.close();
		}
		return flag;
	}
	
	@Override
	public boolean hideDonor(String id, String status) throws Exception {
		// TODO Auto-generated method stub
		Session session= null;
		Transaction tr = null;
		boolean flag = false;
		try{
			session = getSessionFactory().openSession();
			tr = session.beginTransaction();
			
			String hql = "UPDATE DonationBO SET status='"+status+"' WHERE donor_id='"+ id +"'";
			
			Query query = session.createQuery(hql);
			
			int i = query.executeUpdate();
			if(i>0){
				flag = true;
				tr.commit();
			}else{
				flag = false;
			}
		}catch(Exception e){
			e.printStackTrace();
			tr.rollback();
		}finally{
			session.close();
		}
		return flag;
	}

	@Override
	public List<CountrySTDCodeMstBO> getCountrySTDCodeList() throws Exception {
		Session session=getSessionFactory().openSession();
		Query query=session.createQuery("from CountrySTDCodeMstBO");
		List<CountrySTDCodeMstBO> list=query.list();
		session.close();
		return list;
	}
	@Override
	public boolean saveBalanceSheet(AddAlbumBO addAlbumBO) throws Exception {
		Session session=null;
		Transaction tr=null;
		boolean flag = false;
		try{
			session = getSessionFactory().openSession();
			tr = session.beginTransaction();
			
			Serializable serializable = session.save(addAlbumBO);
			
			System.out.println(serializable);
			if(null != serializable){
				flag = true;
			}else{
				flag = false;
			}
			tr.commit();
		}catch(Exception e){
			e.printStackTrace();
		}
		finally{
			session.close();
		}
		return flag;
	}
	@Override
	public boolean checkLogin(String username, String password)
			throws Exception {
		// TODO Auto-generated method stub
		Session session = null;
		Transaction tr = null;
		boolean flag = false;
		try{
			session = getSessionFactory().openSession();
			tr = session.beginTransaction();
			
			Query query = session.createQuery("from LoginBo where username='"+ username +"' and pwd = '"+ password +"'");
			List<LoginBo> list = query.list();
			
			if(list.size() == 1){
				flag = true;
			}else{
				flag = false;
			}
			
			tr.commit();
		}catch(Exception e){
			e.printStackTrace();
		}
		finally{
			session.close();
		}
		return flag;
	}

	@Override
	public List<DonationBO> getDonorByNameAjax(String name) {
		// TODO Auto-generated method stub
		Session session = null;
		Transaction tr = null;
		List<DonationBO> list = null;
		try{
			session = getSessionFactory().openSession();
			tr = session.beginTransaction();
			Query query = session.createQuery("from DonationBO where upper(donor_name) LIKE '%"+ name.toUpperCase()+"%'");
			list = query.list();
			tr.commit();
		}catch(Exception e){
			e.printStackTrace();
		}
		finally{
			session.close();
		}
		return list;
	}

	@Override
	public List<AddAlbumBO> viewAlbum() throws Exception {
		// TODO Auto-generated method stub
		Session session = getSessionFactory().openSession();
		
		Query query = session.createQuery("from AddAlbumBO");
		
		List<AddAlbumBO> list = query.list();
		
		Query query1 = session.createQuery("select count(*) as count, album_id as album_id from AddImageGalleryBO group by album_id").
				setResultTransformer(Transformers.aliasToBean(AddImageGalleryBO.class));
		
		List<AddImageGalleryBO> list1 = query1.list();
		
		for(int i=0; i<list.size();i++){
			for(int j=0; j<list1.size(); j++){
				if(list.get(i).getAlbum_id().equalsIgnoreCase(list1.get(j).getAlbum_id())){
					list.get(i).setCount(list1.get(j).getCount());
				}
			}
		}
		
		
		session.close();
		return list;
	}
	@Override
	public <T> T saveDataComon(T t) throws Exception {
		// TODO Auto-generated method stub
		log.info("--START-----Inside common save method");
		Session session = null;
		Transaction tr = null;
		try{
			session = getSessionFactory().openSession();
			tr = session.beginTransaction();
			session.save(t);
			tr.commit();
		}catch(Exception e){
			tr.rollback();
			e.printStackTrace();
			log.error("ERROR OCCURED");
			log.error(e.getMessage(),e);
		}
		finally{
			log.info("--END-----Inside common save method");
			session.close();
		}
		return t;
	}

	@Override
	public List<AddAlbumBO> loadAlbumNames() throws Exception {
		// TODO Auto-generated method stub
		Session session = null;
		List<AddAlbumBO> list = null;
		try{
			session = getSessionFactory().openSession();
			
			Query query = session.createQuery("from AddAlbumBO");
			list = query.list();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		finally{
			session.close();
		}
		return list;
	}
	@Override
	public List<String> getDonorYearDrop() {
		log.info("--START-----Inside common save method");
		Session session = null;
		Transaction tr = null;
		List<String> lstYear = null;
		try{
			session = getSessionFactory().openSession();
			tr = session.beginTransaction();
			Query query = session.createQuery("select receipt_dt from DonationBO group by receipt_dt");
			lstYear = query.list();
			tr.commit();
		}catch(Exception e){
			tr.rollback();
			e.printStackTrace();
			log.error("ERROR OCCURED");
			log.error(e.getMessage(),e);
			return null;
		}
		finally{
			log.info("--END-----Inside common save method");
			session.close();
		}
		return lstYear;
	}

	@Override
	public boolean saveMultipleImg(String album, String[] images)
			throws Exception {
			Session session=null;
			Transaction transaction=null;
			boolean flag = false;
			try{
				session=getSessionFactory().openSession();
				transaction=session.beginTransaction();
				Query query;
				for(int i=0;i<images.length;i++){
					AddImageGalleryBO galleryBO=new AddImageGalleryBO();
					galleryBO.setAlbum_id(album);
					galleryBO.setCrt_dt(dateandtime.format(new Date()));
					galleryBO.setCrt_usr("admin");
					galleryBO.setGallery_img(images[i]);
					galleryBO.setUpd_dt(dateandtime.format(new Date()));
					galleryBO.setUpd_usr("admin");
					session.save(galleryBO);
					}
				transaction.commit();
				flag = true;
			}catch(Exception e){
				e.printStackTrace();
				transaction.rollback();
			}finally{
				session.close();
			}
		return flag;
	}

	@Override
	public List<AddImageGalleryBO> getalbumimages(String id) throws Exception {
		Session session=null;
		List<AddImageGalleryBO> list=null;
		try{
			session=getSessionFactory().openSession();
			Query query=session.createQuery("from AddImageGalleryBO where album_id='"+id+"'");
			list=query.list();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
		return list;
	}

	@Override
	public boolean savecompany(CompanyBo companybo) throws Exception {
		// TODO Auto-generated method stub
		log.info("START");
		Session session = null;
		Transaction tr = null;
		boolean flag = false;
		try{
			session = getSessionFactory().openSession();
			tr = session.beginTransaction();
			System.out.println(companybo.getCity());
			Serializable serializable = session.save(companybo);
			
			System.out.println(serializable);
			if(null != serializable){
				flag = true;
			}else{
				flag = false;
			}
			tr.commit();
		}catch(Exception e){
			log.error("ERROR OCCURED");
			log.error(e.getMessage(), e);
			e.printStackTrace();
			tr.rollback();
		}
		finally{
			log.info("END");
			session.close();
		}
		return flag;
		
	}

	@Override
	public void savestudentinfo(StudentInfoBo info)
			throws Exception {
		// TODO Auto-generated method stub
		log.info("START");
		Session session = null;
		Transaction tr = null;
		boolean flag = false;
		try{
			session = getSessionFactory().openSession();
			tr = session.beginTransaction();
			Serializable serializable = session.save(info);
			
	        
			System.out.println(serializable);
			if(null != serializable){
				flag = true;
			}else{
				flag = false;
			}
			tr.commit();
		}catch(Exception e){
			log.error("ERROR OCCURED");
			log.error(e.getMessage(), e);
			e.printStackTrace();
			tr.rollback();
		}
		finally{
			log.info("END");
			session.close();
		}
		
		
	}

	@Override
	public void savestudentedu(StudentEducationBo edu,Integer stu_id) throws Exception {
		// TODO Auto-generated method stub
		log.info("START");
		
		String degree_type=edu.getDegree_type();
        String[] degree_type1=degree_type.split(",");
        String gpa=edu.getDegree_gpa();
        String[] gpa1=gpa.split(",");
        String major=edu.getMajor();
        String[] major1=major.split(",");
        String uni=edu.getUniversity();
        String[] uni1=uni.split(",");
        String uni_loc=edu.getUniversity_location();
        String[] uni_loc1=uni_loc.split(",");
		
		Serializable serializable=null;
        for(int i=0;i<degree_type1.length;i++)
        {
        	Session session = null;
    		Transaction tr = null;
    		boolean flag = false;
    		try{
    			session = getSessionFactory().openSession();
    			tr = session.beginTransaction();
        edu.setDegree_type(degree_type1[i]);
        edu.setDegree_gpa(gpa1[i]);
        edu.setMajor(major1[i]);
        edu.setUniversity(uni1[i]);
        edu.setUniversity_location(uni_loc1[i]);
        edu.setStudent_id(stu_id);
    	
		 serializable = session.save(edu);
		 System.out.println(serializable);
			if(null != serializable){
				flag = true;
			}else{
				flag = false;
			}
			tr.commit();
    		}catch(Exception e){
    			log.error("ERROR OCCURED");
    			log.error(e.getMessage(), e);
    			e.printStackTrace();
    			tr.rollback();
    		}
    		finally{
    			log.info("END");
    			session.close();
    		}
        }
       
	
	}

	@Override
	public void savestucertificate(StudentCertificateBo certificatebo,
			Integer stu_id) throws Exception {
		// TODO Auto-generated method stub
		String title=certificatebo.getCertificate_title();
        String[] title1=title.split(",");
        String body=certificatebo.getCertificate_body();
        String[] body1=body.split(",");
      
        String student_id=stu_id+"";
		Serializable serializable=null;
        for(int i=0;i<title1.length;i++)
        {
        	Session session = null;
    		Transaction tr = null;
    		boolean flag = false;
    		try{
    			session = getSessionFactory().openSession();
    			tr = session.beginTransaction();
       certificatebo.setCertificate_title(title1[i]);
       certificatebo.setCertificate_body(body1[i]);
       certificatebo.setStudent_id(student_id);
    	
		 serializable = session.save(certificatebo);
		 System.out.println(serializable);
			if(null != serializable){
				flag = true;
			}else{
				flag = false;
			}
			tr.commit();
    		}catch(Exception e){
    			log.error("ERROR OCCURED");
    			log.error(e.getMessage(), e);
    			e.printStackTrace();
    			tr.rollback();
    		}
    		finally{
    			log.info("END");
    			session.close();
    		}
        }
	}

	@Override
	public void saveworkexp(StudentWorkBo work, Integer stu_id)
			throws Exception {
		// TODO Auto-generated method stub
		String company=work.getCompany();
        String[] company1=company.split(",");
    	String company_loc=work.getCompany_location();
        String[] company_loc1=company_loc.split(",");
    	String position=work.getCompany_location();
        String[] position1=position.split(",");
    	String start_date=work.getStart_date();
    	String[] start_date1=start_date.split(",");
		Serializable serializable=null;
        for(int i=0;i<company1.length;i++)
        {
        	Session session = null;
    		Transaction tr = null;
    		boolean flag = false;
    		try{
    			session = getSessionFactory().openSession();
    			tr = session.beginTransaction();
    			work.setCompany(company1[i]);
    			work.setCompany_location(company_loc1[i]);
    			work.setPosition(position1[i]);
    			work.setStart_date(start_date1[i]);
    			
    			work.setStudent_id(stu_id);
    			serializable = session.save(work);
    			System.out.println(serializable);
			if(null != serializable){
				flag = true;
			}else{
				flag = false;
			}
			tr.commit();
    		}catch(Exception e){
    			log.error("ERROR OCCURED");
    			log.error(e.getMessage(), e);
    			e.printStackTrace();
    			tr.rollback();
    		}
    		finally{
    			log.info("END");
    			session.close();
    		}
        }
	}

	@Override
	public List<CompanyBo> getcompanylist() throws Exception {
		// TODO Auto-generated method stub
		log.info("START");
		Session session = null;
		List<CompanyBo> lstboo = null;
		CompanyBo boo = null;
		try{
			session = getSessionFactory().openSession();
			Query query= session.createQuery("from CompanyBo");
			lstboo = query.list();
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
		finally{
			log.info("END");
			session.close();
		}
		return lstboo;
	}

	@Override
	public List<JobBo> getjoblist() throws Exception {
		// TODO Auto-generated method stub
		log.info("START");
		Session session = null;
		List<JobBo> lstboo = null;
		try{
			session = getSessionFactory().openSession();
			Query query= session.createQuery("from JobBo");
			lstboo = query.list();
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
		finally{
			log.info("END");
			session.close();
		}
		return lstboo;
	}

	@Override
	public LoginBo getStudentList(String username, String password) {
		// TODO Auto-generated method stub
		log.info("START");
		Session session = null;
		List<LoginBo> list = null;
		LoginBo loginbo = null;
		try{
			session = getSessionFactory().openSession();
			Query query= session.createQuery("From LoginBo where username = '"+username+"' and pwd = '"+password+"'");
			list = query.list();
			if(list.size() != 0)
			{
				loginbo = list.get(0);
			}
			return loginbo;
		}catch(Exception e){
			log.error("ERROR OCCURED");
			log.error(e.getMessage(), e);
			e.printStackTrace();
		}
		finally{
			log.info("END");
			session.close();
		}
		return loginbo;	}

	@Override
	public List<JobBo> getstudentjoblist(int student_id)
			throws Exception {
		// TODO Auto-generated method stub
		log.info("START");
		Session session = null;
		List<Student_Job_mapping> list = null;
		List<JobBo> list1=null;
		try{
			session = getSessionFactory().openSession();
			Query query= session.createQuery("From Student_Job_mapping where student_id='"+student_id+"'");
			list = query.list();
			int job_id= 0;
			if(list.size() > 0)
			{
			String s = "";
			for(int z=0;z<list.size();z++)
			{
				// list=(List<Student_Job_mapping>) list.get(z);
				s = s + "'"+list.get(z).getJob_id()+"', ";
//				student_id=list.get(z).getStudent_id();
			}
			s = s.substring(0, s.length()-2);
			System.out.println(s);
			Query query1=session.createQuery("From JobBo where job_id IN ("+s+")");
			/*List<JobBo> job=null;
			 Query query1=null;
			for(int z=0;z<list.size();z++)
			{
				// list=(List<Student_Job_mapping>) list.get(z);
				  job_id=list.get(z).getJob_id();
				   query1=session.createQuery("From JobBo where job_id IN ('"+job_id+"')");
				   list1=query1.list();
			}*/
			//Query query1=session.createQuery("From JobBo where job_id IN ('"+job_id+"')");
			   list1=query1.list();
			}
			
		}catch(Exception e){
			log.error("ERROR OCCURED");
			log.error(e.getMessage(), e);
			e.printStackTrace();
		}
		finally{
			log.info("END");
			session.close();
		}
		return list1;
		}

	@Override
	public List<SkillBo> getskilllist() throws Exception {
		// TODO Auto-generated method stub
		log.info("START");
		Session session = null;
		List<SkillBo> lstboo = null;
		try{
			session = getSessionFactory().openSession();
			Query query= session.createQuery("from SkillBo");
			lstboo = query.list();
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
		finally{
			log.info("END");
			session.close();
		}
		return lstboo;
	}

	@Override
	public List<StudentInfoBo> getallstudentdata() throws Exception {
		// TODO Auto-generated method stub
		log.info("START");
		Session session = null;
		List<StudentInfoBo> lstboo = null;
		try{
			session = getSessionFactory().openSession();
			Query query= session.createQuery("from StudentInfoBo");
			lstboo = query.list();
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
		finally{
			log.info("END");
			session.close();
		}
		return lstboo;	}

	@Override
	public List<JobBo> getjoblistfromcompany(String company_id) throws Exception {
		// TODO Auto-generated method stub
		log.info("START");
		Session session = null;
		List<JobBo> list1=null;
		try{
			session = getSessionFactory().openSession();
			Query query= session.createQuery("From JobBo where company_id=?");
			query.setParameter(0, Integer.parseInt(company_id));
			System.out.println(query);
			list1=query.list();
		}catch(Exception e){
			log.error("ERROR OCCURED");
			log.error(e.getMessage(), e);
			e.printStackTrace();
		}
		finally{
			log.info("END");
			session.close();
		}
		return list1;	}

	@Override
	public List<InternshipTypeBo> getinternshiplist() throws Exception {
		// TODO Auto-generated method stub
		log.info("START");
		Session session = null;
		List<InternshipTypeBo> lstboo = null;
		try{
			session = getSessionFactory().openSession();
			Query query= session.createQuery("from InternshipTypeBo");
			lstboo = query.list();
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
		finally{
			log.info("END");
			session.close();
		}
		return lstboo;	}

	@Override
	public void updatestudent_status(int i,String internship_type) throws Exception {
		// TODO Auto-generated method stub
		log.info("START");
		Session session = null;
		try{
			session = getSessionFactory().openSession();
			Query query= session.createQuery("update StudentInfoBo set student_status='Hired',internship_status=? where student_id="+i);
	       query.setParameter(0, internship_type);
			query.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}
		finally{
			log.info("END");
			session.close();
		}
	}

	@Override
	public List<StudentInfoBo> searchreport(ReportBo r) throws Exception {
		log.info("START");
		Session session = null;
		List<StudentInfoBo> info=null;
		try{
			session = getSessionFactory().openSession();
			Query query = null;
			String sql = "from StudentInfoBo";
			System.out.println(r);
			if(!"".equalsIgnoreCase(r.getYear()) || !"".equalsIgnoreCase(r.getStudent_status()) || !"".equalsIgnoreCase(r.getInternship_type()) || !"".equalsIgnoreCase(r.getSemester()) || !"".equalsIgnoreCase(r.getCountry())){
				sql = sql + " where ";
			}
			if(null != r.getYear() && !"".equalsIgnoreCase(r.getYear())){
				sql = sql + "year = '"+ r.getYear().trim() +"' and " ;
			}
			if(null != r.getStudent_status() && !"".equalsIgnoreCase(r.getStudent_status()))
			{
				sql = sql + "student_status like '%"+ r.getStudent_status() +"' and ";
			}
			if(null != r.getInternship_type() && !"".equalsIgnoreCase(r.getInternship_type())){
				sql = sql + "internship_status = '"+ r.getInternship_type()+"' and ";
			}
			if(null != r.getCountry() && !"".equalsIgnoreCase(r.getCountry())){
				sql = sql + "country = '"+r.getCountry() +"' and ";
			}
			if(null != r.getSemester() && !"".equalsIgnoreCase(r.getSemester())){
				sql = sql + "semester = '"+r.getSemester() +"' and ";
			}
			if(!"".equalsIgnoreCase(r.getYear()) || !"".equalsIgnoreCase(r.getStudent_status()) || !"".equalsIgnoreCase(r.getInternship_type()) || !"".equalsIgnoreCase(r.getCountry())){
				sql = sql + " 1=1 ";
			}
			System.out.println("Final sql ==>>" + sql);
			query = session.createQuery(sql);
		
			info = query.list();
		}catch(Exception e){
			e.printStackTrace();
		}
		finally{
			log.info("END");
			session.close();
		}
		
		
		
		return info;
		
	}

	@Override
	public List<CompanyBo> searchreportcompany(ReportBo r) throws Exception {
		// TODO Auto-generated method stub
		Session session = null;
		List<CompanyBo> info=null;
		try{
			session = getSessionFactory().openSession();
			Query query = null;
			String sql = "from  CompanyBo";
			if(null != r.getCity() && !"".equalsIgnoreCase(r.getCity())){
				sql = sql + " where ";
			}
			if(null != r.getCity() && !"".equalsIgnoreCase(r.getCity())){
				sql = sql + "upper(city) = '"+r.getCity().toUpperCase() +"' and ";
			}
			if(null != r.getCity() && !"".equalsIgnoreCase(r.getCity())){
				sql = sql + " 1=1 ";
			}
			query = session.createQuery(sql);
		
			info = query.list();
		}catch(Exception e){
			e.printStackTrace();
		}
		finally{
			log.info("END");
			session.close();
		}
		
		
		
		return info;
	}

	@Override
	public List<StudentInfoBo> searchinterntype_student(ReportBo r)
			throws Exception {
		// TODO Auto-generated method stub
		Session session = null;
		List<StudentInternshipBo> list = null;
		List<StudentInfoBo> list1=null;
		Query query = null;
		try{
			session = getSessionFactory().openSession();
			String sql = "from  StudentInternshipBo";
			if(null != r.getInternship_type() && !"".equalsIgnoreCase(r.getInternship_type())){
				sql = sql + " where ";
			}
			if(null != r.getInternship_type() && !"".equalsIgnoreCase(r.getInternship_type())){
				sql = sql + "internship_id = '"+r.getInternship_type() +"' and ";
			}
			if(null != r.getInternship_type() && !"".equalsIgnoreCase(r.getInternship_type())){
				sql = sql + " 1=1 ";
			}
			query = session.createQuery(sql);
		
			list = query.list();
			String s = "";
//			int student_id= 0;
			for(int z=0;z<list.size();z++)
			{
				// list=(List<Student_Job_mapping>) list.get(z);
				s = s + "'"+list.get(z).getStudent_id()+"', ";
//				student_id=list.get(z).getStudent_id();
			}
			s = s.substring(0, s.length()-2);
			Query query1=session.createQuery("From StudentInfoBo where student_id IN ("+s+")");
			list1=query1.list();
			return list1;
		}catch(Exception e){
			log.error("ERROR OCCURED");
			log.error(e.getMessage(), e);
			e.printStackTrace();
		}
		finally{
			log.info("END");
			session.close();
		}
		return list1;	}

	@Override
	public List<StudentInfoBo> getstudentinternshipwise()
			throws Exception {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
		Session session = null;
		List<StudentInternshipBo> list = null;
		List<StudentInfoBo> list1=null;
		try{
			session = getSessionFactory().openSession();
			Query query = null;
			String sql = "from  StudentInternshipBo";
			
			query = session.createQuery(sql);
		
			list = query.list();
			int student_id= 0;
			String s = "";
			for(int z=0;z<list.size();z++)
			{
				// list=(List<Student_Job_mapping>) list.get(z);
				s = s + "'"+list.get(z).getStudent_id()+"', ";
//				student_id=list.get(z).getStudent_id();
			}
			s = s.substring(0, s.length()-2);
			Query query1=session.createQuery("From StudentInfoBo where student_id IN ("+s+")");
			list1=query1.list();
			return list1;
		}catch(Exception e){
			log.error("ERROR OCCURED");
			log.error(e.getMessage(), e);
			e.printStackTrace();
		}
		finally{
			log.info("END");
			session.close();
		}
		return list1;
	}

	@Override
	public List<StudentGpaBo> getstudentavggpa() throws Exception {
		// TODO Auto-generated method stub
		Session session = null;
		List<StudentGpaBo> info=null;
		try{
			session = getSessionFactory().openSession();
			Query query= session.createQuery("select e.student_id as student_id,i.fname as fname,i.lname as lname,e.degree_gpa as degree_gpa,i.country as country,e.degree_type as degree_type from  StudentEducationBo e,StudentInfoBo i where e.student_id=i.student_id ").setResultTransformer(Transformers.aliasToBean(StudentGpaBo.class));

			
			
		
			info = query.list();
		}catch(Exception e){
			e.printStackTrace();
		}
		finally{
			log.info("END");
			session.close();
		}
		
		
		
		return info;	}

	@Override
	public List<StudentGpaBo> search_gpa(ReportBo r) throws Exception {
		// TODO Auto-generated method stub
		Session session = null;
		List<StudentGpaBo> info=null;
		try{
			session = getSessionFactory().openSession();
			Query query= null;
			String sql =" select e.student_id as student_id,i.fname as fname,i.lname as lname,e.degree_gpa as degree_gpa,i.country as country,e.degree_type as degree_type from  StudentEducationBo e,StudentInfoBo i where e.student_id=i.student_id";
			System.out.println(r);
			if(!"".equalsIgnoreCase(r.getYear()) || !"".equalsIgnoreCase(r.getCountry())||!"".equalsIgnoreCase(r.getUniversity()) || !"".equalsIgnoreCase(r.getUniversity_location())||!"".equalsIgnoreCase(r.getDegree_type())){
				sql = sql + " and ";
			}
			if(null != r.getYear() && !"".equalsIgnoreCase(r.getYear())){
				sql = sql + "i.year = '"+ r.getYear().trim() +"' and " ;
			}
			
			if(null != r.getCountry() && !"".equalsIgnoreCase(r.getCountry())){
				sql = sql + "i.country = '"+r.getCountry() +"' and ";
			}
			if(null != r.getUniversity() && !"".equalsIgnoreCase(r.getUniversity())){
				sql = sql + "e.university = '"+r.getUniversity() +"' and ";
			}
			if(null != r.getUniversity_location() && !"".equalsIgnoreCase(r.getUniversity_location())){
				sql = sql + "e.university_location = '"+r.getUniversity_location() +"' and ";
			}
			if(null != r.getDegree_type() && !"".equalsIgnoreCase(r.getDegree_type())){
				sql = sql + "e.degree_type = '"+r.getDegree_type() +"' and ";
			}
			if(!"".equalsIgnoreCase(r.getYear()) || !"".equalsIgnoreCase(r.getCountry())||  !"".equalsIgnoreCase(r.getUniversity()) ||  !"".equalsIgnoreCase(r.getUniversity_location()) ||  !"".equalsIgnoreCase(r.getDegree_type())){
				sql = sql + " 1=1 ";
			}
			System.out.println("Final sql ==>>" + sql);
			query = session.createQuery(sql).setResultTransformer(Transformers.aliasToBean(StudentGpaBo.class));
			
			
		
			info = query.list();
		}catch(Exception e){
			e.printStackTrace();
		}
		finally{
			log.info("END");
			session.close();
		}
		
		
		
		return info;
	}

	@Override
	public List<StudentInfoBo> getstudentlistfromid(int student_id) throws Exception {
		// TODO Auto-generated method stub
		Session session = null;
		List<StudentInfoBo> list1=null;
		try{
			session = getSessionFactory().openSession();
			Query query= session.createQuery("From StudentInfoBo where student_id=?");
			query.setParameter(0, student_id);
			System.out.println(query);
			list1=query.list();
		}catch(Exception e){
			log.error("ERROR OCCURED");
			log.error(e.getMessage(), e);
			e.printStackTrace();
		}
		finally{
			log.info("END");
			session.close();
		}
		return list1;	
		}

	@Override
	public List<StudentEducationBo> getstudentedulistfromid(int student_id)
			throws Exception {
		// TODO Auto-generated method stub
		Session session = null;
		List<StudentEducationBo> list1=null;
		try{
			session = getSessionFactory().openSession();
			Query query= session.createQuery("From StudentEducationBo where student_id=?");
			query.setParameter(0, student_id);
			System.out.println(query);
			list1=query.list();
		}catch(Exception e){
			log.error("ERROR OCCURED");
			log.error(e.getMessage(), e);
			e.printStackTrace();
		}
		finally{
			log.info("END");
			session.close();
		}
		return list1;	
	}

	@Override
	public void updateeducationinfo(StudentEducationBo r) throws Exception {
		// TODO Auto-generated method stub
		Session session = null;
		Transaction tr = null;
		try{
			session = getSessionFactory().openSession();
			tr = session.beginTransaction();
			session.update(r);
			
			tr.commit();
			
		}catch(Exception e){
			log.error("ERROR OCCURED");
			log.error(e.getMessage(), e);
			e.printStackTrace();
			
			
		}
		finally{
			log.info("END");
			session.close();
		
	}
	}

	@Override
	public List<StudentCertificateBo> getstudentcertilistfromid(String student_id)
			throws Exception {
		// TODO Auto-generated method stub
		Session session = null;
		List<StudentCertificateBo> list1=null;
		try{
			String student_id1=student_id+"";
			session = getSessionFactory().openSession();
			Query query= session.createQuery("From StudentCertificateBo where student_id=?");
			query.setParameter(0, student_id1);
			System.out.println(query);
			list1=query.list();
		}catch(Exception e){
			log.error("ERROR OCCURED");
			log.error(e.getMessage(), e);
			e.printStackTrace();
		}
		finally{
			log.info("END");
			session.close();
		}
		return list1;	
	}

	@Override
	public void updateCERTIcationinfo(StudentCertificateBo r) throws Exception {
		// TODO Auto-generated method stub
		Session session = null;
		Transaction tr = null;
		try{
			session = getSessionFactory().openSession();
			tr = session.beginTransaction();
			session.update(r);
			
			tr.commit();
			
		}catch(Exception e){
			log.error("ERROR OCCURED");
			log.error(e.getMessage(), e);
			e.printStackTrace();
			
			
		}
		finally{
			log.info("END");
			session.close();
		
	}
	}

	@Override
	public List<StudentJobSkillbo> getstudentfromjjob(String job_id) throws Exception {
		// TODO Auto-generated method stub
		Session session = null;
		List<StudentJobSkillbo> info=null;
		List<SkillBo> list1=null;
		try{
			session = getSessionFactory().openSession();
			Query query= null;
			String sql =" select  j.student_id as student_id,string_agg(sk.skill_name,', ')  as skill_name from  student_job_master j,student_skill s,skill sk where j.student_id=s.student_id and s.skill_name=sk.skill_id and j.job_id='"+job_id+"' group by j.student_id";
			query = session.createSQLQuery(sql).setResultTransformer(Transformers.aliasToBean(StudentJobSkillbo.class));
			info = query.list();
			
			/*if(info.size() > 0)
			{
			String s = "";
			for(int z=0;z<info.size();z++)
			{
				// list=(List<Student_Job_mapping>) list.get(z);
				s = s + "'"+info.get(z).getJ+"', ";
//				student_id=list.get(z).getStudent_id();
			}
			s = s.substring(0, s.length()-2);
			System.out.println(s);
			Query query1=session.createQuery("From JobBo where job_id IN ("+s+")");
			List<JobBo> job=null;
			 Query query1=null;
			for(int z=0;z<list.size();z++)
			{
				// list=(List<Student_Job_mapping>) list.get(z);
				  job_id=list.get(z).getJob_id();
				   query1=session.createQuery("From JobBo where job_id IN ('"+job_id+"')");
				   list1=query1.list();
			}
			//Query query1=session.createQuery("From JobBo where job_id IN ('"+job_id+"')");
			   list1=query1.list();
			}
			String[] s;
			int j=0;
			String s1="";
			Query query1=null;
			for(int i=0;i<info.size();i++)
			{
				
		   s=info.get(i).getSkill_name().split(",");
		   		for(j=0;j<=s.length;j++)
{
		   			 query1=session.createQuery("From SkillBo where skill_id IN ("+s[j]+")");
		 			list1=query1.list();
		 		
					
}
}
			
			System.out.println(s1);*/
			
		}catch(Exception e){
			e.printStackTrace();
		}
		finally{
		log.info("END");
			session.close();
		}
		
		
		
		return info;
	}

	@Override
	public void savestudent_skill(int student_id, String[] shah)
	{
	
  StudentSkillBo s=new StudentSkillBo();
    String student_id1=student_id+"";
	Serializable serializable=null;
	
    for(int i=0;i<shah.length;i++)
    {
    	Session session = null;
		Transaction tr = null;
		boolean flag = false;
		try{
			session = getSessionFactory().openSession();
			tr = session.beginTransaction();
			int k=Integer.parseInt(shah[i]);
			System.out.println(k);
	s.setStudent_id(student_id);
	s.setSkill_name(k);
	 serializable = session.save(s);
	 System.out.println(serializable);
		if(null != serializable){
			flag = true;
		}else{
			flag = false;
		}
		tr.commit();
		}catch(Exception e){
			log.error("ERROR OCCURED");
			log.error(e.getMessage(), e);
			e.printStackTrace();
			tr.rollback();
		}
		finally{
			log.info("END");
			session.close();
		}
    }
	}

	@Override
	public void updatestudentjobflag(String job_id, String student_id)
			throws Exception {
		// TODO Auto-generated method stub
		log.info("START");
		Session session = null;
		try{
			session = getSessionFactory().openSession();
			Query query= session.createQuery("update Student_Job_mapping set flag='Y' where student_id=? and job_id=?");
	       query.setParameter(0, Integer.parseInt(student_id));
	       query.setParameter(1, Integer.parseInt(job_id));

			query.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}
		finally{
			log.info("END");
			session.close();
		}
	}

	@Override
	public List<ApprovalStudentBo> getstudentapprovedlist() throws Exception {
		// TODO Auto-generated method stub
		Session session = null;
		List<ApprovalStudentBo> info=null;
		try{
			session = getSessionFactory().openSession();
			Query query= session.createQuery("select s.student_id as student_id,j.job_id as job_id,s.lname as lname,s.fname as fname,js.job_position as job_position,js.company_id as company_id,c.company_name as company_name  from StudentInfoBo s,Student_Job_mapping j,JobBo js,CompanyBo c where s.student_id=j.student_id and j.flag='Y' and j.job_id=js.job_id and js.company_id=c.company_id group by s.student_id,j.job_id,s.lname,s.fname,js.job_position,js.company_id,c.company_name").setResultTransformer(Transformers.aliasToBean(ApprovalStudentBo.class));
			info = query.list();
		}catch(Exception e){
			e.printStackTrace();
		}
		finally{
			log.info("END");
			session.close();
		}
		
		
		
		return info;
		}

	@Override
	public List<ReportlistBo> getstudentyear() throws Exception {
		// TODO Auto-generated method stub
		log.info("START");
		Session session = null;
		List<ReportlistBo> lstboo = null;
		try{
			session = getSessionFactory().openSession();
			Query query= session.createQuery(" select distinct year as year from StudentInfoBo").setResultTransformer(Transformers.aliasToBean(ReportlistBo.class));
			lstboo = query.list();
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
		finally{
			log.info("END");
			session.close();
		}
		return lstboo;	}

	@Override
	public List<ReportlistBo> getstudentcountry() throws Exception {
		// TODO Auto-generated method stub
		Session session = null;
		List<ReportlistBo> lstboo = null;
		try{
			session = getSessionFactory().openSession();
			Query query= session.createQuery(" select distinct country as country from StudentInfoBo").setResultTransformer(Transformers.aliasToBean(ReportlistBo.class));
			lstboo = query.list();
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
		finally{
			log.info("END");
			session.close();
		}
		return lstboo;	
	}

	@Override
	public List<ReportlistBo> getuniversity() throws Exception {
		// TODO Auto-generated method stub
		Session session = null;
		List<ReportlistBo> lstboo = null;
		try{
			session = getSessionFactory().openSession();
			Query query= session.createQuery(" select distinct university as university from StudentEducationBo").setResultTransformer(Transformers.aliasToBean(ReportlistBo.class));
			lstboo = query.list();
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
		finally{
			log.info("END");
			session.close();
		}
		return lstboo;
	}
	
	@Override
	public List<ReportlistBo> getuniversity_location() throws Exception {
		// TODO Auto-generated method stub
		Session session = null;
		List<ReportlistBo> lstboo = null;
		try{
			session = getSessionFactory().openSession();
			Query query= session.createQuery(" select distinct university_location as university_location from StudentEducationBo").setResultTransformer(Transformers.aliasToBean(ReportlistBo.class));
			lstboo = query.list();
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
		finally{
			log.info("END");
			session.close();
		}
		return lstboo;
	}

	@Override
	public List<StudentWorkBo> getstudentworklistfromid(String student_id)
			throws Exception {
		// TODO Auto-generated method stub
		Session session = null;
		List<StudentWorkBo> list1=null;
		try{
			
			session = getSessionFactory().openSession();
			Query query= session.createQuery("From StudentWorkBo where student_id=?");
			query.setParameter(0, Integer.parseInt(student_id));
			System.out.println(query);
			list1=query.list();
		}catch(Exception e){
			log.error("ERROR OCCURED");
			log.error(e.getMessage(), e);
			e.printStackTrace();
		}
		finally{
			log.info("END");
			session.close();
		}
		return list1;	
		}

	@Override
	public void updateworkcationinfo(StudentWorkBo r) throws Exception {
		// TODO Auto-generated method stub
		Session session = null;
		Transaction tr = null;
		try{
			session = getSessionFactory().openSession();
			tr = session.beginTransaction();
			session.update(r);
			
			tr.commit();
			
		}catch(Exception e){
			log.error("ERROR OCCURED");
			log.error(e.getMessage(), e);
			e.printStackTrace();
			
			
		}
		finally{
			log.info("END");
			session.close();
		
	}
	}

	@Override
	public List<ReportlistBo> getcompanycity() throws Exception {
		// TODO Auto-generated method stub
		Session session = null;
		List<ReportlistBo> lstboo = null;
		try{
			session = getSessionFactory().openSession();
			Query query= session.createQuery(" select distinct city as city from CompanyBo").setResultTransformer(Transformers.aliasToBean(ReportlistBo.class));
			lstboo = query.list();
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
		finally{
			log.info("END");
			session.close();
		}
		return lstboo;
	}
}


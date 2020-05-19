package action;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import entity.Form;
import service.FormsDAO;
import sevice_impl.FormsDAOImpl;

public class FormsAction extends BaseAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public String queryAll(){
		FormsDAO formsDAO = new FormsDAOImpl();
		List<Form> list = null;
		list = formsDAO.queryAllForm();
		if (list != null && list.size() > 0) {
			session.setAttribute("forms_list", list);
		} else
			session.setAttribute("forms_list", null);
		return "forms_query_all_success";
	}

	public String delete(){
		FormsDAO formsDAO = new FormsDAOImpl();
		String formId = request.getParameter("formId");
		if (formsDAO.deleteFormById(formId)){
			return "forms_delete_success";
		} else
		return "forms_delete_failure";
	}
	
	public String modify(){
		String formId = request.getParameter("formId");
		FormsDAO formsDAO = new FormsDAOImpl();
		Form f = formsDAO.queryFormByFormId(formId);
		session.setAttribute("modify_form", f);
		return "forms_modify_success";
	}
	
	public String insert(){
		Form f = new Form();
		FormsDAO formsDAO = new FormsDAOImpl();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		try {
			f.setWarehouseEntryTime(
					simpleDateFormat.parse(request.getParameter("warehouseEntryTime")));
			f.setTransactorName(request.getParameter("transactorName"));
			f.setRemark(request.getParameter("remark"));
			if (formsDAO.insertForm(f)) {
				return "forms_insert_success";				
			} else 
				return "forms_insert_failure"; 
		} catch (ParseException e) {
			e.printStackTrace();
			return "forms_insert_failure";
		}
	}
	
	public String update(){
		Form f = new Form();
		FormsDAO formsDAO = new FormsDAOImpl();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String formId = request.getParameter("formId");
		request.setAttribute("formId", formId);
		try {
			f.setFormId(formId);
			f.setWarehouseEntryTime(
					simpleDateFormat.parse(request.getParameter("warehouseEntryTime")));
			f.setTransactorName(request.getParameter("transactorName"));
			f.setRemark(request.getParameter("remark"));
			formsDAO.updateForm(f);
			return "forms_update_success";
		} catch (ParseException e) {
			e.printStackTrace();
			return "forms_update_failure";
		}
	}
}

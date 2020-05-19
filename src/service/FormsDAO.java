package service;

import java.util.List;

import entity.Form;

public interface FormsDAO {
	
	public List<Form> queryAllForm();
	
	public Form queryFormByFormId(String formId);
	
	public Form queryFormByItemId(String itenId);
	
	public boolean insertForm(Form f);
	
	public boolean updateForm(Form f);
	
	public boolean deleteFormById(String id);
}

package junit;

import java.util.Date;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import entity.Form;
import service.FormsDAO;
import sevice_impl.FormsDAOImpl;

public class FormsDAOimplTest {
	
	private FormsDAO formsDAOImpl;
	@Before
	public void setUp() throws Exception {
		formsDAOImpl = new FormsDAOImpl();
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void testQueryAllForm() {
	}

	@Test
	public void testQueryFormByFormId() {
	}

	@Test
	public void testQueryFormByItemId() {
	}

	@Test
	public void testInsertForm() {
//		Form f1 = new Form(new Date(), "张三", "测试表单");
//		formsDAOImpl.insertForm(f1);
	}

	@Test
	public void testUpdateForm() {
//		Form f = new Form();
//		f.setFormId("F201702270700001");
//		f.setTransactorName("李四");
//		f.setWarehouseEntryTime(new Date());
//		f.setRemark("增添测试1");
//		formsDAOImpl.updateForm(f);
	}

	@Test
	public void testDeleteFormById() {
		System.out.println(formsDAOImpl.deleteFormById("F201702250700000"));
		
	}

}

package junit;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import entity.Item;
import service.ItemsDAO;
import sevice_impl.ItemsDAOImpl;

public class ItemsDAOImplTest {
	ItemsDAO itemsDAO = null;

	@Before
	public void setUp() throws Exception {
		itemsDAO = new ItemsDAOImpl();
	}

	@After
	public void tearDown() throws Exception {
	}

//	@Test
//	public void testQueryAllItem() {
//		List<Item> list = null;
//		list = itemsDAO.queryAllItem();
//		if (list != null) {
//			for (Item item : list) {
//				System.out.println(item);
//			}
//		}
//	}

	@Test
	public void testQueryItemByName() {
	}

	@Test
	public void testQueryItemById() {
	}

	@Test
	public void testInsertItem() {
		Item i1 = new Item("F201702240900000", "ÒÎ×Ó","ÆÕÍ¨Ä¾ÒÎ",2,50,"´ò°ËÕÛ");
		Item i2 = new Item("F201702240900000", "×À×Ó","ÆÕÍ¨Ä¾×À",2,300,"´òÆßÕÛ");
		itemsDAO.insertItem(i1);
		itemsDAO.insertItem(i2);
	}

	@Test
	public void testUpdateItem() {
	}

	@Test
	public void testDeleteItemById() {
//		itemsDAO.deleteItemById("I201702240900000");
//		itemsDAO.deleteItemById("I201702240900001");
	}

}

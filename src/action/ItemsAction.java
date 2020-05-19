package action;

import java.util.List;

import entity.Item;
import service.ItemsDAO;
import sevice_impl.ItemsDAOImpl;

public class ItemsAction extends BaseAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	// 查询所有资产信息
	public String queryAll() {
		ItemsDAO itemsDAO = new ItemsDAOImpl();
		List<Item> list = itemsDAO.queryAllitems();
		if (list != null && list.size() > 0) {
			session.setAttribute("items_list", list);
			return "items_query_all_success";
		} else {
			session.setAttribute("items_list", null);
			return "items_query_all_success";			
		}
	}

	// 删除资产信息
	public String delete() {
		ItemsDAO itemsDAO = new ItemsDAOImpl();
		String itemId = request.getParameter("itemId");
		if (itemsDAO.deleteItemById(itemId))
			return "items_delete_success";
		else 
			return "items_delete_failure";
		
	}
	
	public String insert(){
		Item i = new Item();
		ItemsDAO itemsDAO = new ItemsDAOImpl();
		i.setFormId(request.getParameter("formId"));
		i.setItemName(request.getParameter("itemName"));
		i.setNum(Integer.parseInt(request.getParameter("num")));
		i.setPrice(Double.parseDouble(request.getParameter("price")));
		i.setSpecification(request.getParameter("specification"));
		i.setRemark(request.getParameter("remark"));
		if (itemsDAO.insertItem(i)) {
			return "items_insert_success";				
		} else 
			return "items_insert_failure"; 
	}
	
	public String modify(){
		String itemId = request.getParameter("itemId");
		ItemsDAO itemsDAO = new ItemsDAOImpl();
		Item i = itemsDAO.queryItemById(itemId);
		session.setAttribute("modify_item", i);
		return "items_modify_success";
	}
	
	public String update(){
		Item i = new Item();
		ItemsDAO itemsDAO = new ItemsDAOImpl();
		String itemId = request.getParameter("itemId");
		int num = Integer.parseInt(request.getParameter("num"));
		double price = Double.parseDouble(request.getParameter("price"));
		request.setAttribute("itemId", itemId);
		i.setItemId(itemId);
		i.setFormId(request.getParameter("formId"));
		i.setItemName(request.getParameter("itemName"));
		i.setNum(num);
		i.setPrice(price);
		i.setSpecification(request.getParameter("specification"));
		i.setRemark(request.getParameter("remark"));
		i.setAmount(price * num);
		if (itemsDAO.updateItem(i)){
			return "items_update_success";			
		} else 
			return "items_update_failure";
	}
}

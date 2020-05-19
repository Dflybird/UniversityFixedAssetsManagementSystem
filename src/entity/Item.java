package entity;

public class Item {
	private String itemId;
	private String formId;
	private String itemName;
	private String specification;
	private int num;
	private double price;
	private double amount;
	private String remark;

	public Item(String formId, String itemName, String specification, int num, double price, String remark) {
		this.formId = formId;
		this.itemName = itemName;
		this.specification = specification;
		this.num = num;
		this.price = price;
		this.remark = remark;
		setAmount(price*num);
	}

	public String getFormId() {
		return formId;
	}
	
	public void setFormId(String formId) {
		this.formId = formId;
	}

	public Item() {
	}

	public String getItemId() {
		return itemId;
	}

	public void setItemId(String itemId) {
		this.itemId = itemId;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public String getSpecification() {
		return specification;
	}

	public void setSpecification(String specification) {
		this.specification = specification;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public double getAmount() {
		return amount;
	}
	
	public void setAmount(double amount) {
		this.amount = amount;
	}
	
	@Override
	public String toString() {
		return "Item [itemId=" + itemId + ", itemName=" + itemName + ", specification=" + specification + ", num=" + num
				+ ", price=" + price + ", amount=" + amount + ", remark=" + remark + "]";
	}
}

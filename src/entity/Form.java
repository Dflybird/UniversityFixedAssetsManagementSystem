package entity;

import java.util.Date;

public class Form {
	private String formId;
	private Date warehouseEntryTime;
	private String transactorName;
	private String remark;
	
	public Form(Date warehouseEntryTime, String transactorName, String remark) {
		this.warehouseEntryTime = warehouseEntryTime;
		this.transactorName = transactorName;
		this.remark = remark;
	}

	public Form() {	}

	public String getFormId() {
		return formId;
	}

	public void setFormId(String formId) {
		this.formId = formId;
	}

	public Date getWarehouseEntryTime() {
		return warehouseEntryTime;
	}

	public void setWarehouseEntryTime(Date warehouseEntryTime) {
		this.warehouseEntryTime = warehouseEntryTime;
	}

	public String getTransactorName() {
		return transactorName;
	}

	public void setTransactorName(String transactorName) {
		this.transactorName = transactorName;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	@Override
	public String toString() {
		return "Form [formId=" + formId + ", warehouseEntryTime=" + warehouseEntryTime + ", transactorName="
				+ transactorName + ", remark=" + remark + "]";
	}
}

package common.db.model;

import java.util.HashMap;

public class UsersModel {
	protected int userId;
	protected String userName;
	protected String userPassword;
	protected String userEmail;
	protected String userPhone;
	protected int addressId;
	protected int userStatus = -1;
	protected int createTime;
	protected int updateTime;
	
	/**
	 * 目的是为了省代码
	 * @return
	 */
	public static UsersModel instantce() {
		return new UsersModel();
	}
	
	public int getUserId() {
		return userId;
	}
	public UsersModel setUserId(int userId) {
		this.userId = userId;
		return this;
	}
	public String getUserName() {
		return userName;
	}
	public UsersModel setUserName(String userName) {
		this.userName = userName;
		return this;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public UsersModel setUserPassword(String userPassword) {
		this.userPassword = userPassword;
		return this;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public UsersModel setUserEmail(String userEmail) {
		this.userEmail = userEmail;
		return this;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public UsersModel setUserPhone(String userPhone) {
		this.userPhone = userPhone;
		return this;
	}
	public int getAddressId() {
		return addressId;
	}
	public UsersModel setAddressId(int addressId) {
		this.addressId = addressId;
		return this;
	}
	public int getUserStatus() {
		return userStatus;
	}
	public UsersModel setUserStatus(int userStatus) {
		this.userStatus = userStatus;
		return this;
	}
	public int getCreateTime() {
		return createTime;
	}
	public UsersModel setCreateTime(int createTime) {
		this.createTime = createTime;
		return this;
	}
	public int getUpdateTime() {
		return updateTime;
	}
	public UsersModel setUpdateTime(int updateTime) {
		this.updateTime = updateTime;
		return this;
	}
	
	protected HashMap condition()
	 {
		 HashMap condition = new HashMap();	
		 if (this.getUserId() > 0) {
			  condition.put("user_id", this.getUserId());
		 }
		 if(this.getUserName() != null) {
			 condition.put("user_name", "'"+this.getUserName()+"'");
		 }
		 if (this.getAddressId() > 0) {
			  condition.put("address_id", this.getAddressId());
		 }
		 if (this.getUserPassword() != null ) {
			  condition.put("user_password", "'"+this.getUserPassword()+"'");
		 }
		 if (this.getCreateTime() > 0) {
			  condition.put("create_time", this.getCreateTime());
		 }
		 if (this.getUpdateTime() > 0) {
			  condition.put("update_time", this.getUpdateTime());
		 }
		 if (this.getUserEmail() != null ) {
			  condition.put("user_email", "'"+this.getUserEmail()+"'");
		 }
		 if (this.getUserStatus() > -1) {
			  condition.put("user_status", this.getUserStatus());
		 }
		 return condition;
	 } 
	
	public String getCondition() {
		HashMap condition = this.condition();
		return CommonModel.IteratorModel(condition, "and");
	}
	
	public String getFields() {
		HashMap fields = this.condition();
		return CommonModel.IteratorFields(fields);
	}
	
	public String getData() {
		HashMap data = this.condition();
		return CommonModel.IteratorModel(data, ",");
	}
	
}
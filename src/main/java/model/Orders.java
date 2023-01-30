package model;

import java.sql.Date;
import java.util.List;

public class Orders {
	private String userMail;
	private int orderId;
	private int status;
	private Date orderDate;
	private String discount;
	private String address;

	private float price;
	private String phoneNumber;
	private List<ProductOrders> lp;
	private Date receivedDate;

	public Orders() {
		super();
	}

	public Orders(String userMail, int orderId, int status, Date orderDate, String address, float price,
			String phoneNumber, List<ProductOrders> lp, Date receivedDate) {
		super();
		this.userMail = userMail;
		this.orderId = orderId;
		this.status = status;
		this.orderDate = orderDate;
		this.address = address;
		this.price = price;
		this.phoneNumber = phoneNumber;
		this.lp = lp;
		this.receivedDate = receivedDate;
	}
	

	public Orders(String userMail, int orderId, int status, Date orderDate, String discount, String address) {
		super();
		this.userMail = userMail;
		this.orderId = orderId;
		this.status = status;
		this.orderDate = orderDate;
		this.discount = discount;
		this.address = address;
	}

	public Orders(int status, String address, String phoneNumber, String userMail, Date receivedDate, String discount) {
		super();
		this.status = status;
		this.address = address;
		this.phoneNumber = phoneNumber;
		this.userMail = userMail;
		this.receivedDate = receivedDate;
		this.discount = discount;
	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public List<ProductOrders> getLp() {
		return lp;
	}

	public void setLp(List<ProductOrders> lp) {
		this.lp = lp;
	}

	public String getUserMail() {
		return userMail;
	}

	public void setUserMail(String userMail) {
		this.userMail = userMail;
	}

	public Date getReceivedDate() {
		return receivedDate;
	}

	public void setReceivedDate(Date receivedDate) {
		this.receivedDate = receivedDate;
	}

	public String getDiscount() {
		return discount;
	}

	public void setDiscount(String discount) {
		this.discount = discount;
	}
}

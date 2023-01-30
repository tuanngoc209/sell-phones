package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import context.DBContext;
import model.Cart;
import model.Orders;
import model.Product;

public class OrdersDAO {
	
	public void insertOrder(Orders o, Cart c) throws Exception {
		
		Connection connection = new DBContext().getConnection();
		
		try {
			List<Product> pr = c.getItems();			
			
			Statement stmt = connection.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT TOP 1 order_id FROM Orders ORDER BY order_id DESC"); // lấy ra id lớn nhất để tiếp tục auto tăng id
			int id = 0;
			//lần đầu con trỏ ở vị trí trước hàng đầu tiên nên rs.next() trỏ vào vị trí đầu sẽ không có gì
			if (rs.next()) {
				id = rs.getInt("order_id");
			}
			id = id + 1;

			String sql2 = "SET IDENTITY_INSERT orders ON"
					+ " INSERT INTO Orders (user_mail,order_id,order_status,order_date,order_discount_code, order_address) VALUES(?, ?, ?, ?, ?, ?)"
					+ " SET IDENTITY_INSERT orders OFF";
			PreparedStatement statement2 = connection.prepareStatement(sql2);

			statement2.setString(1, o.getUserMail());
			statement2.setString(2, "" + id);
			statement2.setString(3, "" + o.getStatus());

			Date date = new Date(Calendar.getInstance().getTime().getTime());
			SimpleDateFormat f = new SimpleDateFormat("yyyy-mm-dd");
			String validDate = f.format(date);
			statement2.setDate(4, date);
			statement2.setString(5, o.getDiscount());

			
			statement2.setString(6, o.getAddress());

			statement2.executeUpdate();
			statement2.close();
			
						
			String sql = "INSERT INTO Orders_detail VALUES (?,?,?,?)";
			PreparedStatement statement = connection.prepareStatement(sql);
			for (Product p : pr) {
				statement.setString(1, "" + id);
				statement.setString(2, "" + p.getId());
				statement.setString(3, "" + p.getNumber());
				statement.setString(4, "" + p.getPrice());

				statement.executeUpdate();
			}
			statement.close();
						

		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
}

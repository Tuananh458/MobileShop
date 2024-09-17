import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import java.sql.ResultSet;
import java.sql.Types;
import java.net.URLDecoder;
/**
 * Servlet implementation class ThanhToanServlet
 */
@WebServlet("/thanhtoan")
public class ThanhToanServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThanhToanServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			SQLSEVERDataAccess sqlAccess = new SQLSEVERDataAccess();
			Cookie cookies[] = request.getCookies();
			Gson gson = new Gson();
			CART cart = null;
			String jsonString = null;
			String tennguoidung = null;
			int mahoadon;
			int manguoidung;
			Object outputQuery[];
			ResultSet rs = null;
			HttpSession session = request.getSession();
			
			for (Cookie cookie : cookies)
				if (cookie.getName().equals("cart") && !cookie.getValue().equals("")) {
					jsonString = URLDecoder.decode(cookie.getValue(), "UTF-8");
					cart = gson.fromJson(jsonString, CART.class);
				} else if (cookie.getName().equals("user") && !cookie.getValue().equals(""))
					tennguoidung = cookie.getValue();
			// nếu không có tên người dùng thì yêu cầu đăng nhập lại
			if (tennguoidung == null) {
				response.sendRedirect("login.jsp");
				return;
			}
			// nếu không giỏ hàng trống thì quay về trang chủ
			if (cart == null) {
				response.sendRedirect("index.jsp");
				return;
			}
			
			// kiểm tra mã người dùng xem có tồn tại không, nếu không thì quay về đăng nhập
			rs = sqlAccess.getResultSet("SELECT MAKHACHHANG FROM tbKHACHHANG WHERE USERNAME = ?", new Object[] {tennguoidung});
			if (!rs.next()) {
				response.sendRedirect("login.jsp");
				return;
			}
			
			manguoidung = rs.getInt(1);
			outputQuery = sqlAccess.Execute_StoredProcedures1("PROC_ThemHoaDon (?, ?)", new Object[] {null, manguoidung}, new int[] {Types.INTEGER, 0});
			mahoadon = (int)outputQuery[0];
			
			for (ITEM item : cart.CARTS().values())
				sqlAccess.Execute_StoredProcedures("PROC_ThemChiTietHoaDon (?, ?, ?)", new Object[] {mahoadon, item.getMasp(), item.getSl()});
			session.setAttribute("thanhcong", true);
			request.getRequestDispatcher("ThanhToanThanhCong.jsp").forward(request, response);
		}
		catch (Exception e) {
			response.setContentType("text/plain");
			e.printStackTrace(response.getWriter());
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}

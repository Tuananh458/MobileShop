
import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.sql.ResultSet;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

/**
 * Servlet implementation class doGiohang
 */
@WebServlet("/doGiohang")
public class doGiohang extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public doGiohang() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			StringBuffer url = request.getRequestURL();
			String queryString = request.getQueryString();
			if (queryString != null) {
			    url.append("?").append(queryString);
			}
			String fullUrl = url.toString();

			HttpSession session = request.getSession();
			session.setAttribute("previousPage", fullUrl);
			
			
			Cookie[] cookies = request.getCookies();

			Boolean test1 = false;
			for (Cookie cookie : cookies)
				if (cookie.getName().equals("user"))
					test1 = true;
			if (test1 == false) {
				response.sendRedirect("doDangnhap");
				return;
			}


			System.out.print("hehehe");
			SQLSEVERDataAccess conn = new SQLSEVERDataAccess();
			ResultSet rs = conn.getResultSet("select * from tbSANPHAM where masp= " + request.getParameter("themid"));
			rs.next();

			CART cart = null;
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("cart")) {
					String value = URLDecoder.decode(cookie.getValue(), "UTF-8");
					Gson gson = new Gson();
					cart = gson.fromJson(value, CART.class);
				}
			}
			if (cart != null) {

				if (request.getParameter("xoahet") != null)
					cart.DeleteAll();
				else if (request.getParameter("themid") != null)
					cart.Additem(rs.getInt(1), rs.getString(2), rs.getInt(5), new Date(), rs.getString(3));
				else if (request.getParameter("xoaid") != null)
					cart.Deleteitem(Integer.parseInt(request.getParameter("xoaid")));
				else if (request.getParameter("giamid") != null)
					cart.giamsl1(Integer.parseInt(request.getParameter("giamid")));

				Gson gson = new Gson();
				String json = gson.toJson(cart);
				Cookie cookie = new Cookie("cart", URLEncoder.encode(json, "UTF-8"));
				cookie.setPath("/");
				cookie.setMaxAge(3600);
				response.addCookie(cookie);

			}
			response.sendRedirect("Giohang.jsp");
		} catch (Exception e) {
			System.out.print("Error: " + e.getMessage());
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

	}

}

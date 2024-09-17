import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import java.io.*;
import java.util.*;
import java.net.URLEncoder;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Servlet implementation class doDangnhap
 */
@WebServlet("/doDangnhap")
public class doDangnhap extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public doDangnhap() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("dangnhap.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		SQLSEVERDataAccess conn = new SQLSEVERDataAccess();
		ResultSet rs=conn.getResultSet("select * from tbKHACHHANG where USERNAME= '" + username +"' and PASSWORD= '" + password+"'");
		try {
			if (rs.next()==false){
				String error=URLEncoder.encode("Tên đăng nhập hoặc mật khẩu không chính xác!","UTF-8");
				response.sendRedirect("dangnhap.jsp?error=" + error);}
			else{
				try{
				  	
					Gson gson=new Gson();
					String json = gson.toJson(new CART());

				  	Cookie cart = new Cookie("cart", URLEncoder.encode(json, "UTF-8"));
				  	cart.setPath("/");
				  	cart.setMaxAge(3600);
				  	response.addCookie(cart);

				  	Cookie user=new Cookie("user", username);
				  	user.setPath("/");
				  	user.setMaxAge(3600);
				  	response.addCookie(user);

					HttpSession session = request.getSession();
				  	
				if (session.getAttribute("previousPage")!=null){
					String previousPage = session.getAttribute("previousPage").toString();
				  	response.sendRedirect(previousPage);
				}
			
				else
					response.sendRedirect("index.jsp");

				}
				catch(Exception e){
					System.out.print("Error: " + e.getMessage());
				}

			}
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}

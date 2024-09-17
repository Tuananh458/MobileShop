import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class doDangky
 */
@WebServlet("/doDangky")
public class doDangky extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public doDangky() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.sendRedirect("dangky.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SQLSEVERDataAccess conn = new SQLSEVERDataAccess();
		String ho = request.getParameter("FirstName");
		String ten = request.getParameter("LastName");
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String repass = request.getParameter("repass");
		int k;
		if (password.equals(repass)) {
			String SQL = ("insert into tbKHACHHANG (HOKHACHHANG,TENKHACHHANG,EMAIL,USERNAME,PASSWORD)" + "values(?,?,?,?,?)");
			Object[] param = {ho, ten, email, username, password};
			k = conn.ExecuteSQL(SQL, param);
			response.sendRedirect("dangnhap.jsp");
		} 
		else
			response.sendRedirect("dangky.jsp");
		}
}

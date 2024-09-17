import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.annotation.WebServlet;
import com.oreilly.servlet.MultipartRequest;

@WebServlet("/uploadsanpham")
public class UploadSanPham extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UploadSanPham() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String masp = request.getParameter("masp");
//		sẽ lấy thông tin
		SQLSEVERDataAccess conn = new SQLSEVERDataAccess();
		SanPham sp = null;
		ResultSet rs = conn.getResultSet("Select * from SanPham where masp=" + masp);
		try {
			while (rs.next()) {
				sp = new SanPham(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11), rs.getInt(12), rs.getInt(13),
						rs.getString(14), rs.getInt(15), rs.getInt(16));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		request.setAttribute("SanPham", sp);
		;
		response.sendRedirect("inputsanpham.jsp");

//		System.out.println(request.getCharacterEncoding());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		final String IMAGE_SAVED_PATH = request.getServletContext().getRealPath("/assets/image");
		request.setCharacterEncoding("UTF-8");
		MultipartRequest multipartRequest = new MultipartRequest(request, IMAGE_SAVED_PATH);
		String masp = multipartRequest.getParameter("masp");
		if (masp== null) {
		
			System.out.println(request.getCharacterEncoding());
			try {
				SQLSEVERDataAccess sqlAccess = new SQLSEVERDataAccess();
				
				sqlAccess.Execute_StoredProcedures("PROC_ThemSanPham (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)", new Object[] {
						multipartRequest.getParameter("tensp") != null ? new String(multipartRequest.getParameter("tensp").getBytes("iso-8859-1"), "UTF-8") : null,
						multipartRequest.getFilesystemName("hinhanh") != null ? new String(multipartRequest.getFilesystemName("hinhanh").getBytes("iso-8859-1"), "UTF-8") : null,
						multipartRequest.getParameter("giatiengoc") != null ? new String(multipartRequest.getParameter("giatiengoc").getBytes("iso-8859-1"), "UTF-8") : null,
						multipartRequest.getParameter("giatienkm") != null ? new String(multipartRequest.getParameter("giatienkm").getBytes("iso-8859-1"), "UTF-8") : null,
						multipartRequest.getParameter("khuyenmai") != null ? new String(multipartRequest.getParameter("khuyenmai").getBytes("iso-8859-1"), "UTF-8") : null,
						multipartRequest.getParameter("manhinh") != null ? new String(multipartRequest.getParameter("manhinh").getBytes("iso-8859-1"), "UTF-8") : null,
						multipartRequest.getParameter("hedieuhanh") != null ? new String(multipartRequest.getParameter("hedieuhanh").getBytes("iso-8859-1"), "UTF-8") : null,
						multipartRequest.getParameter("camera_sau") != null ? new String(multipartRequest.getParameter("camera_sau").getBytes("iso-8859-1"), "UTF-8") : null,
						multipartRequest.getParameter("camera_truoc") != null ? new String(multipartRequest.getParameter("camera_truoc").getBytes("iso-8859-1"), "UTF-8") : null,
						multipartRequest.getParameter("cpu") != null ? new String(multipartRequest.getParameter("cpu").getBytes("iso-8859-1"), "UTF-8") : null,
						multipartRequest.getParameter("ram") != null ? new String(multipartRequest.getParameter("ram").getBytes("iso-8859-1"), "UTF-8") : null,
						multipartRequest.getParameter("bonhotrong") != null ? new String(multipartRequest.getParameter("bonhotrong").getBytes("iso-8859-1"), "UTF-8") : null,
						multipartRequest.getParameter("thenho") != null ? new String(multipartRequest.getParameter("thenho").getBytes("iso-8859-1"), "UTF-8") : null,
						multipartRequest.getParameter("dungluongpin") != null ? new String(multipartRequest.getParameter("dungluongpin").getBytes("iso-8859-1"), "UTF-8") : null,
						multipartRequest.getParameter("mahang") != null ? new String(multipartRequest.getParameter("mahang").getBytes("iso-8859-1"), "UTF-8") : null
					}
				);
			}
			catch (Exception e) {
				// TODO: handle exception
				response.setStatus(500);
				response.getWriter().write(e.getMessage());
				e.printStackTrace();
			}
			
		}
		else {
			try {
				SQLSEVERDataAccess sqlAccess = new SQLSEVERDataAccess();
				
				sqlAccess.Execute_StoredProcedures("PROC_SuaSanPham (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)", new Object[] {
						masp,
						multipartRequest.getParameter("tensp") != null ? new String(multipartRequest.getParameter("tensp").getBytes("iso-8859-1"), "UTF-8") : null,
						multipartRequest.getFilesystemName("hinhanh") != null ? new String(multipartRequest.getFilesystemName("hinhanh").getBytes("iso-8859-1"), "UTF-8") : null,
						multipartRequest.getParameter("giatiengoc") != null ? new String(multipartRequest.getParameter("giatiengoc").getBytes("iso-8859-1"), "UTF-8") : null,
						multipartRequest.getParameter("giatienkm") != null ? new String(multipartRequest.getParameter("giatienkm").getBytes("iso-8859-1"), "UTF-8") : null,
						multipartRequest.getParameter("khuyenmai") != null ? new String(multipartRequest.getParameter("khuyenmai").getBytes("iso-8859-1"), "UTF-8") : null,
						multipartRequest.getParameter("manhinh") != null ? new String(multipartRequest.getParameter("manhinh").getBytes("iso-8859-1"), "UTF-8") : null,
						multipartRequest.getParameter("hedieuhanh") != null ? new String(multipartRequest.getParameter("hedieuhanh").getBytes("iso-8859-1"), "UTF-8") : null,
						multipartRequest.getParameter("camera_sau") != null ? new String(multipartRequest.getParameter("camera_sau").getBytes("iso-8859-1"), "UTF-8") : null,
						multipartRequest.getParameter("camera_truoc") != null ? new String(multipartRequest.getParameter("camera_truoc").getBytes("iso-8859-1"), "UTF-8") : null,
						multipartRequest.getParameter("cpu") != null ? new String(multipartRequest.getParameter("cpu").getBytes("iso-8859-1"), "UTF-8") : null,
						multipartRequest.getParameter("ram") != null ? new String(multipartRequest.getParameter("ram").getBytes("iso-8859-1"), "UTF-8") : null,
						multipartRequest.getParameter("bonhotrong") != null ? new String(multipartRequest.getParameter("bonhotrong").getBytes("iso-8859-1"), "UTF-8") : null,
						multipartRequest.getParameter("thenho") != null ? new String(multipartRequest.getParameter("thenho").getBytes("iso-8859-1"), "UTF-8") : null,
						multipartRequest.getParameter("dungluongpin") != null ? new String(multipartRequest.getParameter("dungluongpin").getBytes("iso-8859-1"), "UTF-8") : null,
						multipartRequest.getParameter("mahang") != null ? new String(multipartRequest.getParameter("mahang").getBytes("iso-8859-1"), "UTF-8") : null
					}
				);
			}
			catch (Exception e) {
				// TODO: handle exception
				response.setStatus(500);
				response.getWriter().write(e.getMessage());
				e.printStackTrace();
			}
		}
		response.sendRedirect("index.jsp");

	}
}

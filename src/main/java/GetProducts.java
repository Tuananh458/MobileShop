import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/GetProducts")
public class GetProducts extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        SQLSEVERDataAccess conn = new SQLSEVERDataAccess();
        List<SanPham> sps = new ArrayList<>();
        try {
            ResultSet rs = conn.getResultSet("select * from SanPham");
            while (rs.next()) {
                SanPham sp = new SanPham(
                    rs.getInt("masp"), 
                    rs.getString("tensp"), 
                    rs.getString("hinhanh"), 
                    rs.getInt("giatiengoc"), 
                    rs.getInt("giatienkm"), 
                    rs.getString("khuyenmai"),
                    rs.getString("manhinh"), 
                    rs.getString("hedieuhanh"), 
                    rs.getString("camera_sau"), 
                    rs.getString("camera_truoc"), 
                    rs.getString("cpu"), 
                    rs.getInt("ram"), 
                    rs.getInt("bonhotrong"), 
                    rs.getString("thenho"), 
                    rs.getInt("dungluongpin"), 
                    rs.getInt("mahang")
                );
                sps.add(sp);
            }
            rs.close();
        } catch (Exception e) {
            e.printStackTrace(); // Log or handle the exception appropriately
        }
        request.setAttribute("products", sps);
        request.getRequestDispatcher("DanhsachSanpham.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}

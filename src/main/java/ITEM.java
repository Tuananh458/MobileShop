import java.util.Date;

public class ITEM {
	private int masp;
	private String tensp;
	private int gia;
	private int sl;
	private int tongtien;
 	private Date thoigian; 
 	private String hinhanh;

 	
	public ITEM(int masp,String tensp, int gia, int sl, Date thoigian, String hinhanh) {
		super();
		this.masp=masp;
		this.tensp = tensp;
		this.gia = gia;
		this.sl = sl;
		this.thoigian=thoigian;
		this.hinhanh=hinhanh;
	}

	public int getMasp() {
		return masp;
	}

	public String getTensp() {
		return tensp;
	}
	public void setTensp(String tensp) {
		this.tensp = tensp;
	}
	public int getGia() {
		return gia;
	}
	public void setGia(int gia) {
		this.gia = gia;
	}
	public int getSl() {
		return sl;
	}
	public void setSl(int sl) {
		this.sl = sl;
	}
	public int getTongtien() {
		return sl*gia;
	}

 	public Date getThoigian(){
		return this.thoigian;
	}  
 	
 	public String getHinhanh(){
 		return this.hinhanh;
 	}
}
<%@page import="java.util.Hashtable"%>
<%@include file="ITEM.jsp"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>

<%!
public class CART {
	private Hashtable<Integer, ITEM> Carts = new Hashtable<Integer, ITEM>();

	public Hashtable<Integer, ITEM> CARTS() {
		return this.Carts;
	}


	public void Additem(int idsanpham, String tensanpham, int dongia,Date ngay, String hinhanh) {
		if (Carts.containsKey(idsanpham))
			Carts.get(idsanpham).setSl(Carts.get(idsanpham).getSl() + 1);
		else {
			ITEM item = new ITEM(idsanpham, tensanpham, dongia, 1, ngay,hinhanh);
			Carts.put(idsanpham, item);
		}
	}

	public void Deleteitem(int idsanpham) {
		Carts.remove(idsanpham);
	}

	public void DeleteAll() {
		Carts.clear();
	}


	public double TotalBill() {
		double toltal=0;
		for (ITEM item : Carts.values())
			toltal += item.getTongtien();
		return toltal;
	}
	
	
	public void giamsl1(int id){
		if (Carts.get(id).getSl()==1)
			Carts.remove(id);
		else
			Carts.get(id).setSl(Carts.get(id).getSl()-1);
	}
	
	public int tongsp(){
		int tong=0;
		Set<Integer> keySet = Carts.keySet();
		for (Integer key : keySet) {
			tong+=Carts.get(key).getSl();
		}
		return tong;
	}
	
}
%>

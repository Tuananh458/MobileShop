public class SanPham {
    public final int masp;
    public final String tensp;
    public final String hinhanh;
    public final int giatiengoc;
    public final int giatienkm;
    public final String khuyenmai;
    public final String manhinh;
    public final String hedieuhanh;
    public final String camera_sau;
    public final String camera_truoc;
    public final String cpu;
    public final int ram;
    public final int bonhotrong;
    public final String thenho;
    public final int dungluongpin;
    public final int mahang;
    
    public SanPham(int masp, String tensp, String hinhanh, int giatiengoc, int giatienkm, String khuyenmai,
            String manhinh, String hedieuhanh, String camera_sau, String camera_truoc, String cpu, int ram,
            int bonhotrong, String thenho, int dungluongpin, int mahang) {
        this.masp = masp;
        this.tensp = tensp;
        this.hinhanh = hinhanh;
        this.giatiengoc = giatiengoc;
        this.giatienkm = giatienkm;
        this.khuyenmai = khuyenmai;
        this.manhinh = manhinh;
        this.hedieuhanh = hedieuhanh;
        this.camera_sau = camera_sau;
        this.camera_truoc = camera_truoc;
        this.cpu = cpu;
        this.ram = ram;
        this.bonhotrong = bonhotrong;
        this.thenho = thenho;
        this.dungluongpin = dungluongpin;
        this.mahang = mahang;
    }

    

    @Override
    public boolean equals(Object obj) {
        if (obj instanceof Integer)
            return ((Integer) obj).intValue() == this.masp;
        if (obj instanceof SanPham)
            return (((SanPham) obj).masp == this.masp);
        return false;
    }
}

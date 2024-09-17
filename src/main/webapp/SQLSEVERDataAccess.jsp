<%@ page import="java.sql.*"%>

<%!
	public class SQLSEVERDataAccess {
	    Connection cnn;
	    Statement stm;
	    PreparedStatement ps;
	    public SQLSEVERDataAccess() {
	        try {
	            String DriverClass, DriverURL;
	            String IntegratedSecurity = "IntegratedSecurity=true";
	            DriverClass = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	            DriverURL = "jdbc:sqlserver://DESKTOP-8PESD46:1433;"
						+ "username=sa;password=123456;databaseName=WEBBANDIENTHOAI;encrypt=false";
	            Class.forName(DriverClass);
	            this.cnn = DriverManager.getConnection(DriverURL);
	            this.stm = this.cnn.createStatement();
	        } catch (SQLException ex) {
	        } catch (Exception e) {
	        }
	    }
	
	    public ResultSet getResultSet(String SQL) {
	        try {
	            ResultSet rs;
	            rs = this.stm.executeQuery(SQL);
	            return rs;
	        } catch (Exception ex) {
	        }
	        return null;
	}
	
	    public ResultSet getResultSet(String SQL, Object[] param) {
	        ResultSet rs = null;
	        PreparedStatement ps = null;
	        try {
	            ps = cnn.prepareStatement(SQL);
	            int i = 1;
	            for (Object value : param) {
	                ps.setObject(i, value);
	                i++;
	            }
	            rs = ps.executeQuery();
	            return rs;
	        } catch (SQLException ex) {
	            ex.printStackTrace();
	        }
	        return null;
	    }
	
	
	    public int ExecuteSQL(String SQL) {
	        try {
	            int k = 0;
	            k = this.stm.executeUpdate(SQL);
	            return k;
	        } catch (SQLException e) {
	        }
	        return 0;
	    }
	
	    public int ExecuteSQL(String SQL, Object[] param) {
	        try {
	            int k = 0;
	            PreparedStatement ps = this.cnn.prepareStatement(SQL);
	            int i = 1;
	            for (Object value : param) {
	                ps.setObject(i, value);
	                i++;
	            }
	            k = ps.executeUpdate();
	            ps.close();
	            return k;
	        } catch (SQLException e) {
	        }
	        return 0;
	    }
	
	    public int Execute_StoredProcedures(String NameStoredProcedures, Object[] param) {
	        try {
	            int k = 0;
	            CallableStatement ps = this.cnn.prepareCall("{call "+NameStoredProcedures+"}");
	            int i = 1;
	            for (Object value : param) {
	                ps.setObject(i, value);
	                i++;
	            }
	            k = ps.executeUpdate();
	            ps.close();
	            return k;
	        } catch (SQLException e) {
	        }
	        return 0;
	    }
	    public ResultSet getResultSet_StoredProcedures(String nameStoredProcedure, Object[] param) {
	        ResultSet rs = null;
	        PreparedStatement ps = null;
	        try{
	            ps = cnn.prepareCall("{call " + nameStoredProcedure + "}");
	            if (param != null) {
	                int i = 1;
	                for (Object value : param) {
	                    ps.setObject(i, value);
	                    i++;
	                }
	            }
	            rs = ps.executeQuery();
	            return rs;
	        }
	        catch (Exception e){
	            System.out.println("Error: " +e.getMessage());
	
	            return null;
	        }
	    }
	}
%>
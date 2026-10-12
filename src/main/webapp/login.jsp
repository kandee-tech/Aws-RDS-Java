<%@ page import="java.sql.*"%>
<%
    String userName = request.getParameter("userName");    
    String password = request.getParameter("password");
    // DB settings come from Tomcat's environment (written to setenv.sh when the instance boots)
    String dbUrl = "jdbc:mysql://" + System.getenv("DB_HOST") + ":" + System.getenv("DB_PORT") + "/" + System.getenv("DB_NAME");
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection(dbUrl, System.getenv("DB_USER"), System.getenv("DB_PASS"));
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from USER where userName='" +userName + "' and password='" +password + "'");
    if (rs.next()) {
        session.setAttribute("userName", userName);
        response.sendRedirect("success.jsp");
    } else {
        out.println("Invalid password <a href='index.jsp'>try again</a>");
    }
%>

package view;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utill.DBConnection;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * Servlet implementation class AddBoardCtrl
 */
public class AddBoardCtrl extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public AddBoardCtrl() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Not used in this case
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = DBConnection.getConnection();
            String sql = "INSERT INTO board (seq, title, content, regdate) VALUES ((SELECT NVL(MAX(seq), 0) + 1 FROM board), ?, ?, SYSDATE)";
            stmt = conn.prepareStatement(sql);
            
            stmt.setString(1, request.getParameter("title"));
            stmt.setString(2, request.getParameter("content"));

            stmt.executeUpdate();

            response.sendRedirect("getBoardList.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}

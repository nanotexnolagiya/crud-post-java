import com.mysoft.Categories;
import com.mysoft.DAO;

import java.io.IOException;
import java.sql.SQLException;


@javax.servlet.annotation.WebServlet(name = "NewServlet", urlPatterns = "/posts")
public class NewServlet extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {

    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        try {
            request.setAttribute("posts", DAO.getPosts());
            request.setAttribute("categories", Categories.getCategories());
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        request.getRequestDispatcher("WEB-INF/posts.jsp").forward(request,response);
    }
}

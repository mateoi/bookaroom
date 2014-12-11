package utils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Jack on 10/12/14.
 */
@WebServlet(name = "Logout")
public class Logout extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        LoginSystem.forgetSession(request, response);
        response.sendRedirect("/");
    }

    public void init() throws ServletException
    {
        // Do required initialization
    }

    public void destroy()
    {
        // do nothing.
    }
}

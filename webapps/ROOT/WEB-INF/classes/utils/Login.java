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
@WebServlet(name = "Login")
public class Login extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("email");
        String password = request.getParameter("password");
        if(username!=null && password !=null && !username.equals("") && !password.equals("")) {
            boolean loginsuccess = LoginSystem.logIn(request, response, request.getSession());
            if(loginsuccess)
            {
                response.sendRedirect("/");
            }
            else {
                response.sendRedirect("/?failed");
            }

        } else response.sendRedirect("/?failed");
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

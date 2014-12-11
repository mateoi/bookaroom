package utils;

import org.apache.commons.codec.digest.DigestUtils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * Created by andrewwg94 on 12/5/14.
 */
public class LoginSystem {
    public static void saveSession (HttpSession session, HttpServletRequest request,HttpServletResponse response, String username) throws IOException {
        session.setAttribute("username",username);
        session.setAttribute("authsalt",System.currentTimeMillis());
        String cookieVal = session.getAttribute("username") + " "+ request.getRemoteAddr() +" "+ session.getAttribute("authsalt");
        Cookie auth = new Cookie("session_id", DigestUtils.md5Hex(cookieVal));
        response.addCookie(auth);
    }
    public static void forgetSession(HttpServletRequest request, HttpServletResponse response) throws IOException {
        for(Cookie c: request.getCookies()) {
            c.setMaxAge(0);
            response.addCookie(c);
        }
     //   response.sendRedirect("/index.jsp");
    }

    public static boolean isAuthenticated(HttpSession session, HttpServletRequest request) {
        String authVal = session.getAttribute("username") + " "+ request.getRemoteAddr() +" "+ session.getAttribute("authsalt");
        String session_id = "";
        Cookie[] cookies = request.getCookies();
        if(cookies!=null) {
            for(Cookie c: cookies) if(c.getName().equals("session_id")) {
                session_id = c.getValue();
            }
        }
        return DigestUtils.md5Hex(authVal).equals(session_id);
    }
    public static boolean logIn(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        boolean success = false;
        String username = request.getParameter("email");
        String password = request.getParameter("password");
        ArrayList<Object> list = new ArrayList<Object>();
        list.add(username);
            Connection cxn = null;
            try {
                cxn = DBAdapter.dbConnect();
                ResultSet rs = DBAdapter.dbExecute("SELECT username, password FROM users WHERE username=?", list, false, cxn);
                if(rs.next()) {
                    success = password.equals(rs.getString("password"));
                    if (success) {
                        saveSession(session, request, response, username);
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if(cxn!=null) try{cxn.close();} catch(SQLException e) {e.printStackTrace();}
            }
    return success;
    }

}

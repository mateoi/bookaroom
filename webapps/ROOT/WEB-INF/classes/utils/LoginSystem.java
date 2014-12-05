package utils;

import org.apache.commons.codec.digest.DigestUtils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by andrewwg94 on 12/5/14.
 */
public class LoginSystem {
    public static void saveSession (HttpSession session, HttpServletRequest request,HttpServletResponse response, String username) throws IOException {
        session.setAttribute("username",username);
        session.setAttribute("authsalt",System.currentTimeMillis());
        String cookieVal = session.getAttribute("username") + " "+ request.getRemoteAddr() +" "+ session.getAttribute("authsalt");
        response.getWriter().println("cookie val: " + cookieVal);
        Cookie auth = new Cookie("session_id", DigestUtils.md5Hex(cookieVal));
        response.addCookie(auth);
        response.sendRedirect("/index.jsp");
    }
    public static void forgetSession(HttpServletRequest request, HttpServletResponse response) throws IOException {
        for(Cookie c: request.getCookies()) {
            c.setMaxAge(0);
            response.addCookie(c);
        }
        response.sendRedirect("/index.jsp");
    }

    public static boolean isAuthenticated(HttpSession session, HttpServletRequest request) {
        String authVal = session.getAttribute("username") + " "+ request.getRemoteAddr() +" "+ session.getAttribute("authsalt");
        String session_id = "";
        Cookie[] cookies = request.getCookies();
        if(cookies!=null) {
            for(Cookie c: cookies) if(c.getName().equals("session_id")) session_id = c.getValue();
        }
        return DigestUtils.md5Hex(authVal).equals(session_id);
    }
}

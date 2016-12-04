package study.liuhang.cookie;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by liuhang on 2016/12/4.
 */
@WebServlet(name = "CookieDome1",urlPatterns = "/CookieDemo1")
public class CookieDemo1 extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter writer=response.getWriter();
        Cookie[] cookies=request.getCookies();
        if(cookies!=null){
            writer.write("The last access time was:");
            for(Cookie cookie :cookies){
                if(cookie.getName().equals("lastAccess")){
                    Long lastAccessTime=Long.parseLong(cookie.getValue());
                    Date date =new Date(lastAccessTime);
                    writer.write(date.toString());
                }
            }
        }else{
            writer.write("This is your first visit to my site");
        }
        Cookie cookie=new Cookie("lastAccess",System.currentTimeMillis()+"");
        response.addCookie(cookie);
    }
}

package study.liuhang.servelt;

import java.io.IOException;

import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;

/**
 * Created by liuhang on 2016/11/21.
 */
@WebServlet(name = "ServletDemo2", urlPatterns = "/ServletDemo2")
public class ServletDemo2 implements Servlet {
    public void init(ServletConfig var1) {
        System.out.print("servlet init/n");
    }

    public ServletConfig getServletConfig() {
        return null;
    }

    public void service(ServletRequest var1, ServletResponse var2) throws ServletException, IOException {
        System.out.println("servlet execute");
    }

    public void destroy() {

    }

    public String getServletInfo() {
        return null;
    }

}

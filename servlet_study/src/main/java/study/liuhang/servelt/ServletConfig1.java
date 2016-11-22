package study.liuhang.servelt;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by liuhang on 2016/11/22.
 * 在Servlet的配置文件web.xml中，可以使用一个或多个<init-param>标签为servlet配置一些初始化参数。
 */
@WebServlet( urlPatterns = "/ServletConfig1",initParams = @WebInitParam(name="name",value ="liuhang"))
public class ServletConfig1 extends HttpServlet {
    private ServletConfig servletConfig;

    /**
     * @param servletConfig
     * 当servlet配置了初始化参数后，web容器在创建servlet实例对象时， 会自动将这些初始化参数封装到ServletConfig对象中，并在调用servlet的init方法时，
     * 将ServletConfig对象传递给servlet。进而，程序员通过ServletConfig对象就可以得到当前servlet的初始化参数信息。
     */

    @Override
    public void init(ServletConfig servletConfig) {
        this.servletConfig = servletConfig;
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        System.out.println(this.getServletConfig().getInitParameter("name")); 这种方式也可得到
        System.out.println(servletConfig.getInitParameter("name"));
    }
}

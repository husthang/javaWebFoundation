package study.liuhang.servelt;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by liuhang on 2016/11/22.
 */
@WebServlet(name = "ServletContext2",urlPatterns = "/ServletContext2")
public class ServletContext2 extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("servletContext:"+this.getServletContext().getAttribute("name"));
        getProperties();

    }
    public void getProperties() throws IOException{
        String path=this.getServletContext().getRealPath("/WEB-INF/a.properties");
        Properties properties=new Properties();
        properties.load(new FileInputStream(path));
        System.out.println(properties.getProperty("key"));
    }
}

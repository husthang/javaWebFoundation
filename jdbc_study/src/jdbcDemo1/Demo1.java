package jdbcDemo1;

/**
 * Created by liuhang on 2016/11/7.
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class Demo1 {
    public static void main(String[]args) throws Exception{
        DriverManager.registerDriver(new com.mysql.jdbc.Driver());
        Connection connection=DriverManager.getConnection("jdbc:mysql://123.206.232.76:3306/study","liuhang","hang@hust");
        Statement statement=connection.createStatement();
        ResultSet result=statement.executeQuery("select stuname from student");
        while(result.next()){
            System.out.println(result.getObject("stuname"));
        }
        result.close();
        statement.close();
        connection.close();
    }
}

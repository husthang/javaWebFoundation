package junitDemo;

/**
 * Created by liuhang on 2016/11/7.
 * junit测试 assert断言.
 */

import org.junit.Assert;
import org.junit.Test;

public class Demo1 {
    @Test
    public void test1() {
        Calculator c = new Calculator();
        Assert.assertEquals(9, c.add(4, 5));
    }

    @Test
    public void test2() {
        Calculator c = new Calculator();
        Assert.assertEquals(3,c.division(10,3),0.34);//第三个参数,允许的误差值
    }
}

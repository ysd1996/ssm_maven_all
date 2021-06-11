package com.ithei.test;

import com.itheima.domain.Product;
import com.itheima.service.ProductService;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

public class ItemsTest {

    @Test
    public void findByIdTest() {
        //获取spring容器
        ApplicationContext ac = new ClassPathXmlApplicationContext("applicationContext.xml");
        ProductService productService = ac.getBean(ProductService.class);
        List<Product> products = productService.findAll(1,3);
        System.out.println(products);
    }
}

package com.itheima.dao;

import com.itheima.domain.Product;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

public interface ProductDao {

    @Select("select * from product")
    public List<Product> findAll();

    @Insert("insert into product (id, productnum, productname, cityname, departuretime, productprice, productdesc, productstatus) VALUES(#{id}, #{productNum}, #{productName}, #{cityName}, #{departureTime}, #{productPrice}, #{productDesc}, #{productStatus})")
    public void save(Product product);
}

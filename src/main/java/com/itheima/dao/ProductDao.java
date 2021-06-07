package com.itheima.dao;

import com.itheima.domain.Product;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

public interface ProductDao {

    @Select("select * from product")
    public List<Product> findAll();
}

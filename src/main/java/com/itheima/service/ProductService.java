package com.itheima.service;

import com.itheima.domain.Product;

import java.util.List;

public interface ProductService {

    public List<Product> findAll();

    public void save(Product product);
}

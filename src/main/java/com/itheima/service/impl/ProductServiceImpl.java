package com.itheima.service.impl;

import com.github.pagehelper.PageHelper;
import com.itheima.dao.ProductDao;
import com.itheima.domain.Product;
import com.itheima.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

@Service
@Transactional
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductDao productDao;

    public List<Product> findAll(Integer page,Integer size) {

        PageHelper pageHelper = new PageHelper();
        pageHelper.startPage(page,size);
        List<Product> products = productDao.findAll();
        return products;
    }

    public void save(Product product) {
        product.setId(UUID.randomUUID().toString());
        productDao.save(product);
    }
}

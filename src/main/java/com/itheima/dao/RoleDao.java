package com.itheima.dao;

import com.itheima.domain.Role;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface RoleDao {

    @Select("select * from role where id in (select roleId from users_role where userId = #{userrId})")
    public List<Role> findByUserId(Integer userId);
}

package com.itheima.service;

import com.itheima.domain.Permission;
import com.itheima.domain.Role;

import java.util.List;

public interface RoleService {

    public List<Role> findAll();

    void save(Role role);

    Role findById(Integer roleId);

    List<Permission> findOtherPermissions(int parseInt);

    void addPermissionToRole(String roleId, String[] permissionIds);
}

package com.itheima.service.impl;

import com.itheima.dao.RoleDao;
import com.itheima.domain.Permission;
import com.itheima.domain.Role;
import com.itheima.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class RoleServiceImpl implements RoleService {

    @Autowired
    private RoleDao roleDao;

    public List<Role> findAll() {
        return roleDao.findAll();
    }

    public void save(Role role) {
        roleDao.save(role);
    }

    public Role findById(Integer roleId) {
        return roleDao.findById(roleId);
    }

    public List<Permission> findOtherPermissions(int roleId) {
        return roleDao.findOtherPermissions(roleId);
    }

    public void addPermissionToRole(String roleId, String[] permissionIds) {
        for (String permissionId: permissionIds) {
            roleDao.addPermissionToRole(roleId,permissionId);
        }
    }
}

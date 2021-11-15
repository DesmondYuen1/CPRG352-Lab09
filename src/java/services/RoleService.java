package services;

import dataaccess.RoleDB;
import java.util.List;
import models.Role;

public class RoleService {

    public Role getAll(int roleId) throws Exception {
        RoleDB roleDB = new RoleDB();
        Role role = roleDB.getAll(roleId);
        return role;
    }
}

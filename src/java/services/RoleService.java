package services;

import dataaccess.RoleDB;
import java.util.List;
import models.Role;

public class RoleService {

    public List<Role> getAll(int id) throws Exception {
        RoleDB noteDB = new RoleDB();
        List<Role> role = noteDB.getAll(id);
        return role;
    }
}

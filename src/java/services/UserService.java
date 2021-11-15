package services;

import dataaccess.RoleDB;
import dataaccess.UserDB;
import java.util.List;
import models.Role;
import models.User;

public class UserService {

    public List<User> getAll() throws Exception {
        UserDB userDB = new UserDB();
        List<User> users = userDB.getAll();
        return users;
    }

    public User get(String email) throws Exception {
        UserDB userDB = new UserDB();
        User user = userDB.get(email);
        return user;
    }

    public void insert(String email, Boolean active, String firstName, String lastName, String password, int roleId) throws Exception {
        User user = new User(email, active, firstName, lastName, password);
        RoleDB roleDB = new RoleDB();
        Role role = roleDB.getAll(roleId);
        user.setRole(role);
        
        UserDB userDB = new UserDB();
        userDB.insert(user);
    }

    public void update(String email, Boolean active, String firstName, String lastName, String password, int roleId) throws Exception {
        UserDB userDB = new UserDB();
        User user = userDB.get(email);
        user.setActive(active);
        user.setFirstName(firstName);
        user.setLastName(lastName);
        RoleDB roleDB = new RoleDB();
        Role role = roleDB.getAll(roleId);
        user.setRole(role);
    }

    public void delete(String email) throws Exception {
        UserDB userDB = new UserDB();
        User user = userDB.get(email);
        userDB.delete(user);
    }

}

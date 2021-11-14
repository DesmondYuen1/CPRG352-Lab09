<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html> 
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Users</title>
        <style>
            body {
                background-color: grey;
                color: white;
            }
            #addUser {
                padding-right: 20px;
                display: inline-block;
                position: relative;
            }
            #manageUser {
                display: inline-block;
                position: absolute;
            }
            #editUser {
                padding-left: 710px;
                display: inline-block;
                position: absolute;
            }
        </style>
    </head>
    <body>

        <div id="addUser">
            <h1>Add User</h1>
            <form action="" method="POST">
                <input type="email" name="email" placeholder="Email" value=""><br>
                <input type="text" name="first_name" placeholder="First Name" value=""><br>
                <input type="text" name="last_name" placeholder="Last Name" value=""><br>
                <input type="password" name="password" placeholder="Password" value=""><br>

                <select name="role">
                    <option value="1">system admin</option>
                    <option value="2">regular user</option>
                    <option value="3">company admin</option>
                </select><br>

                Active:
                <input type="radio" id="yes" name="active[]" value="yes" required>
                <label for="yes">Yes</label>
                <input type="radio" id="no" name="active[]" value="no">
                <label for="no">No</label>
                <br>

                <input type="submit" value="Save">
                <input type="hidden" name="action" value="add">
            </form>
        </div>

        <div id="manageUser">
            <h1>Manage Users</h1>
            <table cellpadding="7" border="1">
                <tr>
                    <th>Email</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Edit</th>
                    <th>Delete</th>
                </tr>

                <c:forEach items="${users}" var="user">
                    <tr>
                        <td>${user.email}</td>
                        <td>${user.first_name}</td>
                        <td>${user.last_name}</td>
                        <td><a href="users?action=edit&selectedUser=${user.email}">Edit</a></td>
                        <td><a href="users?action=delete&deletedUser=${user.email}">Delete</a></td>
                    </tr>
                </c:forEach>

            </table>
        </div>

        <div id="editUser">
            <h1>Edit User</h1>

            <form action="" method="POST">
                <input type="text" name="first_nameUp" placeholder="First Name" value="${selectedUser.first_name}"><br>
                <input type="text" name="last_nameUp" placeholder="Last Name" value="${selectedUser.last_name}"><br>


                <select name="roleUp">
                    <option value="1"
                            <c:if test="${selectedUser.role == 1}">selected</c:if>
                                >system admin</option>
                            <option value="2"
                            <c:if test="${selectedUser.role == 2}">selected</c:if>
                                >regular user</option>
                            <option value="3"
                            <c:if test="${selectedUser.role == 3}">selected</c:if>
                                >company admin</option>
                    </select>
                    <br>

                    Active:
                    <input type="radio" id="yesUp" name="activeUp[]" value="yesUp"
                    <c:if test="${selectedUser.active == true}">checked</c:if>
                        >
                    <label for="yesUp">Yes</label>
                    <input type="radio" id="noUp" name="activeUp[]" value="noUp"
                    <c:if test="${selectedUser.active == false}">checked</c:if>
                    >
                <label for="noUp">No</label>
                <br>

                <input type="submit" value="Update">
                <input type="hidden" name="action" value="update">
            </form>

        </div>
    </body>
</html>
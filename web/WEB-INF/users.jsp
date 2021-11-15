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
                margin-right: 20px;
                display: inline-block;
                position: relative;
            }
            #manageUser {
                display: inline-block;
                position: absolute;
            }
            #editUser {
                margin-left: 550px;
                display: inline-block;
                position: absolute;
            }
        </style>
    </head>
    <body>
        <div id="addUser">
            <h1>Add User</h1>
            <form action="user" method="post">
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
                        <td>${user.firstName}</td>
                        <td>${user.lastName}</td>
                        <td><a href="user?action=edit&amp;email=${user.email}">Edit</a></td>
                        <td><a href="user?action=delete&amp;email=${user.email}">Delete</a></td>
                    </tr>
                </c:forEach>

            </table>
        </div>

        <div id="editUser">

            <h1>Edit User</h1>

            <form action="user" method="post">
                <c:if test="${editUser != null}">
                    <input type="hidden" name="editEmail" value="${editUser.email}"><br>
                    <input type="text" name="editFirstName" value="${editUser.firstName}"><br>
                    <input type="text" name="editLastName" value="${editUser.lastName}"><br>
                    <input type="password" name="editPassword" value="${editUser.password}"><br>

                    <select name="editRole">
                        <option value="1"
                                <c:if test="${editUser.role.roleId == 1}">selected</c:if>
                                    >system admin</option>
                                <option value="2"
                                <c:if test="${editUser.role.roleId == 2}">selected</c:if>
                                    >regular user</option>
                                <option value="3"
                                <c:if test="${editUser.role.roleId == 3}">selected</c:if>
                                    >company admin</option>
                        </select>
                        <br>

                        Active:
                        <input type="radio" id="yesUp" name="activeUp[]" value="yesUp"
                        <c:if test="${editUser.active == true}">checked</c:if>
                            >
                        <label for="yesUp">Yes</label>
                        <input type="radio" id="noUp" name="activeUp[]" value="noUp"
                        <c:if test="${editUser.active == false}">checked</c:if>
                            >
                        <label for="noUp">No</label>
                        <br>

                        <input type="hidden" name="action" value="update">
                        <input type="submit" value="Update">

                </c:if>
            </form>

        </div>
    </body>
</html>
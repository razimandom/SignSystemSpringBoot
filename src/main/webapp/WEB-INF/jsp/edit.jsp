<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head><title>SpringBoot</title>
    <style>
        table {
            font-family: arial, sans-serif;
            border-collapse: collapse;
            width: 100%;
        }
        td, th {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }
        tr:nth-child(even) {
            background-color: #dddddd;
        }
    </style>
</head>
<body>

<form method="post" action="/save">
    <input type="hidden" name="id" value="${lists.id}"/><br/>

<table>
    <tr><td>
        Requester Name:
    </td><td>
        <input type="text" name="req_name" value="${lists.req_name}"/>
    </td></tr>

    <tr><td>
        Signer Email:
    </td><td>
        <input type="text" name="sign_email" value="${lists.sign_email}" >
    </td></tr>

    <tr><td>
        Type:
    </td><td>
        <input type="text" name="doc_type" value="${lists.doc_type}" >
    </td></tr>

    <tr><td>
        Deadline:
    </td><td>
        <input type="text" name="doc_deadline" value="${lists.doc_deadline}" >
    </td></tr>
    <tr><td>
        Doc MD5:
    </td><td>
        Auto-generated
    </td></tr>
</table>
    <br><br>
    <input type="submit" value="Submit">
</form>
</body>
</html>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head><title>SpringBoot</title>
    <style>
        html {
            font-family: arial, sans-serif;
        }

        table {

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

<h1>Demonstration of Sign System using SpringBoot</h1>
<hr/>
<p><strong>Purpose:</strong> <br>Convert digital signature system from Liferay framework to Spring boot framework.<br>
    Target to implement GET, POST, PUT and DELETE. <br> Other function like generating MD5, encryption, decryption, digital signing,
    verification can be easily implement after understand SpringBoot architecture.</p>
<hr/>
<p>Actual digital signature system snapshot: <a href="http://gosign.razimandom.com/"><strong>View here</strong></a></p>
<hr/>
<h2>
    Menu:
    <a href="/">Upload Document</a> -
    <a href="/signdoc/">Sign Document</a> -
    <a href="/genkey/">Generate Key</a>
</h2>
<br>
<hr/>

<table><tr>
    <td>
        <h2>List of Pending Signature</h2>
        <table>
            <tr>
                <th>Req ID</th>
                <th>Req Name</th>
                <th>Signer Email</th>
                <th>Type</th>
                <th>Deadline</th>
                <th>MD5</th>
                <th>Status</th>
                <th>Action</th>
            </tr>
            <c:forEach var = "list" items = "${lists}">
                <tr>
                    <td>${list.id}</td>
                    <td>${list.req_name}</td>
                    <td>${list.sign_email}</td>
                    <td>${list.doc_type}</td>
                    <td>${list.doc_deadline}</td>
                    <td>${list.doc_md5}</td>
                    <td>${list.doc_status}</td>
                    <td>
                        <a href="/view/${list.id}">View</a>
                        <a href="/delete/${list.id}">Delete</a>
                        <a href="/edit/${list.id}">Edit</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </td>
</tr></table>

</body>
</html>
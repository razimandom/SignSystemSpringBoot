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
        <h2>List of Submitted Request</h2>
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
    <td>
        <h2>Submit Request</h2>
        <form method="post" action="/save">
            <input type="hidden" name="id" value=""/>
            <table>

                <tr><td>
                    Requester Name:
                </td><td>
                    <input type="text" name="req_name"/>
                </td></tr>

                <tr><td>
                    Signer Email:
                </td><td>
                    <input type="text" name="sign_email" >
                </td></tr>

                <tr><td>
                    Type:
                </td><td>
                    <input type="text" name="doc_type" >
                </td></tr>

                <tr><td>
                    Deadline:
                </td><td>
                    <input type="text" name="doc_deadline" >
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
    </td>
</tr></table>

</body>
</html>
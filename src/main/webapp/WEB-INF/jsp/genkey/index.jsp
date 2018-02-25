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
            white-space: nowrap;

        }

        td{
            font-size: 12px;
        }

        td div {
            white-space: normal;
            word-break: break-all;
            display: block;

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

<h2>Generate Key</h2>
<form method="post" action="/save">
    <input type="hidden" name="id" value=""/>
            Enter 6 pin: <input type="text" name="passphrase"/>

    <br><br>
    <input type="submit" value="Submit">
</form>

<hr/>
        <h2>Generated Keys</h2>
        <table width="100px">
            <tr>
                <th>Key ID</th>
                <th>Private Key</th>
                <th>Public Key</th>
                <th>Salt</th>
                <th>Vector</th>
                <th>Action</th>
            </tr>
            <c:forEach var = "list" items = "${lists}">
                <tr>
                    <td>${list.id}</td>
                    <td>${list.privatekey_data}</td>
                    <td>${list.publickey_data}</td>
                    <td>${list.salt_data}</td>
                    <td>${list.vector_data}</td>
                    <td>
                        <a href="/view/${list.id}">View</a>
                        <a href="/delete/${list.id}">Delete</a>
                        <a href="/edit/${list.id}">Edit</a>
                    </td>
                </tr>
            </c:forEach>
        </table>

</body>
</html>
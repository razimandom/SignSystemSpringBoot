<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head><title>SpringBoot</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <title>SpringBoot</title>
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

        .container-footer {
            padding: 30px 50px;
            margin-top: 50px;
            background-image: linear-gradient(to top, #2c2929 0%, #313130 100%);
            color: #FFF;
        }

        .container-header {
            padding: 30px 50px;
            margin-bottom: 50px;
            background-image: linear-gradient(to top, #2c2929 0%, #313130 100%);
            color: #FFF;
        }

    </style>
</head>

<header class="container-header text-center bg-black">Prepared by Raziman for interview purposes</header>

<body>

<div class="container gallery-container">

    <nav class="navbar navbar-inverse">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="#">Standard Chartered Interview</a>
            </div>
            <ul class="nav navbar-nav">
                <li ><a href="/">Upload Document</a></li>
                <li><a href="/signdoc/">Sign Document</a></li>
                <li class="active"><a href="/genkey/">Generate Key</a></li>
            </ul>
        </div>
    </nav>

<h3>Demonstration of Sign System using SpringBoot</h3>
    <div class="alert alert-success">
<p><strong>Purpose:</strong> <br>Convert digital signature system from Liferay framework to Spring boot framework.<br>
    Target to implement GET, POST, PUT and DELETE. <br> Other function like generating MD5, encryption, decryption, digital signing,
    verification can be easily implement after understand SpringBoot architecture.</p>
<p>Actual digital signature system snapshot: <a href="http://gosign.razimandom.com/"><strong>View here</strong></a></p>
    </div>

<h3>Generate Key</h3>
<form method="post" action="/genkey/generate">
    <input type="hidden" name="id" value=""/>
            Enter 6 pin: <input type="text" name="passphrase"/> <input class="btn btn-success" type="submit" value="Submit">

</form>

<hr/>
        <h3>Generated Keys</h3>
        <table width="100px">
            <tr>
                <th>Key ID</th>
                <th>Private Key</th>
                <th>Public Key</th>
                <th>Salt</th>
                <th>Vector</th>
            </tr>
            <c:forEach var = "list" items = "${lists}">
                <tr>
                    <td>${list.id}</td>
                    <td>${list.privatekey_data}</td>
                    <td>${list.publickey_data}</td>
                    <td>${list.salt_data}</td>
                    <td>${list.vector_data}</td>
                </tr>
            </c:forEach>
        </table>

</div>
</body>

<footer class="container-footer text-center bg-black">Prepared by Raziman for interview purposes</footer>

</html>
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

    <h2>Sign Document</h2>
    Not available
</div>
</body>

<footer class="container-footer text-center bg-black">Prepared by Raziman for interview purposes</footer>

</html>
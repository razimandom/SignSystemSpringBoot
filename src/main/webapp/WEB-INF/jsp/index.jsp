<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>

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
                <li class="active"><a href="/">Upload Document</a></li>
                <li><a href="/signdoc/">Sign Document</a></li>
                <li ><a href="/genkey/">Generate Key</a></li>
            </ul>
        </div>
    </nav>


    <h3 class="text-center">Demonstration of Sign System using SpringBoot</h3>
    <div class="alert alert-success">
        <p><strong>Purpose:</strong> <br>Convert digital signature system from Liferay framework to Spring boot framework.<br>
            Target to implement GET, POST, PUT and DELETE. <br> Other function like generating MD5, encryption, decryption, digital signing,
            verification can be easily implement after understand SpringBoot architecture.</p>
        <p>Actual digital signature system snapshot: <a href="http://gosign.razimandom.com/"><strong>View here</strong></a></p>
    </div>

    <div class="alert alert-info">
        <p><strong>Task:</strong> <br>
            Create data: Done<br>
            View data: Done<br>
            Edit: Done<br>
            Delete data: Done<br>
            Generate Key: Done (Public & Private) <br>
            Generate MD5: Done <br>
            Sign document: In progress <br>
            Verify document: In progress <br>
            Apply bootstrap 4: Done
        </p>
    </div>

        <h3>List of Submitted Request</h3>
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

                        <a href="/view/${list.id}" data-toggle="tooltip" title="View request"><span
                                class="glyphicon glyphicon-folder-open text-primary"></span></a>
                        &nbsp;
                        <a href="/edit/${list.id}" data-toggle="tooltip" title="Edit request"><span
                            class="glyphicon glyphicon-wrench text-primary"></span></a>
                        &nbsp;
                        <a href="/delete/${list.id}" data-toggle="tooltip" title="Delete"
                           onclick="return confirm('Are you sure you want to delete this request?')"><span
                                class="glyphicon glyphicon-remove text-danger"></span></a>
                        &nbsp;
                        <a href="/sign/${list.id}" data-toggle="modal" data-target="#myModal" title="Sign request"><span
                                class="glyphicon glyphicon-pencil text-success"></span></a>


                    </td>
                </tr>
            </c:forEach>
        </table>

    <h3>Submit Request</h3>
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
                Doc MD5 (Fingerprint):
            </td><td>
                Auto-generated
            </td></tr>
        </table>
        <br>
        <input class="btn btn-success" type="submit" value="Submit Request">
    </form>

</div>

<!-- The Modal -->
<div class="modal fade" id="myModal">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">Sign Document</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <!-- Modal body -->
            <div class="modal-body">
                <form method="post" action="/sign">
                <table>
                    <tr>
                        <td>
                            Enter 6 pin: <input type="text" name="passphrase"/>
                        </td>
                        <td>
                            <input class="btn btn-success" type="submit" value="Sign">
                        </td>
                    </tr>
                </table>
                </form>
            </div>

            <!-- Modal footer -->
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>

        </div>
    </div>
</div>

</body>

<footer class="container-footer text-center bg-black">Prepared by Raziman for interview purposes</footer>


</html>
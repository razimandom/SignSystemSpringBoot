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

<h2>Request Details</h2>
<table>
    <tr>
        <td width="250">Request ID:</td>
        <td>${lists.id}</td>
    </tr>
    <tr>
        <td>
            Requester Email
        </td>
        <td>
            ${lists.req_email}
        </td>
    </tr>
    <tr>
        <td>
            Requester Name
        </td>
        <td>
            ${lists.req_name}
        </td>
    </tr>
    <tr>
        <td>Signer Email
        </td>
        <td>
            ${lists.sign_email}
        </td>
    </tr>
    <tr>
        <td>
            Signer Name
        </td>
        <td>
            ${lists.sign_name}
        </td>
    </tr>
    <tr>
        <td>Request Title:</td>
        <td>${lists.doc_title}</td>
    </tr>
    <tr>
        <td>Type:</td>
        <td>${lists.doc_type}</td>
    </tr>
    <tr>
        <td>
            Document MD5
        </td>
        <td>
            ${lists.doc_md5}
        </td>
    </tr>
    <tr>
        <td>
            Request Status
        </td>
        <td>
            ${lists.doc_status}
        </td>
    </tr>
    <tr>
        <td>Deadline:</td>
        <td>${lists.doc_deadline}</td>
    </tr>
    <tr>
        <td>Signature:</td>
        <td>${lists.doc_signature}</td>
    </tr>
    <tr>
        <td>Date Created:</td>
        <td>${lists.req_date_created}</td>
    </tr>
    <tr>
        <td>Date Modified:</td>
        <td>${lists.req_date_modified}</td>
    </tr>
    <tr>
        <td>
            Time Created:
        </td>
        <td>
            ${lists.req_time_created}
        </td>
    </tr>
</table>

</body>
</html>
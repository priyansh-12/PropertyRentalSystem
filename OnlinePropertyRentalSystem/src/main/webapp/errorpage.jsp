<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error Page</title>
    <link rel="stylesheet" type="text/css" href="CSS/errorCss.css">
</head>
<body>
    <div class="error_div">
      <h1>Something Wrong has Happened</h1>
      <h2>Reasons of Error</h2>
      <h3>1.wrong input given in a place</h3>
      <h3>2.Not given input</h3>
    </div>
    <%= exception %> 
</body>
</html>
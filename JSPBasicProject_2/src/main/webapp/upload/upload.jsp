<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>파일 업로드</title>
</head>
<body>
    <h2>파일 업로드</h2>
    <!-- 파일 업로드를 위해 enctype="multipart/form-data" 필수 -->
    <form action="../FileUploadServlet" method="post" enctype="multipart/form-data">
        <label for="uploader">업로더:</label><br>
        <input type="text" id="uploader" name="uploader"><br><br>
        
        <label for="file">업로드할 파일:</label><br>
        <input type="file" id="file" name="file"><br><br>
        
        <input type="submit" value="업로드">
    </form>
</body>
</html>
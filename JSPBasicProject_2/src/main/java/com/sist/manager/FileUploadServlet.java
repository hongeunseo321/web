package com.sist.manager;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.IOException;

@WebServlet("/FileUploadServlet")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024, // 1MB까지는 메모리에 저장
    maxFileSize = 1024 * 1024 * 5,   // 최대 5MB까지 업로드 허용
    maxRequestSize = 1024 * 1024 * 10 // 전체 요청 크기 10MB까지 허용
)
public class FileUploadServlet extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // 파일을 저장할 경로 설정 (웹 애플리케이션 외부 경로를 사용하는 것이 권장됨)
        String uploadPath = "c:\\upload";//getServletContext().getRealPath("/") + "uploads";
        
        // 업로드 경로가 존재하지 않으면 생성
        java.io.File uploadDir = new java.io.File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }
        
        try {
            // "file"이라는 이름의 파트 가져오기
            Part filePart = request.getPart("file");
            String fileName = filePart.getSubmittedFileName();
            
            // 파일 저장
            filePart.write(uploadPath + java.io.File.separator + fileName);
            
            // 다른 폼 데이터 가져오기
            String uploader = request.getParameter("uploader");
            
            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().println("<h1>파일 업로드 성공!</h1>");
            response.getWriter().println("<p>업로더: " + uploader + "</p>");
            response.getWriter().println("<p>파일명: " + fileName + "</p>");
            response.getWriter().println("<p>저장 경로: " + uploadPath + "</p>");
            
        } catch (Exception e) {
            response.getWriter().println("파일 업로드 실패: " + e.getMessage());
            e.printStackTrace();
        }
    }
}
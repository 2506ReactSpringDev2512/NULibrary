package com.library.model.vo;

import java.sql.Timestamp;

/**
 * 공지사항 정보를 담는 VO (Value Object) 클래스
 * NOTICE_TBL 테이블과 매핑
 */
public class NoticeVO {
    
    private int noticeNo;           // NOTICE_NO - 공지사항 번호 (PK)
    private String noticeSubject;   // NOTICE_SUBJECT - 공지사항 제목
    private String noticeContent;   // NOTICE_CONTENT - 공지사항 내용
    private String noticeWriter;    // NOTICE_WRITER - 작성자 (FK)
    private Timestamp noticeDate;   // NOTICE_DATE - 작성일
    private int viewCount;          // VIEW_COUNT - 조회수
    
    // 기본 생성자
    public NoticeVO() {
        super();
    }
    
    // 모든 필드를 받는 생성자
    public NoticeVO(int noticeNo, String noticeSubject, String noticeContent, 
                   String noticeWriter, Timestamp noticeDate, int viewCount) {
        super();
        this.noticeNo = noticeNo;
        this.noticeSubject = noticeSubject;
        this.noticeContent = noticeContent;
        this.noticeWriter = noticeWriter;
        this.noticeDate = noticeDate;
        this.viewCount = viewCount;
    }
    
    // 공지사항 작성용 생성자 (번호, 작성일, 조회수 제외)
    public NoticeVO(String noticeSubject, String noticeContent, String noticeWriter) {
        super();
        this.noticeSubject = noticeSubject;
        this.noticeContent = noticeContent;
        this.noticeWriter = noticeWriter;
    }
    
    // Getter & Setter 메소드들
    public int getNoticeNo() {
        return noticeNo;
    }
    
    public void setNoticeNo(int noticeNo) {
        this.noticeNo = noticeNo;
    }
    
    public String getNoticeSubject() {
        return noticeSubject;
    }
    
    public void setNoticeSubject(String noticeSubject) {
        this.noticeSubject = noticeSubject;
    }
    
    public String getNoticeContent() {
        return noticeContent;
    }
    
    public void setNoticeContent(String noticeContent) {
        this.noticeContent = noticeContent;
    }
    
    public String getNoticeWriter() {
        return noticeWriter;
    }
    
    public void setNoticeWriter(String noticeWriter) {
        this.noticeWriter = noticeWriter;
    }
    
    public Timestamp getNoticeDate() {
        return noticeDate;
    }
    
    public void setNoticeDate(Timestamp noticeDate) {
        this.noticeDate = noticeDate;
    }
    
    public int getViewCount() {
        return viewCount;
    }
    
    public void setViewCount(int viewCount) {
        this.viewCount = viewCount;
    }
    
    // 날짜 포맷팅 메소드 (yyyy-MM-dd 형식)
    public String getFormattedDate() {
        if (noticeDate != null) {
            return noticeDate.toString().substring(0, 10);
        }
        return "";
    }
    
    // 날짜 포맷팅 메소드 (MM-dd 형식 - 메인페이지용)
    public String getShortDate() {
        if (noticeDate != null) {
            String dateStr = noticeDate.toString().substring(5, 10); // MM-dd
            return dateStr;
        }
        return "";
    }
    
    // 제목 길이 제한 메소드 (메인페이지 위젯용)
    public String getShortSubject(int maxLength) {
        if (noticeSubject != null && noticeSubject.length() > maxLength) {
            return noticeSubject.substring(0, maxLength) + "...";
        }
        return noticeSubject;
    }
    
    // 내용 HTML 개행 처리 메소드
    public String getFormattedContent() {
        if (noticeContent != null) {
            return noticeContent.replaceAll("\n", "<br>");
        }
        return "";
    }
    
    // toString 메소드 (디버깅용)
    @Override
    public String toString() {
        return "NoticeVO [noticeNo=" + noticeNo + 
               ", noticeSubject=" + noticeSubject + 
               ", noticeWriter=" + noticeWriter + 
               ", noticeDate=" + noticeDate + 
               ", viewCount=" + viewCount + "]";
    }
    
    // equals 메소드 (번호 기준 비교)
    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;
        if (obj == null) return false;
        if (getClass() != obj.getClass()) return false;
        
        NoticeVO other = (NoticeVO) obj;
        return noticeNo == other.noticeNo;
    }
    
    // hashCode 메소드
    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + noticeNo;
        return result;
    }
    public String getShortSubjectForMain() {
        if (noticeSubject != null && noticeSubject.length() > 15) {
            return noticeSubject.substring(0, 15) + "...";
        }
        return noticeSubject;
    }
}
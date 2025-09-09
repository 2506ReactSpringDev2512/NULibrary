package com.library.model.vo;

import java.sql.Date;

public class LendInfoVO {
    private String mId;              // M_ID - 회원ID
    private String bookNo;           // BOOK_NO - 도서번호
    private Date lendDate;           // LEND_DATE - 대여일
    private Date returnDate;         // RETURN_DATE - 반납예정일
    
    // JOIN으로 가져올 추가 정보들
    private String memberName;       // 회원명 (MEMBER_TBL에서)
    private String bookName;         // 도서명 (BOOK_TBL에서)
    private String bookAuthor;       // 저자 (BOOK_TBL에서)
    private String bookPublisher;    // 출판사 (BOOK_TBL에서)
    private Date actualReturnDate;   // 실제반납일 (반납완료시)
    private boolean isOverdue;       // 연체여부

    public LendInfoVO() {}

    public LendInfoVO(String mId, String bookNo, Date lendDate, Date returnDate) {
        this.mId = mId;
        this.bookNo = bookNo;
        this.lendDate = lendDate;
        this.returnDate = returnDate;
    }

    // Getter & Setter
    public String getMId() { return mId; }
    public void setMId(String mId) { this.mId = mId; }

    public String getBookNo() { return bookNo; }
    public void setBookNo(String bookNo) { this.bookNo = bookNo; }

    public Date getLendDate() { return lendDate; }
    public void setLendDate(Date lendDate) { this.lendDate = lendDate; }

    public Date getReturnDate() { return returnDate; }
    public void setReturnDate(Date returnDate) { this.returnDate = returnDate; }

    public String getMemberName() { return memberName; }
    public void setMemberName(String memberName) { this.memberName = memberName; }

    public String getBookName() { return bookName; }
    public void setBookName(String bookName) { this.bookName = bookName; }

    public String getBookAuthor() { return bookAuthor; }
    public void setBookAuthor(String bookAuthor) { this.bookAuthor = bookAuthor; }

    public String getBookPublisher() { return bookPublisher; }
    public void setBookPublisher(String bookPublisher) { this.bookPublisher = bookPublisher; }

    public Date getActualReturnDate() { return actualReturnDate; }
    public void setActualReturnDate(Date actualReturnDate) { this.actualReturnDate = actualReturnDate; }

    public boolean getIsOverdue() { return isOverdue; }
    public void setIsOverdue(boolean isOverdue) { this.isOverdue = isOverdue; }

    @Override
    public String toString() {
        return "LendInfoVO [mId=" + mId + ", bookNo=" + bookNo + 
               ", lendDate=" + lendDate + ", returnDate=" + returnDate + 
               ", memberName=" + memberName + ", bookName=" + bookName + 
               ", bookAuthor=" + bookAuthor + ", isOverdue=" + isOverdue + "]";
    }
}
package com.library.model.vo;

public class BookVO {
    private String bookNo;       // BOOK_NO
    private String bookName;     // BOOK_NAME
    private String bookAuthor;   // BOOK_AUTHOR
    private String bookPublisher;// BOOK_PUBLISHER
    private String bookCategory; // BOOK_CATEGORY
    private String lendYn;       // LEND_YN
    private char isPopular;      // IS_POPULAR
    private char isNew;          // IS_NEW
    private String bookDescription; // BOOK_DESCRIPTION

    public BookVO() {}

    public BookVO(String bookNo, String bookName, String bookAuthor,
                  String bookPublisher, String bookCategory, String lendYn, char isPopular, char isNew) {
        this.bookNo = bookNo;
        this.bookName = bookName;
        this.bookAuthor = bookAuthor;
        this.bookPublisher = bookPublisher;
        this.bookCategory = bookCategory;
        this.lendYn = lendYn;
        this.isPopular = isPopular;
        this.isNew = isNew;
    }

    public String getBookNo() { return bookNo; }
    public void setBookNo(String bookNo) { this.bookNo = bookNo; }

    public String getBookName() { return bookName; }
    public void setBookName(String bookName) { this.bookName = bookName; }

    public String getBookAuthor() { return bookAuthor; }
    public void setBookAuthor(String bookAuthor) { this.bookAuthor = bookAuthor; }

    public String getBookPublisher() { return bookPublisher; }
    public void setBookPublisher(String bookPublisher) { this.bookPublisher = bookPublisher; }

    public String getBookCategory() { return bookCategory; }
    public void setBookCategory(String bookCategory) { this.bookCategory = bookCategory; }

    public String getLendYn() { return lendYn; }
    public void setLendYn(String lendYn) { this.lendYn = lendYn; }

    public char getIsPopular() { return isPopular; }
    public void setIsPopular(char isPopular) { this.isPopular = isPopular; }

    public char getIsNew() { return isNew; }
    public void setIsNew(char isNew) { this.isNew = isNew; }

    public String getBookDescription() { return bookDescription; }
    public void setBookDescription(String bookDescription) { this.bookDescription = bookDescription; }

	@Override
    public String toString() {
        return "BookVO [bookNo=" + bookNo + ", bookName=" + bookName +
               ", bookAuthor=" + bookAuthor + ", bookPublisher=" + bookPublisher +
               ", bookCategory=" + bookCategory + ", lendYn=" + lendYn + 
               ", isPopular=" + isPopular + ", isNew=" + isNew + "]";
    }
}
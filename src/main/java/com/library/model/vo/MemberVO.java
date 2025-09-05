package com.library.model.vo;

/**
 * 회원 정보를 담는 VO (Value Object) 클래스
 * MEMBER_TBL 테이블과 매핑
 */
public class MemberVO {
    
    private String memberId;     // MEMBER_ID - 회원 아이디 (PK)
    private String memberPw;     // MEMBER_PW - 회원 비밀번호
    private String memberName;   // MEMBER_NAME - 회원 이름
    private String memberPhone;  // MEMBER_PHONE - 회원 전화번호
    private String memberGender; // MEMBER_GENDER - 회원 성별 (M/F)
    private int memberAge;       // MEMBER_AGE - 회원 나이
    private String adminYn;      // ADMIN_YN - 관리자 여부 (Y/N)
    
    // 기본 생성자
    public MemberVO() {
        super();
    }
    
    // 모든 필드를 받는 생성자
    public MemberVO(String memberId, String memberPw, String memberName, 
                   String memberPhone, String memberGender, int memberAge, String adminYn) {
        super();
        this.memberId = memberId;
        this.memberPw = memberPw;
        this.memberName = memberName;
        this.memberPhone = memberPhone;
        this.memberGender = memberGender;
        this.memberAge = memberAge;
        this.adminYn = adminYn;
    }
    
    // 로그인용 생성자 (아이디, 비밀번호만)
    public MemberVO(String memberId, String memberPw) {
        super();
        this.memberId = memberId;
        this.memberPw = memberPw;
    }
    
    // 회원가입용 생성자 (관리자 여부 제외)
    public MemberVO(String memberId, String memberPw, String memberName, 
                   String memberPhone, String memberGender, int memberAge) {
        super();
        this.memberId = memberId;
        this.memberPw = memberPw;
        this.memberName = memberName;
        this.memberPhone = memberPhone;
        this.memberGender = memberGender;
        this.memberAge = memberAge;
        this.adminYn = "N"; // 기본값: 일반 회원
    }
    
    // Getter & Setter 메소드들
    public String getMemberId() {
        return memberId;
    }
    
    public void setMemberId(String memberId) {
        this.memberId = memberId;
    }
    
    public String getMemberPw() {
        return memberPw;
    }
    
    public void setMemberPw(String memberPw) {
        this.memberPw = memberPw;
    }
    
    public String getMemberName() {
        return memberName;
    }
    
    public void setMemberName(String memberName) {
        this.memberName = memberName;
    }
    
    public String getMemberPhone() {
        return memberPhone;
    }
    
    public void setMemberPhone(String memberPhone) {
        this.memberPhone = memberPhone;
    }
    
    public String getMemberGender() {
        return memberGender;
    }
    
    public void setMemberGender(String memberGender) {
        this.memberGender = memberGender;
    }
    
    public int getMemberAge() {
        return memberAge;
    }
    
    public void setMemberAge(int memberAge) {
        this.memberAge = memberAge;
    }
    
    public String getAdminYn() {
        return adminYn;
    }
    
    public void setAdminYn(String adminYn) {
        this.adminYn = adminYn;
    }
    
    // 관리자 여부 확인 메소드
    public boolean isAdmin() {
        return "Y".equals(this.adminYn);
    }
    
    // 성별 한글 반환 메소드
    public String getGenderKorean() {
        if ("M".equals(this.memberGender)) {
            return "남성";
        } else if ("F".equals(this.memberGender)) {
            return "여성";
        }
        return "기타";
    }
    
    // 전화번호 포맷팅 메소드 (01012345678 → 010-1234-5678)
    public String getFormattedPhone() {
        if (memberPhone != null && memberPhone.length() == 11) {
            return memberPhone.substring(0, 3) + "-" + 
                   memberPhone.substring(3, 7) + "-" + 
                   memberPhone.substring(7);
        }
        return memberPhone;
    }
    
    // toString 메소드 (디버깅용)
    @Override
    public String toString() {
        return "MemberVO [memberId=" + memberId + 
               ", memberName=" + memberName + 
               ", memberPhone=" + memberPhone + 
               ", memberGender=" + memberGender + 
               ", memberAge=" + memberAge + 
               ", adminYn=" + adminYn + "]";
    }
    
    // equals 메소드 (아이디 기준 비교)
    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;
        if (obj == null) return false;
        if (getClass() != obj.getClass()) return false;
        
        MemberVO other = (MemberVO) obj;
        if (memberId == null) {
            if (other.memberId != null) return false;
        } else if (!memberId.equals(other.memberId)) {
            return false;
        }
        return true;
    }
    
    // hashCode 메소드
    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((memberId == null) ? 0 : memberId.hashCode());
        return result;
    }
}
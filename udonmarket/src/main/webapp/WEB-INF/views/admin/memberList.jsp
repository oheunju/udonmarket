<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"  %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
	
<%-- 	한글 인코딩 처리 --%>
<fmt:requestEncoding value="utf-8"/>	
	
	<jsp:include page="/WEB-INF/views/common/header.jsp">
		<jsp:param value="회원관리" name="pageTitle"/>
	</jsp:include>



<style>
a {
	text-decoration: none;
	color: black;
}
</style>

    <!--================Home Banner Area =================-->
    <!-- breadcrumb start-->
	<section class="breadcrumb breadcrumb_bg">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="breadcrumb_iner">
                        <div class="breadcrumb_iner_item">
                            <h2>관리자용 페이지</h2>
							<!-- <h3>서울 강남구 논현동</h3> -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
	
		<!--================ 사이드바 =================-->	
    <section class="cat_product_area section_padding">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="left_sidebar_area">
                        <aside class="left_widgets p_filter_widgets">
                            <div class="l_w_title">
                                <h3>관리자 메뉴</h3>
                            </div>
                            <div class="widgets_inner">
                                <ul class="list">
                                    <li><a href="${pageContext.request.contextPath }/admin/memberList">회원 조회 / 등록 / 삭제</a></li>
                                    <li><a href="${pageContext.request.contextPath }/admin/declareMemberList">신고 관리(사용자)</a></li>
									<li><a href="${pageContext.request.contextPath }/admin/declareBoardList">신고 관리(동네생활)</a></li>
									<li><a href="${pageContext.request.contextPath }/admin/declareProductList">신고 관리(중고거래)</a></li>
									<li><a href="${pageContext.request.contextPath }/admin/declareReplyList">신고 관리(댓글)</a></li>
									<li><a href="${pageContext.request.contextPath }/admin/CouponList">쿠폰 관리</a></li>
                                </ul>
                            </div>
                        </aside>
                    </div>
                </div>
 			<div class="col-lg-9"> 
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="product_top_bar d-flex justify-content-between align-items-center">
                                <div class="single_product_menu">
                                    <p><span>${totalContents }</span>명 의 회원</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row align-items-center latest_product_inner">
                        <div class="col-lg-4 col-sm-6">
                            <div class="single_product_item">
                            	<form:form id="adminMemberSignupFrm" action="adminMemberEnroll" method="post">
                            		<table id="tbl-member" class="table table-striped table-hover">
										<tr>
											<th>아이디</th>
											<th>이메일</th>
											<th>닉네임</th>
											<th>가입날짜</th>
											<th>삭제여부</th>
										</tr>
										<c:forEach items="${ list }" var="member">
											<tr>
												<td>${ member.userId }</td>
												<td>${ member.email }</td>
												<td>${ member.nickName }</td>
												<td><fmt:formatDate value="${ member.regDate }" type="both"/></td>
												<td><button type="button" class="btn btn-outline-danger" onclick="adminMemberQuit('${ member.userId }')">탈퇴</button></td>
											</tr>
										</c:forEach>
										<tr>
											<td>
												<input type="text" class="input-field1" name="userId" id="userId" placeholder="아이디" />
											</td>
											<td>
												<input type="password" class="input-field1" name="password" id="password" placeholder="패스워드" />											
											</td>
											<td>
												<input type="email" class="input-field1" name="email" id="email" placeholder="이메일" />
											</td>
											<td>
												<input type="text" class="input-field1" name="nickName" id="nickName" placeholder="닉네임" />
											</td>
											<td>
												<input type="submit" value="회원등록" />
											</td>
										</tr>
									</table>
							</form:form>
                            </div>
                        </div>
                        <!-- 페이징처리 -->
						<div class="col-lg-12">
	                        <div class="pageination">
	                            <nav aria-label="Page navigation example">
	                                <ul class="pagination justify-content-center">
	                                    ${pageBar }
	                                </ul>
	                            </nav>
	                        </div>
	                    </div>
						<!-- 페이징처리 -->
					</div>
                </div>
            </div>
        </div>
	</section>
<!-- 	quit_yn == y로 수정 해야 함. -->
	<form:form id="adminMemberQuitFrm" action="adminMemberQuit" method="post">
		<input type="hidden" name="userId" />
	</form:form>
	<script>
	function adminMemberQuit(userId){
		if(confirm("정말 탈퇴하시겠습니까?") == false) {
			return;
		}
		var $frm = $("#adminMemberQuitFrm");
		$frm.find("[name=userId]").val(userId);
		$frm.submit();
	}

	</script>
	





		
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
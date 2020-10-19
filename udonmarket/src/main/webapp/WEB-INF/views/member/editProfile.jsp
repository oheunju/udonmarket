<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<fmt:requestEncoding value="utf-8"/>


<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="마이페이지" name="pageTitle"/>
</jsp:include>
<!-- mypage css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/mypage.css">

<style>
a{text-decoration: none; color: black;}
</style>

    <!--================Home Banner Area =================-->
    <!-- breadcrumb start-->
	<section class="breadcrumb" style="background-color : #ecfdff;">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="breadcrumb_iner">
                        <div class="breadcrumb_iner_item">
                            <h2 style="display: inline-block;">MYPAGE</h2>
					       <img src="${pageContext.request.contextPath }/resources/img/banner/mypage3.png" 
			                                    	 alt="" 
			                                    	 style="max-width: 590px;position: relative; left: 115px;">  	 
                        </div>
                    </div>
                </div>
            </div>
         </div>
    </section>
    <!-- breadcrumb start-->
    
    
    
    <sec:authentication property="principal" var="loggedInUser" />
    <div class="row py-5 px-4">
	    <div class="col-md-5 mx-auto">
	        <!-- Profile widget -->
	       <form action="${pageContext.request.contextPath }/member/nickUpdate?userId=${member.userId}" method="post" enctype="multipart/form-data">
	       <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	       
	        <div class="bg-white shadow rounded overflow-hidden">
	            <div class="px-4 pt-0 pb-4 cover">
	            <div class="d-flex justify-content-center">
	                <div class="media align-items-end profile-head">
	                    <div class="profile mr-3">
	                    <img src="${pageContext.request.contextPath }/resources/img/member/${member.originalFileName}" 
	                    		 alt="..." 
	                    		 width="130" 
	                    		 class="rounded mb-2 img-thumbnail">
	                </div>
	                </div>
	            </div>
	            </div>
	            <div>
	             <input type="file" id = "originalFileName" class="btn btn-outline-dark btn-sm btn-block"/>
	            </div>
	            <div class="bg-light p-5 d-flex justify-content-end text-center">
	            </div>
	            <div class="px-4 py-3">
	                <div class="p-4 rounded shadow-sm bg-light">
				        <!-- Vertical Menu-->
				        <nav class="nav flex-column bg-white shadow-sm rounded p-3">
						  <div class="form-row">
						    <div class="col">
						      <input type="text" name="nickName" class="form-control" value="${member.nickName}">
						    </div>
						  </div>
				        </nav>
	                </div>
	                <button style="margin:10px auto;" type="submit" class="btn btn-dark">적용</button>
	                </form>
	            </div>
	        </div>
	    </div>
	</div>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    
    

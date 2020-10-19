package com.kh.udon.product.model.service;

import java.util.List;
import java.util.Map;

import com.kh.udon.common.model.vo.PageInfo;
import com.kh.udon.community.model.vo.Report;
import com.kh.udon.member.model.vo.Wish;
import com.kh.udon.product.model.vo.CategoryVO;
import com.kh.udon.product.model.vo.CouponDTO;
import com.kh.udon.product.model.vo.Evaluation;
import com.kh.udon.product.model.vo.ProductDTO;
import com.kh.udon.product.model.vo.ProductPhotoVO;
import com.kh.udon.product.model.vo.ProductVO;
import com.kh.udon.product.model.vo.ReasonReportVO;
import com.kh.udon.product.model.vo.ReportVO;
import com.kh.udon.product.model.vo.ReviewDTO;
import com.kh.udon.product.model.vo.SellerDTO;

public interface ProductService
{

    List<CategoryVO> selectAllCategory();

    List<Integer> selectAllCategoryCount(String userId);

    int selectTotalCount(String userId);

    int selectCategoryCount(Map<String, Object> map);

    CouponDTO selectCoupon(String userId);

    int insert(ProductVO product);

    List<ProductDTO> selectCategoryProducts(Map<String, Object> map, PageInfo pi);

    int addToWish(Wish wish);

    List<ProductDTO> search(Map<String, Object> map, PageInfo pi);

    int selectSearchCount(Map<String, Object> map);

    ProductDTO selectDTOByPCode(int pCode);

    SellerDTO selectSeller(String id);

    int changeStatus(Map<String, Object> map);

    ProductVO selectVOByPCode(int pCode);

    int update(Map<String, Object> map);

    int delete(int pCode);

    int pull(int pCode);

    int pull(Map<String, Object> param);

    List<ProductVO> selectSimilarProducts(Map<String, Object> map);

    List<ProductVO> selectOtherProducts(Map<String, Object> map);

    List<ReasonReportVO> selectReasonReport();

    List<ReasonReportVO> selectReportListByRCode(int reasonCode);

    int reportProduct(ReportVO report);

    int reportUser(ReportVO report);
	
	List<String> selectWishUserId(int pCode);

    int insert(ProductPhotoVO photoDTO);

    int updateProductCode(Map<String, Object> map);

    void deleteFile(String uuid);

    List<ProductPhotoVO> selectPhotos(int pCode);

    ProductPhotoVO selectFile(ProductPhotoVO photo);

	List<Report> selectProductList(int limit, int offset);

    List<String> selectBuyer(Map<String, Object> map);

    List<Evaluation> selectEvaList(int kind);

    int insertReview(ReviewDTO review);

    List<ProductDTO> selectAll(PageInfo pi, String userId);

    List<Evaluation> selectEvaListforBuyer(int kind);

    int insertReviewByBuyer(ReviewDTO review);

    String reviewISent(int reviewCode);

    List<ProductDTO> oneToTen();

    List<ProductDTO> elevenToTwenty();

    int hide(int pCode);

    List<ProductDTO> popular(String userId);








}

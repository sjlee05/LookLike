
# LookLike Shop
> Spring Framework를 사용한 쇼핑몰 웹 프로젝트입니다.   

<br>

## 1. 제작 기간 & 참여 인원
+ 개발 기간: 2023.06.16 ~ 2023.07.11 (약 4주)
+ 참여 인원: Backend 5명

<br>

## 2. 사용기술

#### `Back-end`
+ Java 8
+ Spring Framework 5.0.7
+ Maven 2.5.1
+ MyBatis 3.2.8
+ Oracle

#### `Front-end`
+ JQuery 3.1.1
+ Bootstrap

<br>

## 2-1. 담당 구현 파트
 + 프로젝트 개발환경 구축, 설계 참여
 +  ERD 설계 및 DB구현
 + 상품등록 페이지 구현(이미지 업로드 및 수정, 삭제)
 + 공지사항 페이지 구현(관리자 작성, 페이징, 주제별 검색)
 + 리뷰 페이지 구현 (답변 가능, 별점 등록, 주문 상태에 따른 리뷰 작성
    , 평점 계산 후 메인페이지 노출)
 +  Q&A 페이지 구현(답변 가능, 상품별 조회)
 + 주문내역조회 페이지 구현(기간 조회, 주문자 정보 및 배송 상태 변경, 환불 처리)

<br>

## 3. ERD 설계
<img src="https://github.com/sjlee05/LookLike/assets/136719054/8b054a29-4f83-4cc0-a14c-acc710b9549d.png" width="900px"/>

<br>

## 4. 시연 영상



<br>

## 5. 기능


### [ 상품 관리 ]   

<img src = "https://github.com/sjlee05/LookLike/assets/136719054/62356147-654b-4871-995b-9f760bae8fe7.png" width ="900px"/>

- [X] **상품의 CRUD**
  <details>
   <summary> 상품 CRUD 설명 펼치기:pushpin: </summary>
   
   <br>
  
   **[ 기능 설명 ]**    
    * 이미지 업로드 Controller를 만들어 이미지를 서버에 저장할 수 있게 구성.
    *  상품을 등록할 때 모든 이미지는 다중 업로드 처리를 했습니다.
    *  상품 이미지 업로드 시 DataBase Product테이블에 자동으로 썸네일 이미지, 모든 이미지가 각각의 컬럼에 추가됩니다. 
    *  이미지 수정 및 삭제 시 ajax로 개별 삭제 처리가 가능합니다.

    


   **[ 상세 구조 ]**
   
   <img src = "https://github.com/sjlee05/LookLike/assets/136719054/1268a438-37df-48b7-a712-0d2deaf024c3.png" width ="900px"/>

   + **[ProdController](./src/main/java/com/lgy/projectfinal/controller/prodcontroller.java)**  
    : 이미지는 D:\dev\looklike 폴더에 저장합니다.

   + **ProdService**   
    : ProdService.java - [ProdServiceImpl.java](./src/main/java/com/lgy/projectfinal/service/prodserviceImpl.java)의 구조를 가집니다.

   + **ProdDao**   
    : [ProdDao.java](./src/main/java/com/lgy/projectfinal/dao/prodDao.java) - [ProdMapper.xml](./src/main/java/com/lgy/projectfinal/dao/mapper/prodDao.xml)의 구조를 가집니다.
 
  </details>


---


### [ 구매내역관리 ]

<img src="https://github.com/sjlee05/LookLike/assets/136719054/6ec3fd24-9de1-444f-9ac1-953dbae6fa54.png" width ="900px"/>

- [X] **구매내역관리**
  <details>
  <summary> 구매내역관리 설명 펼치기:pushpin: </summary>
 
  <br>
  
  **[ 기능 설명 ]**    
    *  관리자 세션 확인 후 관리자만이 모든 회원의 구매내역을 조회할 수 있습니다.
    *  Datepicker을 활용해 기간별 조회가 가능합니다.
    *  주문 상태가 '주문 완료'일 시 즉시 환불 처리가 가능,
       그 외의 상태일 때는 환불 요청을 한 후 관리자가 환불 승인 시 환불 처리됩니다.
    *  고객의 요청에 따라 주문 내용을 변경할 수 있습니다.

    
  
    **[ 상세 구조 ]**
   <img src = "https://github.com/sjlee05/LookLike/assets/136719054/da2caa23-2eac-4385-a232-2b9428e36e9e.png" width ="900px"/>

    + **[SaleController](./src/main/java/com/lgy/projectfinal/controller/SaleController.java)**
    + **[CustController](./src/main/java/com/lgy/projectfinal/controller/CustController.java)**

      : 주문 취소로 결제 금액을 반환합니다.


    + **Service**  
       : SaleService.java - [SaleServiceImpl.java](./src/main/java/com/lgy/projectfinal/service/SaleServiceImpl.java)의 구조를 가집니다.   
       : CustService.java - [CustServiceImpl.java](./src/main/java/com/lgy/projectfinal/service/CustServiceImpl.java)의 구조를 가집니다.


    + **Dao**   
       : [SaleDao.java](./src/main/java/com/lgy/projectfinal/dao/SaleDao.java) - [SaleMapper.xml](./src/main/java/com/lgy/projectfinal/dao/mapper/SaleDao.xml)의 구조를 가집니다.  
       : [CustDao.java](./src/main/java/com/lgy/projectfinal/dao/custDao.java) - [CustMapper.xml](./src/main/java/com/lgy/projectfinal/dao/mapper/custDao.xml)의 구조를 가집니다.   

  </details>

---

### [ 공지사항 관리 ] 

<img src = "https://github.com/sjlee05/LookLike/assets/136719054/703678df-3f48-41f3-827b-1cc69dca138a.png" width ="900px"/>

- [X] **공지의 CRUD**
   <details>
   <summary> 공지의 CRUD 설명 펼치기:pushpin: </summary>

   <br>

   **[ 기능 설명 ]**    
    *  세션 확인 후 관리자일때만 글쓰기, 수정, 삭제 버튼이 생성됩니다.
    *  공지사항을 등록할 때 모든 이미지는 다중 업로드 처리를 했습니다.
    *  검색 시 키워드 또는 게시글의 제목을 비교하여 데이터를 가져와 MyBatis로 처리하여 리스트 출력

    **[ 상세 구조 ]**
    <img src = "https://github.com/sjlee05/LookLike/assets/136719054/3609c7e2-7555-4446-993c-96a5936e7a63.png" width ="900px"/>

    + **[NoticeController](./src/main/java/com/lgy/projectfinal/controller/NoticeController.java)**
     : 이미지는 D:\dev\looklike 폴더에 저장합니다.

    + **NoticeService**   
     : NoticeService.java - [NoticeServiceImpl.java](./src/main/java/com/lgy/projectfinal/service/NoticeServiceImpl.java)의 구조를 가집니다.

    + **NoticeDao**   
     : [NoticeDao.java](./src/main/java/com/lgy/projectfinal/dao/NoticeDao.java) - [NoticeMapper.xml](./src/main/java/com/lgy/projectfinal/dao/mapper/NoticeDao.xml)의 구조를 가집니다.

   </details>

---

  ### [ 리뷰게시판 관리 ] 

<img src="https://github.com/sjlee05/LookLike/assets/136719054/02744a97-befe-40d3-9d6f-26689f1514bf.png" width="900"/>

- [X] **리뷰의 CRUD**
   <details>
   <summary> 리뷰의 CRUD 설명 펼치기:pushpin: </summary>

   <br>

   **[ 기능 설명 ]**    
    *  회원의 주문 상태가 '배송완료'일 시 상품별로 리뷰쓰기 버튼이 생성됩니다.
    *  유효성 검사를 통해 별점 미등록 시 페이지 이동이 제한됩니다.
    *  리뷰 등록 후 평점을 계산하여 메인페이지에서 상품별로 평점이 적용됩니다.
    *  관리자는 리뷰에 대한 답글을 등록, 수정, 삭제할 수 있습니다.

    **[ 상세 구조 ]**
    <img src = "https://github.com/sjlee05/LookLike/assets/136719054/f7c4fb32-b4ef-44cd-af95-184946226fdc.png" width="900"/>

    + **[ReviewController](./src/main/java/com/lgy/projectfinal/controller/ReviewController.java)**
     : 이미지는 D:\dev\looklike 폴더에 저장합니다.

    + **ReviewService**   
     : ReviewService.java - [ReviewServiceImpl.java](./src/main/java/com/lgy/projectfinal/service/ReviewServiceImpl.java)의 구조를 가집니다.

    + **ReviewDao**   
     : [ReviewDao.java](./src/main/java/com/lgy/projectfinal/dao/ReviewDao.java) - [ReviewMapper.xml](./src/main/java/com/lgy/projectfinal/dao/mapper/ReviewDao.xml)의 구조를 가집니다.

   </details>

---

  ### [ Q&A게시판 관리 ] 

<img src="https://github.com/sjlee05/LookLike/assets/136719054/ee2a069d-a2eb-431f-a07c-21db572fc536.png" width="900"/>

- [X] **Q&A의 CRUD**
   <details>
   <summary> Q&A의 CRUD 설명 펼치기:pushpin: </summary>

   <br>

   **[ 기능 설명 ]**    
    *  상품 상세 페이지에서 상품별 Q&A 작성이 가능합니다.
    *  세션 확인 후 관리자일때만 답글달기 버튼이 생성됩니다.
    *  이미지 업로드 시 Controller에서 날짜별 폴더 생성 후 이미지가 저장됩니다.

    **[ 상세 구조 ]**
    <img src = "https://github.com/sjlee05/LookLike/assets/136719054/3b254c1c-bb12-4a94-b2a4-91b7519a59b2.png" width="900"/>

    + **[QnAController](./src/main/java/com/lgy/projectfinal/controller/QnAController.java)**
     : 이미지는 D:\dev\looklike 폴더에 저장합니다.

    + **QnAService**   
     : QnAService.java - [QnAServiceImpl.java](./src/main/java/com/lgy/projectfinal/service/QnAServiceImpl.java)의 구조를 가집니다.

    + **QnADao**   
     : [QnADao.java](./src/main/java/com/lgy/projectfinal/dao/QnADao.java) - [QnAMapper.xml](./src/main/java/com/lgy/projectfinal/dao/mapper/QnADao.xml)의 구조를 가집니다.

   </details>

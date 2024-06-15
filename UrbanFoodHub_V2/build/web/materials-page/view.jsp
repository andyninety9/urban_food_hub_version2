<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="product" value="${requestScope.product}"/>
<c:set var="listAddresses" value="${requestScope.listAddresses}"/>
<c:set var="sold" value="${requestScope.sold}"/>
<c:set var="view" value="${requestScope.view}"/>
<c:set var="listIm" value="${requestScope.listIm}"/>
<div class="row" style="padding: 20px; display: flex; box-shadow: rgba(149, 157, 165, 0.4) 0px 8px 24px; justify-content: center;">
    <div class="col-md-5">
        <img style="width: 100%; height: 400px; object-fit: cover" src="<c:choose>
                <c:when test="${empty product.image}">
                 ./images/mate1.jpg
                </c:when>
                <c:otherwise>
                    ${product.image}
                </c:otherwise>
            </c:choose>" alt="alt"/>
    </div>
    <div class="col-md-7" style="gap: 10px; display: flex; flex-direction: column">
        <h5><span style="font-size: 12px" class="badge bg-warning me-2">New arrival</span>${product.name}</h5>
        <div style="display: flex; gap: 5px">
            <p style="font-size: 12px"> 5.0 <c:forEach begin="1" end="5">
                    <i style="color: #4ACD8D;" class="fa-solid fa-star"></i>
            </c:forEach>
                | </p>
            <p style="font-size: 12px">173 Reviews | </p>
            <p style="font-size: 12px">${sold} Sold</p>
        </div>
        <div style="display: flex; justify-content: start; align-items: center; padding: 10px; background: #FAFAFA; gap: 5px; box-shadow: rgba(149, 157, 165, 0.4) 0px 8px 24px;">
            <p style="margin: 0; font-size: 28px; color: #4ACD8E; font-weight: 500">đ<fmt:formatNumber value="${product.price}" pattern="#,###" /></p>
            <span style="font-size: 10px" class="badge bg-danger">Free ship</span>
        </div>
        <div style="display: flex; gap: 10px; align-items: center; margin-top: 10px">
            <nav class="navbar navbar-expand-sm">
                <div class="container-fluid">
                  <a class="navbar-brand" href="#">Delivered to</a>
                  <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDarkDropdown" aria-controls="navbarNavDarkDropdown" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                  </button>
                  <div class="collapse navbar-collapse" id="navbarNavDarkDropdown">
                    <ul class="navbar-nav">
                      <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                          <i style="color: orangered" class="fa-solid fa-truck-fast"></i>
                        </a>
                        <select class="dropdown-menu dropdown-menu-dark" aria-labelledby="navbarDarkDropdownMenuLink">
                            <c:if test="${listAddresses != null}">
                                <c:forEach var="address" items="${listAddresses}">
                                    <c:if test="${address.statusID == 1}">
                                        <option value="${address.addressID}">${address.detail}</option>
                                    </c:if>
                                </c:forEach>
                            </c:if>
                            <c:if test="${listAddresses == null}">
                                <option><a class="dropdown-item" href="login">Login now</a></option>
                            </c:if>
                        </select>
                      </li>
                    </ul>
                  </div>
                </div>
            </nav>
        </div>
        <div style="display: flex; gap: 10px; align-items: center; margin-top: 10px">
            <p style="margin: 0; font-size: 14px; color: grey">Quantity</p>
            <ul id="pagination" class="pagination justify-content-center pagination-sm" style="padding: 0; margin: 0">
                <li class="page-item">
                    <button onclick="changeQuantity(-1)" style="color: #808191" class="page-link" tabindex="-1" aria-disabled="true"><i class="fa-solid fa-minus"></i></button>
                </li>
                <li id="quantity" class="page-item disabled"><a style="color: #808191" class="page-link" href="#" tabindex="-1" aria-disabled="true">1</a></li>
                <li class="page-item">
                    <button onclick="changeQuantity(1)" style="color: #808191" class="page-link"><i class="fa-solid fa-plus"></i></button>
                </li>
            </ul>  
            <p style="margin: 0; font-size: 14px; color: grey">Stock: <span id="stock" style="color: #44B17E">${product.stock}</span> items available</p>
        </div>
            <c:if test="${view == 'food'}">
                <div style="display: flex; gap: 10px; align-items: center; margin-top: 10px">
                    <div class="form-check form-check-inline" style="display: flex; align-items: center; gap: 5px">
                        <input checked="" class="form-check-input" type="radio" name="orderType" id="orderTypeRadio1" value="1">
                        <label class="form-check-label" for="inlineRadio1">Prepared food <span class="material-icons">ramen_dining</span></label>
                    </div>
                    <div class="form-check form-check-inline" style="display: flex; align-items: center; gap: 5px">
                        <input class="form-check-input" type="radio" name="orderType" id="orderTypeRadio2" value="2">
                        <label class="form-check-label" for="inlineRadio2">Only material <span class="material-icons">blender</span></label>
                    </div>
                </div>
            </c:if>
            <c:set var="newQuantity" value="1"/>
          
            <div style="margin-top: auto; display: flex; gap: 20px">
                <a id="addToCart" href="add-to-cart?kind=${view}&productID=${product.id}&quantity=${newQuantity}&orderType=" style="color: #4ACD8E; border-color: #4ACD8E; background-color: transparent" type="button" class="btn btn-outline-primary"><i class="fa-solid fa-cart-shopping me-2"></i>Add to cart</a>
                <button id="buyNow" style="color: #4ACD8E; border-color: #4ACD8E; background-color: #4ACD8E; color: white" type="button" class="btn btn-primary">Buy now</button>
            </div>
    </div>
</div>
<div class="row" style="padding: 20px; display: flex; box-shadow: rgba(149, 157, 165, 0.4) 0px 8px 24px; justify-content: center; margin-top: 30px;  margin-bottom: 30px">
    <h5 style="text-align: left; background-color: #FAFAFA; padding: 10px">Material detail</h5>
    <ul style="list-style: none; font-size: 14px">
        <li style="display: flex; gap: 10px">
            <p style="color: grey; margin: 0; width: 15%">Category</p>
            <p style="margin: 0">${product.category}</p>
        </li>
        <li style="display: flex; gap: 10px">
            <p style="color: grey; margin: 0; width: 15%">Description</p>
            <p style="margin: 0">${product.desc}</p>
        </li>
        
            <c:if test="${view == 'material'}">
                <li style="display: flex; gap: 10px">
                    <p style="color: grey; margin: 0; width: 15%">Packaging</p>
                    <p style="margin: 0">${product.packagingSpec}</p>
                </li>
            </c:if>
            <c:if test="${view == 'food'}">
                <li style="display: flex; gap: 10px">
                    <p style="color: grey; margin: 0; width: 15%">Nutrition Value</p>
                    <p style="margin: 0">${product.nutritionValue}</p>
                </li>
                <li style="display: flex; gap: 10px">
                    <p style="color: grey; margin: 0; width: 15%">Prepare time</p>
                    <p style="margin: 0">${product.preparationTime}</p>
                </li>
                <li style="display: flex; gap: 10px">
                    <p style="color: grey; margin: 0; width: 15%">Shelf life</p>
                    <p style="margin: 0">${product.shelfLife}</p>
                </li>
            </c:if>
        
    </ul>
</div>
            <c:if test="${view == 'food'}">
                <div class="row" style="padding: 20px; display: flex; box-shadow: rgba(149, 157, 165, 0.4) 0px 8px 24px; justify-content: center; margin-top: 30px;  margin-bottom: 30px">
                    <h5 style="text-align: left; background-color: #FAFAFA; padding: 10px">How to cook</h5>
                    <c:set var="tmp" value="1"/>
                    <c:forEach var="instr" items="${listIm}">
                        <div>
                            <h6 style="font-weight: bold">${tmp}. ${instr.instrName}</h6>
                            <p>${instr.instrDesc}</p>
                        </div>
                        <c:set var="tmp" value="${tmp + 1}"/>
                    </c:forEach>
                    
                </div>
            </c:if>
           

<script>
    function updateAddToCartHref() {
        // Lấy giá trị của radio button được chọn
        const selectedRadio = document.querySelector('input[name="orderType"]:checked');
        const orderType = selectedRadio ? selectedRadio.value : '';

        // Lấy giá trị số lượng hiện tại
        const quantityElem = document.getElementById('quantity').querySelector('a');
        const currentQuantity = parseInt(quantityElem.textContent);

        // Cập nhật href của nút "Add to cart"
        const addToCartBtn = document.getElementById('addToCart');
        const view = "${view}"; // Thay thế giá trị thực tế của view
        const productId = "${product.id}"; // Thay thế giá trị thực tế của product.id
        
        addToCartBtn.href = "add-to-cart?kind=" + view + "&productID=" + productId + "&quantity=" + currentQuantity + "&orderType=" + orderType;
    }

    function changeQuantity(change) {
        // Lấy phần tử hiển thị số lượng
        const quantityElem = document.getElementById('quantity').querySelector('a');
        const stockElem = document.getElementById('stock');

        // Lấy giá trị hiện tại của số lượng
        let currentQuantity = parseInt(quantityElem.textContent);
        const stock = parseInt(stockElem.textContent);

        // Tính toán số lượng mới
        const newQuantity = currentQuantity + change;

        // Kiểm tra số lượng mới hợp lệ
        if (newQuantity > 0 && newQuantity <= stock) {
            // Cập nhật số lượng
            quantityElem.textContent = newQuantity;

            // Cập nhật href của nút "Add to cart"
            updateAddToCartHref();
        }
    }

    // Gọi updateAddToCartHref khi thay đổi lựa chọn radio button
    document.querySelectorAll('input[name="orderType"]').forEach(radio => {
        radio.addEventListener('change', updateAddToCartHref);
    });

    // Gọi updateAddToCartHref khi trang tải lần đầu
    window.onload = updateAddToCartHref;
</script>

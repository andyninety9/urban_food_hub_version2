// Function để tạo danh sách các trang
    function createPagination(currentPage, totalPages) {
        var pagination = document.getElementById("pagination");
        pagination.innerHTML = ""; // Xóa nội dung cũ

        var startPage = Math.max(currentPage - 1, 1); // Trang bắt đầu
        var endPage = Math.min(startPage + 2, totalPages); // Trang kết thúc

        // Tạo mục "Previous"
        var previousItem = document.createElement("li");
        previousItem.className = "page-item";
        var previousLink = document.createElement("a");
        previousLink.className = "page-link";
        previousLink.href = "#";
        previousLink.innerHTML = "Previous";
        previousLink.onclick = function() {
            if (currentPage > 1) {
                createPagination(currentPage - 1, totalPages);
            }
        };
        previousItem.appendChild(previousLink);
        pagination.appendChild(previousItem);

        // Tạo các mục cho các trang
        for (var i = startPage; i <= endPage; i++) {
            var pageItem = document.createElement("li");
            pageItem.className = "page-item";
            var pageLink = document.createElement("a");
            pageLink.className = "page-link";
            pageLink.href = "manage-products?page="+ i;
            pageLink.innerHTML = i;
            if (i === currentPage) {
                pageItem.classList.add("active");
            }
            pageLink.onclick = function(page) {
                return function() {
                    createPagination(page, totalPages);
                };
            }(i);
            pageItem.appendChild(pageLink);
            pagination.appendChild(pageItem);
        }

        // Tạo mục "Next"
        var nextItem = document.createElement("li");
        nextItem.className = "page-item";
        var nextLink = document.createElement("a");
        nextLink.className = "page-link";
        nextLink.href = "#";
        nextLink.innerHTML = "Next";
        nextLink.onclick = function() {
            if (currentPage < totalPages) {
                createPagination(currentPage + 1, totalPages);
            }
        };
        nextItem.appendChild(nextLink);
        pagination.appendChild(nextItem);
    }

    // Gọi hàm tạo phân trang khi trang được tải
  // Gọi hàm tạo phân trang khi trang được tải
window.onload = function() {
    var totalPages = sizeListMaterial;
    createPagination(currentPage, ((totalPages % 10) === 0) ? (totalPages / 10) : ((totalPages / 10) + 1));
};

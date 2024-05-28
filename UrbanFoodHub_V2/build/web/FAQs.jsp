<%-- 
    Document   : FAQs
    Created on : May 28, 2024, 8:33:51 AM
    Author     : duyma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <title>Câu hỏi thường gặp</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        /*  CSS tùy chỉnh (nếu cần) */
        body {
            font-family: 'Arial', sans-serif;
        }

        .faq-header {
            background-color: #22222C;
            padding: 60px 0;
            text-align: center;
            color: white;
            display: flex;
            flex-direction: column;
            padding: 10px
        }

        .faq-header h2 {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .faq-item {
            margin-bottom: 20px;
        }

        .faq-question {
            font-weight: 600;
            cursor: pointer;
            position: relative;
        }

        .faq-question::after {
            content: "\02795"; /* Dấu cộng */
            font-size: 18px;
            position: absolute;
            right: 0;
            top: 50%;
            transform: translateY(-50%);
        }

        .faq-answer {
            
            margin-top: 15px;
            padding-left: 20px;
            display: none; /* Ẩn câu trả lời ban đầu */
        }

        .faq-answer.show {
            display: block; /* Hiển thị câu trả lời khi click */
        }
    </style>
    </head>
    <body>

    <section class="faq-section">
        <div class="container">
            <div class="row">
                <div class="col-md-8 offset-md-2">
                    <div class="faq-header">
                        <h2>Câu hỏi thường gặp</h2>
                        <p style="font-size: 12px">Bạn có thắc mắc? Chúng tôi có thể có câu trả lời. Kiểm tra các câu hỏi thường gặp của chúng tôi bên dưới.</p>
                    </div>

                    <div class="faq-list" style="margin-top: 20px">
                        <div class="faq-item">
                            <h3 style="font-size: 18px;" class="faq-question">Quy trình đặt hàng như thế nào?</h3>
                            <div  class="faq-answer">
                                <p style="font-size: 14px;">Đây là câu trả lời cho câu hỏi 1. Bạn có thể thêm thông tin chi tiết ở đây.</p>
                            </div>
                        </div>

                        <div class="faq-item">
                            <h3 style="font-size: 18px;" class="faq-question">Nguồn gốc nguyên liệu có đảm bảo không?</h3>
                            <div class="faq-answer">
                                <p style="font-size: 14px;">Đây là câu trả lời cho câu hỏi 2. Bạn có thể thêm thông tin chi tiết ở đây.</p>
                            </div>
                        </div>

                        </div>
                </div>
            </div>
        </div>
    </section>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
        $(document).ready(function() {
            $(".faq-question").click(function() {
                $(this).next(".faq-answer").toggleClass("show");
                $(this).find("i").toggleClass("fa-plus fa-minus");
            });
        });
    </script>

</body>
</html>

<%-- 
    Document   : carousel-homepage
    Created on : May 27, 2024, 10:41:16 PM
    Author     : duyma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
                    <div class="carousel-indicators">
                      <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                      <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                      <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
                    </div>
                    <div class="carousel-inner">
                      <div class="carousel-item active">
                          <img src="./images/banner3.jpg" class="d-block w-100" style="height: 500px; object-fit: cover; object-position: top" alt="...">
                      </div>
                      <div class="carousel-item">
                        <img src="./images/banner2.jpg" class="d-block w-100" style="height: 500px; object-fit: cover; object-position: top" alt="...">
                      </div>
                      <div class="carousel-item">
                        <img src="./images/banner1.jpg" class="d-block w-100" style="height: 500px; object-fit: cover; object-position: top" alt="...">
                      </div>
                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                      <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                      <span class="carousel-control-next-icon" aria-hidden="true"></span>
                      <span class="visually-hidden">Next</span>
                    </button>
                  </div>


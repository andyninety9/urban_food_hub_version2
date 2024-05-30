<%-- 
    Document   : carousel-meal-plan
    Created on : May 28, 2024, 8:06:05 AM
    Author     : duyma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel" style="margin-bottom: 20px">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active">
        <img src="images/banner-plan1.png" class="d-block w-100" alt="..." style="max-height: 500px; object-fit: cover">
      <div class="carousel-caption d-none d-md-block">
        <h5>Eat clean</h5>
        <p>Some representative placeholder content for the first slide.</p>
      </div>
    </div>
    <div class="carousel-item">
        <img src="images/banner-plan2.png" class="d-block w-100" style="max-height: 500px; object-fit: cover" alt="...">
      <div class="carousel-caption d-none d-md-block">
        <h5>Vegetarian Meal</h5>
        <p>Some representative placeholder content for the second slide.</p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="images/banner-plan3.png" class="d-block w-100" alt="..." style="max-height: 500px; object-fit: cover">
      <div class="carousel-caption d-none d-md-block">
        <h5>Diet plan for everyone</h5>
        <p>Some representative placeholder content for the third slide.</p>
      </div>
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>

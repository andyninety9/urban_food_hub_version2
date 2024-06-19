<%-- 
    Document   : banner-plans
    Created on : May 30, 2024, 11:09:36 AM
    Author     : duyma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div style="height: 600px; width: 100%; background-image: url('images/plansBanner.jpg'); background-size: cover; display: flex; justify-content: center; align-items: center">
     <div style="display: flex; flex-direction: column; align-items: center; ">
         <h1 style="color: white; font-weight: bold">WEEKLY MEAL PLAN</h1>
         <div style="display: flex; gap: 1.5rem; justify-content: center; align-items: center;">
             <h3 id="startDate" style="font-size: 60px; color: #4acd8e; font-weight: bold">30.05.2024</h3>
             <i style="font-size: 50px; color: #eee; font-weight: bold" class="fa-solid fa-arrow-right"></i>
             <h3 id="endDate" style="font-size: 60px; color: #4acd8e; font-weight: bold">06.06.2024</h3>
         </div>
     </div>
</div>
<script>
    function displayCurrentWeek() {
        const now = new Date();
        const firstDayOfWeek = new Date(now.setDate(now.getDate() - now.getDay() + 1)); // Thứ Hai
        const lastDayOfWeek = new Date(now.setDate(firstDayOfWeek.getDate() + 4)); // Chủ Nhật

        const options = { day: '2-digit', month: '2-digit', year: 'numeric' };

        const firstDayFormatted = firstDayOfWeek.toLocaleDateString('en-GB', options).replace(/\//g, '.');
        const lastDayFormatted = lastDayOfWeek.toLocaleDateString('en-GB', options).replace(/\//g, '.');

        document.getElementById('startDate').innerText = firstDayFormatted;
        document.getElementById('endDate').innerText = lastDayFormatted;
    }

    window.onload = displayCurrentWeek;
</script>
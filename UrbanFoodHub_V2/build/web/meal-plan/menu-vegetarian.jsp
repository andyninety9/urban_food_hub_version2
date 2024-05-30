<%-- 
    Document   : menu
    Created on : May 30, 2024, 11:35:56 AM
    Author     : duyma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div style="display: flex; justify-content: space-between">
    <nav aria-label="Page navigation example">
        <ul class="pagination">
            <li class="page-item"><a style="color: #808191" class="page-link" href="#"><i class="fa-solid fa-angles-left"></i> Last week</a></li>
          <li class="page-item"><a style="color: #808191" class="page-link" href="#">30.05.2024</a></li>
          <li class="page-item"><a style="color: #808191" class="page-link" href="#">to</a></li>
          <li class="page-item"><a style="color: #808191" class="page-link" href="#">06.06.2024</a></li>
          <li class="page-item"><a style="color: #808191" class="page-link" href="#">Next week <i class="fa-solid fa-angles-right"></i></a></li>
        </ul>
    </nav>
    <button style="background-color: #4acd8e; color: white; border: none; padding: 10px 30px" type="button" class="btn btn-secondary">Order now</button>
</div>
<table class="table table-hover" style="margin-top: 20px">
    <thead style="background-color: black; color: white; font-weight: bold;">
    <tr>
            <th style="text-align: center; border-right: 1px solid white; color: #4acd8e" scope="col">DAY</th>
            <th style="text-align: center; border-right: 1px solid white" scope="col">BREAKFAST</th>
            <th style="text-align: center; border-right: 1px solid white" scope="col">LUNCH</th>
            <th style="text-align: center; border-right: 1px solid white" scope="col">DINNER</th>
    </tr>
  </thead>
  <tbody>
    <tr>
        <td scope="row" style="display: flex; justify-content: center;">
            <div style="display: flex; justify-content: center; align-items: center; height: 80px; width: 80px; border-radius: 100%;
                 background-color: #4acd8e">
                <h4 style="color: white; font-weight: bold; margin: 0">30.05</h4>
            </div>
        </td>
        <td>
            <div style="display: flex; justify-content: center; align-items: center; flex-direction: column;">
                <h6 style="color: #171725; font-weight: bold; margin: 0">Cơm tấm Sài gòn</h6>
                <span class="badge bg-warning text-dark">550 Kcal</span>
            </div>
        </td>
      <td> <div style="display: flex; justify-content: center; align-items: center; flex-direction: column;">
                <h6 style="color: #171725; font-weight: bold; margin: 0">Cơm tấm Sài gòn</h6>
                <span class="badge bg-warning text-dark">550 Kcal</span>
            </div></td>
      <td> <div style="display: flex; justify-content: center; align-items: center; flex-direction: column;">
                <h6 style="color: #171725; font-weight: bold; margin: 0">Cơm tấm Sài gòn</h6>
                <span class="badge bg-warning text-dark">550 Kcal</span>
            </div></td>
    </tr>
   
  </tbody>
</table>

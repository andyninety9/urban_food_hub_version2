<%-- 
    Document   : manage-instruction-meal
    Created on : May 29, 2024, 9:51:11 AM
    Author     : duyma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="instrList" value="${requestScope.instrList}"/>
<c:set var="selectedMealID" value="${requestScope.selectedMealID}"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage instruction meal</title>
        <link rel="icon" href="../images/Logo.png" type="image/x-icon">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
             <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link
            href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap"
            rel="stylesheet" />

        <!-- Icon Font Stylesheet -->
        <link
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
            rel="stylesheet" />
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
            rel="stylesheet" />

        <!-- Libraries Stylesheet -->
        <link
            href="lib/owlcarousel/assets/owl.carousel.min.css"
            rel="stylesheet" />
        <link
            href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css"
            rel="stylesheet" />

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css-dashboard/bootstrap.min.css" rel="stylesheet" />

        <!-- Template Stylesheet -->
        <link href="css-dashboard/style.css" rel="stylesheet" />
    </head>
    <body>
        
        <div class="container" style="padding: 20px">
            <a href="manage-foods?action=all" type="button" class="btn btn-secondary"><i class="fa-solid fa-arrow-left"></i></a>
            <p class="h3">#Manage Instructor ${selectedMealID}</p>
            
            <form action="manage-instruction" method="post" style="width: 50%; margin: 0 auto; display:  flex; flex-direction: column; align-items: center; background-color: white; border-radius: 10px; padding: 10px">
<!--                <select class="form-select" aria-label="Default select example">
                    <option selected>Select name to edit</option>
                    <c:forEach var="instr" items="${instrList}">
                        <option value="${instr.instID}">${instr.instrName}</option>
                    </c:forEach>
                    
                </select>-->
                <input name="mealID" type="hidden" value="${selectedMealID}"/>
                <input name="action" type="hidden" value="add"/>
                <p class="h3" style="text-align: center">Add new instruction</p>
                <br/>
                <div class="input-group flex-nowrap">
                    <span class="input-group-text" id="addon-wrapping">Instruction name</span>
                    <input name="instrName" type="text" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="addon-wrapping">
                </div>
                <br/>
                <div class="input-group">
                    <span class="input-group-text">Detail</span>
                    <textarea name="instrDesc" class="form-control" aria-label="With textarea"></textarea>
                </div>
                <br/>
                <button style="margin: 0 auto" type="submit" class="btn btn-dark">Add</button>
            </form>
            <div style="margin: 0 auto;">
                <table class="table table-hover">
                <thead>
                  <tr>
                    <th scope="col">#</th>
                    <th scope="col">Name</th>
                    <th scope="col">Detail</th>
                    <th scope="col">Action</th>
                  </tr>
                </thead>
                <tbody>
                   <c:forEach var="instr" items="${instrList}">
                        <tr style="height: 40px; overflow-y: hidden">
                            <th scope="row">${instr.instID}</th>
                            <td>                           
                                <form action="manage-instruction" method="post" >
                                    <input name="mealID" type="hidden" value="${selectedMealID}"/>
                                    <p style="" id="oldInstrName_${instr.instID}">${instr.instrName}</p>
                                    <input type="hidden" name="action" value="editInstrName"/>
                                    <input type="hidden" name="instrID" value="${instr.instID}"/>
                                    <input style="display: none; outline: none; border-radius: 20px; border: none; padding: 0 10px" id="newInstrName_${instr.instID}" type="text" name="instrName" value="${instr.instrName}"/>
                                </form>
                                <a style="color: gray" type="button" onclick="popup('newInstrName_${instr.instID}', 'oldInstrName_${instr.instID}')"><i class="fa-solid fa-pen-to-square"></i></a>
                            </td>
                            <td>
                                <form action="manage-instruction" method="post" >
                                    <input name="mealID" type="hidden" value="${selectedMealID}"/>
                                    <p style="" id="oldInstrDesc_${instr.instID}">${instr.instrDesc}</p>
                                    <input type="hidden" name="action" value="editInstrDesc"/>
                                    <input type="hidden" name="instrID" value="${instr.instID}"/>
                                    <input style="display: none; outline: none; border-radius: 20px; border: none; padding: 0 10px" id="newInstrDesc_${instr.instID}" type="text" name="instrDesc" value="${instr.instrDesc}"/>
                                </form>
                                <a style="color: gray" type="button" onclick="popup('newInstrDesc_${instr.instID}', 'oldInstrDesc_${instr.instID}')"><i class="fa-solid fa-pen-to-square"></i></a>
                            </td>
                            <td>
                                <form id="deleteForm" onsubmit="return confirm('Do you want to delete?')" action="manage-instruction" method="post" >
                                    <input type="hidden" name="action" value="delete"/>
                                    <input name="mealID" type="hidden" value="${selectedMealID}"/>
                                    <input type="hidden" name="instrID" value="${instr.instID}"/>
                                </form>
                                <a onclick="document.getElementById('deleteForm').submit()" style="color: gray" href="#"><i class="fa-solid fa-trash"></i></a>
                            </td>
                        </tr>
                    </c:forEach>
               
    
                </tbody>
              </table>
            </div>
            <jsp:include page="../footer.jsp"/>
        </div>
        <script>
            function popup(input, tag){
                const tagSelect = document.getElementById(tag);
                const inputSelect = document.getElementById(input);
                if(tagSelect.style.display === ""){
                    tagSelect.style.display = "none";
                    inputSelect.style.display = "";
                }else{
                    tagSelect.style.display = "";
                    inputSelect.style.display = "none";
                }
            }
        </script>
    </body>
</html>

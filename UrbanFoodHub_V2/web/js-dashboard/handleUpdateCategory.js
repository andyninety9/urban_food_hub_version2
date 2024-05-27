function popup(nameId, inputId){
    const tagName = document.getElementById(nameId);
    const tagNewName = document.getElementById(inputId);
    if(tagName.style.display === "block"){
        tagName.style.display = "none";
        tagNewName.style.display = "block"; 
    }else{
        tagName.style.display = "block";
        tagNewName.style.display = "none"; 
    }
}

function showMoreInfo(id){
//    const btn = document.getElementById("showMoreInfo" + id);
    const moreInfo = document.getElementById("moreInfo" + id);
    if(moreInfo.style.display === "none"){
        moreInfo.style.display = "";
    }else{
        moreInfo.style.display = "none";
    }
}
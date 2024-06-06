function toggleButton(idElement, idInput){
    const element = document.getElementById(idElement);
    const input = document.getElementById(idInput);
    if(input.style.display === 'none'){
        input.style.display = '';
        element.style.display = 'none';
    }else{
        input.style.display = 'none';
        element.style.display = '';
    }
}

function toggleMultipleButtons(ids) {
    ids.forEach(({ idElement, idInput }) => {
        const element = document.getElementById(idElement);
        const input = document.getElementById(idInput);

        const inputDisplay = window.getComputedStyle(input).display;

        if (inputDisplay === 'none') {
            input.style.display = 'block'; // Hiển thị phần tử
            if (element) {
                element.style.display = 'none'; // Ẩn phần tử
            }
        } else {
            input.style.display = 'none'; // Ẩn phần tử
            if (element) {
                element.style.display = 'block'; // Hiển thị phần tử
            }
        }
    });
}
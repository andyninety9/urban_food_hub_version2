function showHoverOption() {
    document.getElementById('hover-option').style.display = 'block';
}

function hideHoverOption() {
    document.getElementById('hover-option').style.display = 'none';
}

document.addEventListener('DOMContentLoaded', function() {
    const wrapperInfo = document.querySelector('.wrapper-info');
    wrapperInfo.addEventListener('mouseenter', showHoverOption);
    wrapperInfo.addEventListener('mouseleave', hideHoverOption);
});
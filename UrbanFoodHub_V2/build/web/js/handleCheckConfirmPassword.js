document.getElementById("register-form").addEventListener('submit', function (event) {
    event.preventDefault();
    validatePassword(event);
});

const passwordField = document.getElementById("password");
const confirmPasswordField = document.getElementById("confirm-pass");
const message = document.getElementById("message");

// Lắng nghe sự kiện input trên trường xác nhận mật khẩu
confirmPasswordField.addEventListener('input', validatePasswordInput);

function validatePassword(event) {
    const password = passwordField.value;
    const confirmPassword = confirmPasswordField.value;

    if (password === confirmPassword) {
        message.textContent = '';
        event.target.submit();
    } else {
        message.textContent = 'Confirm password does not match!';
    }
}

function validatePasswordInput() {
    const password = passwordField.value;
    const confirmPassword = confirmPasswordField.value;

    if (password === confirmPassword) {
        message.textContent = '';
    } else {
        message.textContent = 'Confirm password does not match!';
    }
}

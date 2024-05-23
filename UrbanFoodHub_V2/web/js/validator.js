// Validate email
function validateEmail(email) {
    const re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return re.test(String(email).toLowerCase());
}

// Validate password
function validatePassword(password) {
    const re = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;
    return re.test(String(password));
}

// Validate phone number
function validatePhoneNumber(phoneNumber) {
    const re = /^\d{10}$/;
    return re.test(String(phoneNumber));
}

function validateUsername(username) {
    // Kiểm tra độ dài
    if (username.length < 3 || username.length > 20) {
        return false;
    }

    // Kiểm tra ký tự hợp lệ
    const re = /^[a-zA-Z0-9._]+$/;
    if (!re.test(username)) {
        return false;
    }

    // Kiểm tra không bắt đầu hoặc kết thúc bằng dấu gạch dưới hoặc dấu chấm
    if (username.startsWith('_') || username.startsWith('.') || username.endsWith('_') || username.endsWith('.')) {
        return false;
    }

    // Kiểm tra không chứa hai dấu gạch dưới hoặc dấu chấm liên tiếp
    if (username.includes('__') || username.includes('..')) {
        return false;
    }

    return true;
}

function validateConfirmPassword(password, confirmPassword) {
    return password === confirmPassword;
}
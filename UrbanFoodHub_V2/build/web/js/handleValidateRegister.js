
document.getElementById("register-form").addEventListener("submit", function(event) {
    event.preventDefault();
    
    const username = document.getElementById("username").value;
    const password = document.getElementById("password").value;
    const confirmPass = document.getElementById("confirmPass").value;
    
    const data = { username, password, confirmPass };
    const rules = {
        username : {required: true, username: true},
        password: { required: true, password: true },
        confirmPass: { required: true, confirmPass: true }
    };
    
    const errors = validateData(data, rules);

    if (Object.keys(errors).length > 0) {
        for (let key in errors) {
            document.getElementById(key + "Error").innerText = errors[key];
        }
    } else {
        document.getElementById("register-form").submit();
    }
});
let passwordValue = "";
const fields = ["username", "password","confirmPass"];
fields.forEach(function(field) {
    const input = document.getElementById(field);
    input.addEventListener("input", function() {
        const value = input.value;
        const rule = {
            required: true,
            username: field === "username",
            password: field === "password",
            confirmPass: field === "confirmPass"
        };
        if(field === "password"){
            passwordValue = input.value;
        }
        const error = validateField(field, value, rule);
        const errorElement = document.getElementById(field + "Error");
        errorElement.innerText = error;
    });
});

function validateData(data, rules) {
    let errors = {};
    for (let field in rules) {
        let value = data[field];
        let rule = rules[field];

        let error = validateField(field, value, rule, data);
        if (error) {
            errors[field] = error;
        }
    }
    return errors;
}

function validateField(field, value, rule) {
    if (rule.required && !value) {
        return `${field} is required.`;
    }

    if (rule.username && !validateUsername(value)) {
        return `Username must have more than 3 characters without space.`;
    }

    if (rule.password && !validatePassword(value)) {
        return `Password must have more than 8 characters include number and uppercase.`;
    }
    
    if (rule.confirmPass && !validateConfirmPassword(value, passwordValue)) {
        return `Confirm password does not match.`;
    }
    return "";
}




document.getElementById("update-form").addEventListener("submit", function(event) {
    event.preventDefault();

    const email = document.getElementById("email").value;
    const phone = document.getElementById("phone").value;

    const data = { email, phone };
    const rules = {
        email: { required: true, email: true },
        phone: { required: true, phone: true }
    };

    const errors = validateData(data, rules);

    if (Object.keys(errors).length > 0) {
        for (let key in errors) {
            document.getElementById(key + "Error").innerText = errors[key];
        }
    } else {
        document.getElementById("update-form").submit();
    }
});

const fields = ["email", "phone"];
fields.forEach(function(field) {
    const input = document.getElementById(field);
    input.addEventListener("input", function() {
        const value = input.value;
        const rule = {
            required: true,
            email: field === "email",
            phone: field === "phone"
        };
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

        let error = validateField(field, value, rule);
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

    if (rule.email && !validateEmail(value)) {
        return `${field} must follow format example@domain.com.`;
    }

    if (rule.password && !validatePassword(value)) {
        return `${field} is not a valid password.`;
    }

    if (rule.phone && !validatePhoneNumber(value)) {
        return `${field} must have 10 number format.`;
    }

    return "";
}


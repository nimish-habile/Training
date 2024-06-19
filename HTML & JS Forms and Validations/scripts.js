document.addEventListener("DOMContentLoaded", function() {

  function saveFormData() {
    const formData = {
      firstname: document.getElementById("firstname").value,
      lastname: document.getElementById("lastname").value,
      email: document.getElementById("email").value,
      phone: document.getElementById("phone").value,
      gender: document.getElementById("gender").value,
      dob: document.getElementById("dob").value,
      password: document.getElementById("password").value,
      bio: document.getElementById("bio").value,
    };

    localStorage.setItem("formDraft", JSON.stringify(formData));
  }

  function loadFormData() {
    const savedData = localStorage.getItem("formDraft");
    if (savedData) {
      const formData = JSON.parse(savedData);
      document.getElementById("firstname").value = formData.firstname;
      document.getElementById("lastname").value = formData.lastname;
      document.getElementById("email").value = formData.email;
      document.getElementById("phone").value = formData.phone;
      document.getElementById("gender").value = formData.gender;
      document.getElementById("dob").value = formData.dob;
      document.getElementById("password").value = formData.password;
      document.getElementById("bio").value = formData.bio;
    }
  }

  loadFormData();

  function validateField(id) {
    const value = document.getElementById(id).value;
    let errorMessage = "";

    if(id == "firstname"||id == "lastname"){
      if(value === ""){
        errorMessage = "*Please enter " + id;
      }
      else if(value.length < 3 || value.length > 20){
        errorMessage = "*Length should be between 3 and 20";
      }
    }
    else if(id === "password"){
      let passwordExp = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
      if(!value.match(passwordExp)){
        errorMessage = "*Password strength is low";
      }
    }
    else if(id === "phone"){
      let phoneExp = /^[6789]\d{9}$/;
      if(!value.match(phoneExp)){
        errorMessage = "*Invalid phone number";
      }
    }
    else if(id === "bio"){
      if(value.length > 200){
        errorMessage = "*Bio should be less than 200 characters.";
      }
    }
    else if(id === "email"){
      let emailExp = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
      if(!value.match(emailExp)){
        errorMessage = "*Please enter a valid email."
      }
    }
    else if(id === "dob"){
      let comparisonDate = new Date("2006-01-01");
      let inputDate = new Date(value);
      if(comparisonDate < inputDate){
        errorMessage = "*DOB should be before 1st Jan 2006";
      }
    }

    const errorElement = document.getElementById(id + "Err");
    if (errorElement) {
      errorElement.innerHTML = errorMessage;
    }
  }

  const inputs = ["firstname", "lastname", "password", "phone", "bio", "email", "dob"];

  inputs.forEach(id => {
    document.getElementById(id).addEventListener("input", saveFormData);
  });

  inputs.forEach(id => {
    const inputElement = document.getElementById(id);
    if (inputElement) {
      inputElement.addEventListener("blur", function() {
        validateField(id);
      });
    }
  });

  document.getElementById("form").addEventListener("submit", function (event) {
    event.preventDefault();

    if (validationFun()) {
      const formData = {
        firstname: document.getElementById("firstname").value,
        lastname: document.getElementById("lastname").value,
        email: document.getElementById("email").value,
        phone: document.getElementById("phone").value,
        gender: document.getElementById("gender").value,
        dob: document.getElementById("dob").value,
        password: document.getElementById("password").value,
        bio: document.getElementById("bio").value,
      };

      let previousData = localStorage.getItem("signupFormData");
      previousData = previousData ? JSON.parse(previousData) : [];

      previousData.push(formData);

      localStorage.setItem("signupFormData", JSON.stringify(previousData));
      localStorage.removeItem("formDraft");
      alert("Form data has been saved!");
    }
  });

  document.getElementById("clearStorageButton").addEventListener("click", function(){
    localStorage.removeItem("signupFormData");
    localStorage.removeItem("formDraft");
    alert("Local storage has been cleared!");
    document.getElementById("form").reset();
    inputs.forEach(id => {
      const errorElement = document.getElementById(id + "Err");
      if (errorElement) {
        errorElement.innerHTML = "";
      }
    });
  });

  inputs.forEach(id => {
    document.getElementById(id).addEventListener("input", function(){
      const errorElement = document.getElementById(id + "Err");
      if (errorElement) {
        errorElement.innerHTML = "";
      }
    });
  });

  const togglePassword = document.getElementById("togglePassword");
  const password = document.getElementById("password");

  if (togglePassword && password) {
    togglePassword.addEventListener("click", function(){
      const type = password.getAttribute("type") === "password" ? "text" : "password";
      password.setAttribute("type", type);

      this.classList.toggle("fa-eye-slash");
    });
  }

  function validationFun() {
    let valid = true;
    inputs.forEach(id => {
      validateField(id);
      console.log(id);
      if (document.getElementById(id + "Err").innerHTML !== "") {
        valid = false;
      }
    });
    return valid;
  }
});
function validationFun() {
  let ipFirstName = document.getElementById("firstname").value;
  let ipLastName = document.getElementById("lastname").value;
  let ipPassword = document.getElementById("password").value;
  let ipPhone = document.getElementById("phone").value;
  let ipBio = document.getElementById("bio").value;
  let ipEmail = document.getElementById("email").value;
  let ipDob = document.getElementById("dob").value;

  let passwordExp = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
  let phoneExp = /^[6789]\d{9}$/;
  let emailExp = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;

  let comparisonDate = new Date("2006-01-01");
  let inputDate = new Date(ipDob);

  let check = 1;

  if (ipFirstName === "") {
    document.getElementById("firstnameErr").innerHTML = "*Please enter firstname";
    check = 0;
  }

  if (ipLastName === "") {
    document.getElementById("lastnameErr").innerHTML = "*Please enter lastname";
    check = 0;
  }

  if (ipFirstName.length < 3 || ipFirstName.length > 20) {
    document.getElementById("firstnameErr").innerHTML = "*Length should be between 3 and 20";
    check = 0;
  }

  if (ipLastName.length < 3 || ipLastName.length > 20) {
    document.getElementById("lastnameErr").innerHTML = "*Length should be between 3 and 20";
    check = 0;
  }

  if (!ipPassword.match(passwordExp)) {
    document.getElementById("passwordErr").innerHTML = "*Password strength is low.";
    check = 0;
  }

  if (!ipPhone.match(phoneExp)) {
    document.getElementById("phoneErr").innerHTML = "*Invalid phone number.";
    check=0;
  }
  
  if(ipBio.length>200){
    document.getElementById("bio").value = ipBio.substring(0,200);
  }

  if(!ipEmail.match(emailExp)){
    document.getElementById("emailErr").innerHTML = "*Please enter a valid email."
    check = 0;
  }

  if(comparisonDate<inputDate){
    document.getElementById("dobErr").innerHTML = "*DOB should be before 1st Jan 2006";
    check = 0;
  }

  return check == 1;
}

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
    previousData = previousData ? JSON.parse(previousData):[];

    previousData.push(formData);

    localStorage.setItem("signupFormData", JSON.stringify(previousData));
    alert("Form data has been saved!");
  }
});

document.getElementById("clearStorageButton").addEventListener("click", function(){
  localStorage.removeItem("signupFormData");
  alert("Local storage has been cleared!");
});

const inputs = ["firstname", "lastname", "password", "phone", "bio", "email", "dob"];
inputs.forEach(id => {
  document.getElementById(id).addEventListener("input", function(){
    document.getElementById(id+"Err").innerHTML = "";
  });
});

const togglePassword = document.getElementById("togglePassword");
const password = document.getElementById("password");

togglePassword.addEventListener("click", function(){
  const type = password.getAttribute("type") === "password"?"text":"password";
  password.setAttribute("type", type);

  this.classList.toggle("fa-eye-slash");
});
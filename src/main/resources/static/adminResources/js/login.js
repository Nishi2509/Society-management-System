function validateLoginForm() {
	let
	username = document.getElementById("username");
	let
	password = document.getElementById("password");

	let
	format = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
	let
	validUsername = !username.value.match(format) || username.value === "";
	let
	validPassword = password.value.length <= 3;

	if (validUsername) {
		username.classList.add("is-invalid");
	} else {
		username.classList.remove("is-invalid");
	}

	if (validPassword) {
		password.classList.add("is-invalid");
	} else {
		password.classList.remove("is-invalid");
	}

	return !(validUsername && validPassword);
}
package com.example.bookstore.controller;

import java.util.List;

import com.example.bookstore.model.User;

public class Utils {

	public List<String> errorValidation(User userForm, List<String> errorList) {

		String error1, error2, error3 = null;
		if (userForm.getEmail().isEmpty()) {
			error1 = "ERROR1: You should enter an email";
			errorList.add(error1);

		}
		if (userForm.getPassword().isEmpty()) {
			error2 = "ERROR2: You should enter a password";
			errorList.add(error2);
		}
		if (userForm.getEmail().contains("test.com")) {
			error3 = "ERROR3: This email is not valid";
			errorList.add(error3);
		}

		return errorList;
	}

}

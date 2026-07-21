package com.cognizant;

public class EmailService implements MessageService {
    private String message;

    public void setMessage(String message) {
        this.message = message;
    }

    @Override
    public String getMessage() {
        return "Email: " + this.message;
    }
}

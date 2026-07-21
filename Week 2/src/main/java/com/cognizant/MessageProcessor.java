package com.cognizant;

public class MessageProcessor {
    private MessageService messageService;

    public void setMessageService(MessageService messageService) {
        this.messageService = messageService;
    }

    public void processMessage() {
        System.out.println("Processing: " + messageService.getMessage());
    }

    public String getProcessedMessage() {
        return "Processed: " + messageService.getMessage();
    }
}

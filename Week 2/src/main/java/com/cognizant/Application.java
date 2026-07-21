package com.cognizant;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Application {
    public static void main(String[] args) {
        ApplicationContext context = new ClassPathXmlApplicationContext("spring.xml");
        MessageProcessor processor = context.getBean("messageProcessor", MessageProcessor.class);
        System.out.println(StringUtils.upperCase(processor.getProcessedMessage()));
    }
}

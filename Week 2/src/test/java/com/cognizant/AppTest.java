package com.cognizant;

import org.junit.jupiter.api.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertEquals;

public class AppTest {
    @Test
    public void testApp() {
        ApplicationContext context = new ClassPathXmlApplicationContext("spring.xml");
        MessageProcessor processor = context.getBean("messageProcessor", MessageProcessor.class);
        assertNotNull(processor);
        assertEquals("Processed: Email: Dependency Injection in Spring!", processor.getProcessedMessage());
    }
}

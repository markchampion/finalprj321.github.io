/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mark.javamail;

import java.util.Properties;
import java.util.Random;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author PC
 */
public class GmailSending {
    private static final String HOST = "markproject.k13fptu@gmail.com";
    private static final String PASS = "he130639";
    
    private static String generateCapcha() {
        String capcha = "";
        Random rd = new Random();
        for (int i = 0; i < 6; i++) {
            capcha += rd.nextInt(10);
        }
        return capcha;
    }
    
    public static String send(String to) {
        //Get properties object    
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
//        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.socketFactory.class",
                "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "25");
        //get Session   
        Session session = Session.getInstance(props,
                new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(HOST, PASS);
            }
        });
        //compose message    
        String capcha = generateCapcha();
        String msg = capcha + " is your Triple MP3 verification code"; 
        try {
            MimeMessage message = new MimeMessage(session);
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            message.setSubject("Verification Mail");
            message.setText(msg);
            //send message  
            Transport.send(message);
            System.out.println("message sent successfully");
            return capcha;
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }
}

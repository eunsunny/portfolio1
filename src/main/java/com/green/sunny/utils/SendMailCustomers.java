package com.green.sunny.utils;

import java.util.Date;
import java.util.Map;
import java.util.Properties;
import javax.activation.CommandMap;
import javax.activation.MailcapCommandMap;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Message.RecipientType;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

public class SendMailCustomers {
	private static final String bodyEncoding = "UTF-8";
	private static final String gmailId = "honguniverse902@gmail.com";
	private static final String password = "mwilzysqjgbfrfjj";
	
	public static void sendMail(Map<String, Object> paramMap) throws Exception{
	    String sender = (String)paramMap.get("sender");
	    String custId = (String)paramMap.get("custId");
	    String custNm = (String)paramMap.get("custNm");
	    String email = (String)paramMap.get("email");
	    String subject = custNm + "���� ���ǻ����Դϴ�.";
	    String content = (String)paramMap.get("message");
	    
	    //���� �ɼ� ����
	    Properties props = new Properties();    
	    props.put("mail.transport.protocol", "smtp");
	    props.put("mail.smtp.host", "smtp.gmail.com");
	    props.put("mail.smtp.port", "465");
	    props.put("mail.smtp.auth", "true");
	 
	    props.put("mail.smtp.quitwait", "false");
	    props.put("mail.smtp.socketFactory.port", "465");
	    props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
	    props.put("mail.smtp.socketFactory.fallback", "false");
	    
	    try {
	      //���� ����  ���� ���� ����
	      Authenticator auth = new Authenticator() {
	        protected PasswordAuthentication getPasswordAuthentication() {
	          return new PasswordAuthentication(gmailId, password);
	        }
	      };
	      
	      //���� ���� ����
	      Session session = Session.getInstance(props, auth);
	      
	      //MIME Ÿ�� ����
	      MailcapCommandMap MailcapCmdMap = (MailcapCommandMap) CommandMap.getDefaultCommandMap();
	      MailcapCmdMap.addMailcap("text/html;; x-java-content-handler=com.sun.mail.handlers.text_html");
	      MailcapCmdMap.addMailcap("text/xml;; x-java-content-handler=com.sun.mail.handlers.text_xml");
	      MailcapCmdMap.addMailcap("text/plain;; x-java-content-handler=com.sun.mail.handlers.text_plain");
	      MailcapCmdMap.addMailcap("multipart/*;; x-java-content-handler=com.sun.mail.handlers.multipart_mixed");
	      MailcapCmdMap.addMailcap("message/rfc822;; x-java-content-handler=com.sun.mail.handlers.message_rfc822");
	      CommandMap.setDefaultCommandMap(MailcapCmdMap);
	      
	      //���� ��/���� �ɼ� ����
	      Message message = new MimeMessage(session);
	      message.setFrom(new InternetAddress(gmailId, sender));
	      message.setSubject(subject);
	      message.setSentDate(new Date());
	      Multipart mp = new MimeMultipart();
	      StringBuilder sb = new StringBuilder();
	      
  	      //���Ͽ� ����� �ؽ�Ʈ
  	      sb.append("<h4> �� ���̵� : " + custId + "</h4>");
  	      sb.append("<h4> ���� : " + custNm + "</h4>");
  	      sb.append("<h4> �� �̸��� : " + email + "</h4>");
  	      sb.append("<h4> ���� : " + content + "</h4>");
  	      
  	      String sendText = sb.toString();  	    
	      MimeBodyPart mTextPart = new MimeBodyPart();
	      mTextPart.setText(sendText, bodyEncoding, "html");
	      mp.addBodyPart(mTextPart);	      
	      message.setContent(mp);
	      
    	  message.setRecipients(RecipientType.TO, InternetAddress.parse(gmailId, false));
    	  Transport.send( message);
	    } catch ( Exception e ) {
	      e.printStackTrace();
	    }
	}
}
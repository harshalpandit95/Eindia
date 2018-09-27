package com.eindia.service;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eindia.domain.Info;
import com.eindia.model.ForgotPasswordRequest;
import com.eindia.repo.InfoRepo;

@Service
public class EmailService {

	@Autowired
	private InfoRepo irepo;

	public boolean sendEmail(String fromemail, String username, String password, ForgotPasswordRequest request)
			throws IOException {
		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");
		Session session = Session.getInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});

		try {
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("" + fromemail));
			/* InternetAddress tomails[] = new InternetAddress[toemail.size()]; */
			/* int count = 0; */
			/*
			 * for (String s : toemail) { tomails[count] = new InternetAddress(s); count++;
			 * }
			 */
			Info infodata = irepo.getPassword(request.getUsername(), request.getEmail());
			if (infodata != null) {
				message.setRecipient(Message.RecipientType.TO, new InternetAddress(infodata.getEmail()));
				/* message.setRecipients(Message.RecipientType.TO, tomails); */

				message.setSubject("Reset Password");
				String timeStamp = new SimpleDateFormat("dd/MM/yyyy").format(new Date());
				String msg = "Password is " + infodata.getPassword() + "  \n password recovered on " + timeStamp;
				Multipart multipart = new MimeMultipart();
				MimeBodyPart attachPart = new MimeBodyPart();
				MimeBodyPart htmlattachpart = new MimeBodyPart();
				htmlattachpart.setContent(msg, "text/html; charset=utf-8");
				multipart.addBodyPart(htmlattachpart);
				message.setContent(multipart);
				Transport.send(message);
				System.out.println("Mails Sent");
				return true;
			} else {
				return false;
			}

		} catch (MessagingException e) {
			throw new RuntimeException(e);

		}
	}

	/*
	 * public static void main(String[] args) throws IOException { final String
	 * fromemail = "HP00492848@techmahindra.com"; final String username =
	 * "HP00492848@techmahindra.com"; final String password = "492848#tecH";
	 * ArrayList<String> toemail = new ArrayList<>();
	 * toemail.add("coldharsh11495@gmail.com");
	 * toemail.add("RN0C75647@techmahindra.com"); ArrayList<String> filenames = new
	 * ArrayList<>();
	 * filenames.add("D://Harshal/AshishSir_latestcode/archive-service/new.pdf");
	 * new SendMail().sendEmail(fromemail, toemail, username, password, filenames);
	 * }
	 */
}
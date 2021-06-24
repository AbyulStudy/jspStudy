package util;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class Gmail extends Authenticator {

	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		String ID = "kinsng1599@gmail.com";
		String PW = "c1599323";
		return new PasswordAuthentication(ID, PW);
	}	
}

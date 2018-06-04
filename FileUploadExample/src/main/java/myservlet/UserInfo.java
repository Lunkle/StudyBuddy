package myservlet;

import java.util.ArrayList;
import java.util.Date;

public class UserInfo {
	private static ArrayList<UserInfo> allUsers=new ArrayList<>();

	public String username;
	public String sessionID;
	public long lastCheckTime;
	
	public UserInfo(String username) {
		
		this.username=username;
		sessionID=username+"1";
		
		allUsers.add(this);
	}
	
	public static UserInfo getUser(String sessionID) {
		for(UserInfo user: allUsers) {
			if(user.sessionID.equals(sessionID)) {
				return user;
			}
		}
		throw new RuntimeException("sessionID["+sessionID+"] not found");
	}
}

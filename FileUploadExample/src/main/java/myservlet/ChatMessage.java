package myservlet;

import java.util.ArrayList;

public class ChatMessage {
	
	private static ArrayList<ChatMessage> allMessages=new ArrayList<>();
	
	private static int counter;
	public int messageId;
	public UserInfo fromUser;
	public String message;
	public long createTime;
	
	public ChatMessage(UserInfo fromUser, String message) {
		this.fromUser=fromUser;
		this.message=message;
		messageId=counter;
		createTime=System.currentTimeMillis();
		counter++;
		
	}
	
	public static void createMessage(String sessionID, String message) {
		UserInfo fromUser = UserInfo.getUser(sessionID);
		ChatMessage msg=new ChatMessage(fromUser, message);
		allMessages.add(msg);
	}
	
	public static String getNewMessages(String sessionID) {
		UserInfo fromUser = UserInfo.getUser(sessionID);
		fromUser.lastCheckTime=0;
		
		StringBuffer result=new StringBuffer("==========Chat==========");
		
		for(ChatMessage msg: allMessages) {
			if(msg.createTime > fromUser.lastCheckTime  ) {
				result.append(";"+msg.fromUser.username+": "+msg.message);
			}
		}
		fromUser.lastCheckTime=System.currentTimeMillis();
		return result.toString();
	}
	
}

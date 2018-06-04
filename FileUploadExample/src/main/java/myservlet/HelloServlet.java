package myservlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloServlet extends HttpServlet{
	static final java.util.logging.Logger logger = Logger.getLogger(HelloServlet.class.getName());
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String cmd=req.getParameter("cmd");
			if("connect".equals(cmd)) {
				doCmdConnect(req, resp);
			}else if("sendMsg".equals(cmd)) {
				doCmdSendMsg(req, resp);
			}else if("checkMsg".equals(cmd)) {
				doCmdCheckMsg(req, resp);
			}
		}catch (Throwable e) {
			System.out.println(e.getMessage());
			sendResponse(resp, "error=true;errorMsg="+e.getMessage());
		}
	}

	private void doCmdConnect(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		String username=req.getParameter("username");
		logger.info(username+" is connected");
		UserInfo userInfo=new UserInfo(username);
		sendResponse(resp, "sessionID="+userInfo.sessionID);
	}

	private void sendResponse(HttpServletResponse resp, String responseMsg) throws IOException {
		ServletOutputStream outputStream = resp.getOutputStream();
		outputStream.print(responseMsg);
		outputStream.close();
	}
	private void doCmdSendMsg(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		String sessionID=req.getParameter("sessionID");
		if(sessionID==null) {
			throw new ServletException("sessionID not provided");
		}
		String message=req.getParameter("message");
		if(sessionID==null) {
			throw new ServletException("message not provided");
		}
		logger.info(message+" is send from "+sessionID);
		ChatMessage.createMessage(sessionID, message);
		sendResponse(resp, "send=OK");
	}
	private void doCmdCheckMsg(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		String sessionID=req.getParameter("sessionID");
		if(sessionID==null) {
			throw new ServletException("sessionID not provided");
		}
		String newMsgs=ChatMessage.getNewMessages(sessionID);
		logger.info(" check message is called newMsgs="+newMsgs);
		sendResponse(resp, newMsgs);
	}
}

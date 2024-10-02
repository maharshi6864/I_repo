package com.project.dto;

public class Response {
	
	private String message;
	
	private Object body;
	
	private boolean status;

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Object getBody() {
		return body;
	}

	public void setBody(Object body) {
		this.body = body;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public Response(String message, Object body, boolean status) {
		super();
		this.message = message;
		this.body = body;
		this.status = status;
	}
	
	

}

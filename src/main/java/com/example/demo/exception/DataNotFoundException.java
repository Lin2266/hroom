package com.example.demo.exception;


@SuppressWarnings("serial")
public class DataNotFoundException extends ModuleException {
	
	public DataNotFoundException() {
		super();
	}
	
	public DataNotFoundException(String message) {
		super(message);
	}
	
	public DataNotFoundException(String message, Throwable cause) {
		super(message, cause);
	}
	
	public DataNotFoundException(Throwable cause) {
		super(cause);
	}

}

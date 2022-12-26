package com.example.demo.exception;

@SuppressWarnings("serial")
public class ModuleException extends Exception {
	
	/**
	 * 用來記錄原始例外發生的地方
	 */
	private Throwable rootException;
	
	/**
	 * Default Constructor
	 */
	public ModuleException() {
		super();
	}
	
	/**
	 * 以指定的訊息來建構此例外物件
	 * @param errMsg
	 */
	public ModuleException(String errMsg) {
		super(errMsg);
	}
	
	/**
	 * 以指定的原始例外來建構此例外物件
	 * @param cause
	 */
	public ModuleException(Throwable cause) {
		super(cause.getMessage());
		initCause(cause);
		rootException = cause;
	}
	
	/**
	 * 以指定的訊息及原始例外來建構此例外物件
	 * @param message
	 * @param cause
	 */
	public ModuleException(String message, Throwable cause) {
		super(message, cause);
		initCause(cause);
		rootException = cause;
	}
	
	/**
	 * 取得原始的例外物件
	 * @return
	 */
	public Throwable getRootException() {
		return rootException;
	}

}

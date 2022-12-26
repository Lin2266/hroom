package com.example.demo.exception;

@SuppressWarnings("serial")
public class ErrorInputException extends ModuleException {

	/**
	 * append 訊息
	 */
	private StringBuffer sbf;
	
	/**
	 * 斷行符號
	 */
	private String newLine = System.lineSeparator();
	
	/**
	 * 狀態碼
	 */
	private int stateCode;
	
	/**
	 * 
	 */
	public ErrorInputException() {
		super();
		initStringBuffer();
	}
	
	/**
	 * 
	 * @param message
	 */
	public ErrorInputException(String message) {
		super(message);
		initStringBuffer();
		sbf.append(message);
	}
	
	/**
	 * 
	 * @param message
	 * @param stateCode
	 */
	public ErrorInputException(String message, int stateCode) {
		this(message);
		this.stateCode = stateCode;
	}
	
	/**
	 * 
	 * @param message
	 * @param cause
	 */
	public ErrorInputException(String message, Throwable cause) {
		super(message, cause);
		initStringBuffer();
		sbf.append(message);
	}
	
	/**
	 * 
	 * @param message
	 * @param cause
	 * @param stateCode
	 */
	public ErrorInputException(
		String message,
		Throwable cause,
		int stateCode) {
		this(message, cause);
		this.stateCode = stateCode;
	}
	
	public int getStateCode() {
		return stateCode;
	}
	
	/**
	 * 
	 * @param cause
	 */
	public ErrorInputException(Throwable cause) {
		super(cause);
		initStringBuffer();
		
	}
	
	/**
	 * 
	 */
	private void initStringBuffer() {
		if (sbf == null) {
			sbf = new StringBuffer();
		}
	}
	
	/**
	 * append 錯誤訊息
	 * @param msg
	 */
	public void appendMessage(String msg) {
		if (sbf.length() > 0) {
			sbf.append(newLine);
		}
		sbf.append(msg);
	}
	
	/**
	 * 回傳錯誤訊息, 內容為所有 appendMessage 的參數
	 */
	public String getMessage() {
		return sbf.toString();
	}
}

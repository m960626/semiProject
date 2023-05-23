package com.example.mini.model;

public class Board {
	/* T2_COMMUBOARD */
	private int cmNo;
	private String id;
	private String cmDate;
	private String cmTitle;
	private String cmCont;
	private int cmKind;
	private int cmCnt;
	private String delYn;
	private String nick;
	
	/* T2_COMMUBOARD */
	private int cmcoNo;
	private String cmcoDate;
	private String cmcoCont;
	
	private int cnt;
	private int commCnt;
	
	public int getCmNo() {
		return cmNo;
	}
	public void setCmNo(int cmNo) {
		this.cmNo = cmNo;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCmDate() {
		return cmDate;
	}
	public void setCmDate(String cmDate) {
		this.cmDate = cmDate;
	}
	public String getCmTitle() {
		return cmTitle;
	}
	public void setCmTitle(String cmTitle) {
		this.cmTitle = cmTitle;
	}
	public String getCmCont() {
		return cmCont;
	}
	public void setCmCont(String cmCont) {
		this.cmCont = cmCont;
	}
	public int getCmKind() {
		return cmKind;
	}
	public void setCmKind(int cmKind) {
		this.cmKind = cmKind;
	}
	public int getCmCnt() {
		return cmCnt;
	}
	public void setCmCnt(int cmCnt) {
		this.cmCnt = cmCnt;
	}
	public String getDelYn() {
		return delYn;
	}
	public void setDelYn(String delYn) {
		this.delYn = delYn;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public int getCmcoNo() {
		return cmcoNo;
	}
	public void setCmcoNo(int cmcoNo) {
		this.cmcoNo = cmcoNo;
	}
	public String getCmcoDate() {
		return cmcoDate;
	}
	public void setCmcoDate(String cmcoDate) {
		this.cmcoDate = cmcoDate;
	}
	public String getCmcoCont() {
		return cmcoCont;
	}
	public void setCmcoCont(String cmcoCont) {
		this.cmcoCont = cmcoCont;
	}
	public int getCommCnt() {
		return commCnt;
	}
	public void setCommCnt(int commCnt) {
		this.commCnt = commCnt;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
}

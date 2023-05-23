package com.example.mini.model;

import lombok.Data;

@Data
public class Matching {
	/* T2_MATCH */
	private int mNo;
	private String cNoH;
	private String cNoA;
	private String mTimeS;
	private String mTimeE;
	private String mDate;
	private int mStat;
	private String mGender;
	private String mGrade;
	private int scoreH;
	private int scoreA;
	private String mCont;
	private int mAge;
	private String mColor;

	/* T2_FIELD */
	private int fNo;
	private String fName;
	private String fLoc;
	private int fPrice;
	private int parking;
	private String showerYn;
	private String ballYn;
	private String vestYn;
	private String marketYn;
	private String smokeYn;
	
	/* T2_MATCHP */
	private String id;
	private int goal;
	private int assi;
	private int yCard;
	private int rCard;
	
	/* T2_USER */
	private String name;

	
	
	private int cnt;
	
	public int getmNo() {
		return mNo;
	}
	public void setmNo(int mNo) {
		this.mNo = mNo;
	}
	public String getcNoH() {
		return cNoH;
	}
	public void setcNoH(String cNoH) {
		this.cNoH = cNoH;
	}
	public String getcNoA() {
		return cNoA;
	}
	public void setcNoA(String cNoA) {
		this.cNoA = cNoA;
	}
	public String getmTimeS() {
		return mTimeS;
	}
	public void setmTimeS(String mTimeS) {
		this.mTimeS = mTimeS;
	}
	public String getmTimeE() {
		return mTimeE;
	}
	public void setmTimeE(String mTimeE) {
		this.mTimeE = mTimeE;
	}
	public String getmDate() {
		return mDate;
	}
	public void setmDate(String mDate) {
		this.mDate = mDate;
	}
	public int getmStat() {
		return mStat;
	}
	public void setmStat(int mStat) {
		this.mStat = mStat;
	}
	public String getmGender() {
		return mGender;
	}
	public void setmGender(String mGender) {
		this.mGender = mGender;
	}
	public String getmGrade() {
		return mGrade;
	}
	public void setmGrade(String mGrade) {
		this.mGrade = mGrade;
	}
	public String getmCont() {
		return mCont;
	}
	public void setmCont(String mCont) {
		this.mCont = mCont;
	}
	public int getmAge() {
		return mAge;
	}
	public void setmAge(int mAge) {
		this.mAge = mAge;
	}
	public String getmColor() {
		return mColor;
	}
	public void setmColor(String mColor) {
		this.mColor = mColor;
	}
	public int getfNo() {
		return fNo;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public void setfNo(int fNo) {
		this.fNo = fNo;
	}
	public String getfName() {
		return fName;
	}
	public void setfName(String fName) {
		this.fName = fName;
	}
	public String getfLoc() {
		return fLoc;
	}
	public void setfLoc(String fLoc) {
		this.fLoc = fLoc;
	}
	public int getfPrice() {
		return fPrice;
	}
	public void setfPrice(int fPrice) {
		this.fPrice = fPrice;
	}
	public int getParking() {
		return parking;
	}
	public void setParking(int parking) {
		this.parking = parking;
	}
	public String getShowerYn() {
		return showerYn;
	}
	public void setShowerYn(String showerYn) {
		this.showerYn = showerYn;
	}
	public String getBallYn() {
		return ballYn;
	}
	public void setBallYn(String ballYn) {
		this.ballYn = ballYn;
	}
	public String getVestYn() {
		return vestYn;
	}
	public void setVestYn(String vestYn) {
		this.vestYn = vestYn;
	}
	public String getMarketYn() {
		return marketYn;
	}
	public void setMarketYn(String marketYn) {
		this.marketYn = marketYn;
	}
	public String getSmokeYn() {
		return smokeYn;
	}
	public void setSmokeYn(String smokeYn) {
		this.smokeYn = smokeYn;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getGoal() {
		return goal;
	}
	public void setGoal(int goal) {
		this.goal = goal;
	}
	public int getAssi() {
		return assi;
	}
	public void setAssi(int assi) {
		this.assi = assi;
	}
	public int getyCard() {
		return yCard;
	}
	public void setyCard(int yCard) {
		this.yCard = yCard;
	}
	public int getrCard() {
		return rCard;
	}
	public void setrCard(int rCard) {
		this.rCard = rCard;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getScoreH() {
		return scoreH;
	}
	public void setScoreH(int scoreH) {
		this.scoreH = scoreH;
	}
	public int getScoreA() {
		return scoreA;
	}
	public void setScoreA(int scoreA) {
		this.scoreA = scoreA;
	}
}

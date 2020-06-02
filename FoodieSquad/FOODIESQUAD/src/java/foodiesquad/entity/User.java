package foodiesquad.entity;/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author hmqhmq
 */
public class User {
    private int uId;
    public  String uName;
    private String uPass;
    private String uTele;
    private String uGender;
    private String uAddress1;
    private String uAddress2;
    private String uAddress3;
    private double  uBalance;
    private int uType;
    private String uStudentNum;
    public String getuTele() {
        return uTele;
    }

    public void setuTele(String uTele) {
        this.uTele = uTele;
    }
    private int fId;
    public String getuName() {
        return uName;
    }

    public void setuName(String uName) {
        this.uName = uName;
    }

    public String getuPass() {
        return uPass;
    }

    public void setuPass(String uPass) {
        this.uPass = uPass;
    }

    public int getuType() {
        return uType;
    }

    public void setuType(int uType) {
        this.uType = uType;
    }
   

    public int getuId() {
        return uId;
    }

    public void setuId(int uId) {
        this.uId = uId;
    }

    public String getuGender() {
        return uGender;
    }

    public void setuGender( String  uGender) {
        this.uGender = uGender;
    }

    public String getuAddress1() {
        return uAddress1;
    }

    public void setuAddress1(String uAddress1) {
        this.uAddress1 = uAddress1;
    }

    public String getuAddress2() {
        return uAddress2;
    }

    public void setuAddress2(String uAddress2) {
        this.uAddress2 = uAddress2;
    }

    public String getuAddress3() {
        return uAddress3;
    }

    public void setuAddress3(String uAddress3) {
        this.uAddress3 = uAddress3;
    }

    public double getuBalance() {
        return uBalance;
    }

    public void setuBalance(double uBalance) {
        this.uBalance = uBalance;
    }

    public int getfId() {
        return fId;
    }

    public void setId(int Id) {
        this.fId = fId;
    }
   
    
    
    public User() {
	super();
		// TODO Auto-generated constructor stub
	}
	
       public User(int uId, String uName, String uPass, double balance, int uType) {
		super();
		this.uId = uId;
		this.uName = uName;
		this.uPass = uPass;
		this.uBalance = balance;
		this.uType = uType;
	}

	public User(String uName, String uPass, int uType) {
		super();
		this.uName = uName;
		this.uPass = uPass;
		this.uType = uType;
	}

	public User(String uName, String uPass, double balance) {
		super();
		this.uName = uName;
		this.uPass = uPass;
		this.uBalance = balance;
	}
	public User(String uName, String uPass, double balance, int uType) {
		super();
		this.uName = uName;
		this.uPass = uPass;
		this.uBalance = balance;
		this.uType = uType;
	}
	
	
    
}

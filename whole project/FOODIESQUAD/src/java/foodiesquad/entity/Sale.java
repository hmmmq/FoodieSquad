/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package foodiesquad.entity;

/**
 *
 * @author hmqhmq
 */
public class Sale {
    int sId;
    String sName;
    String sDescription;
    String sBegin;
    String sEnd;
    int cId;
Sale(){
super();}
    public int getsId() {
        return sId;
    }

    public void setsId(int sId) {
        this.sId = sId;
    }

    public String getsName() {
        return sName;
    }

    public void setsName(String sName) {
        this.sName = sName;
    }

    public String getsDescription() {
        return sDescription;
    }

    public void setsDescription(String sDescription) {
        this.sDescription = sDescription;
    }

    public String getsBegin() {
        return sBegin;
    }

    public void setsBegin(String sBegin) {
        this.sBegin = sBegin;
    }

    public String getsEnd() {
        return sEnd;
    }

    public void setsEnd(String sEnd) {
        this.sEnd = sEnd;
    }

    public int getcId() {
        return cId;
    }

    public void setcId(int cId) {
        this.cId = cId;
    }
public Sale( int sId,
    String sName,
    String sDescription,
    String sBegin,
    String sEnd,
    int cId){
 
   this.sId=sId;
   this.sName=sName;
 this.sDescription=sDescription;
this.sBegin=sBegin;
this.sEnd=sEnd;
 this.cId=cId;
}
}

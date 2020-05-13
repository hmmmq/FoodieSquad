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
public class Canteen {
    int cId;
    String cName;
    String cTele;
    String cAddress;
    String cPayType;
 public Canteen(){	super();}
    public int getcId() {
        return cId;
    }

    public void setcId(int cId) {
        this.cId = cId;
    }

    public String getcName() {
        return cName;
    }

    public void setcName(String cName) {
        this.cName = cName;
    }

    public String getcTele() {
        return cTele;
    }

    public void setcTele(String cTele) {
        this.cTele = cTele;
    }

    public String getcAddress() {
        return cAddress;
    }

    public void setcAddress(String cAddress) {
        this.cAddress = cAddress;
    }

    public String getcPayType() {
        return cPayType;
    }

    public void setcPayType(String cPayType) {
        this.cPayType = cPayType;
    }
   public Canteen(int cId,
    String cName,
    String cTele,
    String cAddress,
    String cPayType){
       super();
        this.cName=cName;
        this.cTele=cTele;
        this.cAddress=cAddress;
        this.cPayType=cPayType;
        }
}

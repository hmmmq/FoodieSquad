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
public class Deliver {
    int dId;
    String dName;
    String dTele;
Deliver(){}
    public int getdId() {
        return dId;
    }

    public void setdId(int dId) {
        this.dId = dId;
    }

    public String getdName() {
        return dName;
    }

    public void setdName(String dName) {
        this.dName = dName;
    }

    public String getdTele() {
        return dTele;
    }

    public void setdTele(String dTele) {
        this.dTele = dTele;
    }
   public  Deliver(int dId,
    String dName,
    String dTele){
         super();
      this.dId=dId;
      this. dName=dName;
    this. dTele=dTele;
     }
    
}

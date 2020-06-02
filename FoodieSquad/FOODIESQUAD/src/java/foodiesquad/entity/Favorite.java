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
public class Favorite {
  int  fId;
    int  uId;
    int  cId1;
    int  cId2;
    int  cId3;
    int  cId4;
    public int getfId() {
        return fId;
    }

    public void setfId(int fId) {
        this.fId = fId;
    }

    public int getuId() {
        return uId;
    }

    public void setuId(int uId) {
        this.uId = uId;
    }

    public int getcId1() {
        return cId1;
    }

    public void setcId1(int cId1) {
        this.cId1 = cId1;
    }

    public int getcId2() {
        return cId2;
    }

    public void setcId2(int cId2) {
        this.cId2 = cId2;
    }

    public int getcId3() {
        return cId3;
    }

    public void setcId3(int cId3) {
        this.cId3 = cId3;
    }

    public int getcId4() {
        return cId4;
    }

    public void setcI4(int cId4) {
        this.cId4 = cId4;
    }
    Favorite(){
        
    }
    
  public   Favorite(  int  fId,
    int  uId,
    int  cId1,
    int  cId2,
    int  cId3,
    int  cId4){
  this.fId=fId;
  this.uId=uId;
  this.cId1=cId1;
  this. cId2=cId2;
  this. cId3=cId3;
  this. cId4=cId4;
        
    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package foodiesquad.entity;

import java.sql.Date;

/**
 *
 * @author wolf
 */
public class Order {
    private int oId;
    private String oStatus;
    private Date oOrderTIme;
    private Date oTakeTime;
    private String oType;
    private Date oArriveTime;
    private String oAddress;
    private int dId;
    private int uId;

    public int getoId() {
        return oId;
    }

    public void setoId(int oId) {
        this.oId = oId;
    }

    public String getoStatus() {
        return oStatus;
    }

    public void setoStatus(String oStatus) {
        this.oStatus = oStatus;
    }

    public Date getoOrderTIme() {
        return oOrderTIme;
    }

    public void setoOrderTIme(Date oOrderTIme) {
        this.oOrderTIme = oOrderTIme;
    }

    public Date getoTakeTime() {
        return oTakeTime;
    }

    public void setoTakeTime(Date oTakeTime) {
        this.oTakeTime = oTakeTime;
    }

    public String getoType() {
        return oType;
    }

    public void setoType(String oType) {
        this.oType = oType;
    }

    public Date getoArriveTime() {
        return oArriveTime;
    }

    public void setoArriveTime(Date oArriveTime) {
        this.oArriveTime = oArriveTime;
    }

    public String getoAddress() {
        return oAddress;
    }

    public void setoAddress(String oAddress) {
        this.oAddress = oAddress;
    }

    public int getdId() {
        return dId;
    }

    public void setdId(int dId) {
        this.dId = dId;
    }

    public int getuId() {
        return uId;
    }

    public void setuId(int uId) {
        this.uId = uId;
    }

    public Order() {
        super();
    }
 public   Order( 
 
            int oId,
 String oStatus,
Date oOrderTIme,
Date oTakeTime,
String oType,
 Date oArriveTime,
String oAddress,
int dId,
int uId){
        super();
       this.oId=oId;
 this. oStatus=oStatus;
this. oOrderTIme=oOrderTIme;
this.oTakeTime=oTakeTime;
this. oType= oType;
 this. oArriveTime=oArriveTime;
this. oAddress=oAddress;
this.dId=dId;
this.uId=uId;
        
     
    }
}

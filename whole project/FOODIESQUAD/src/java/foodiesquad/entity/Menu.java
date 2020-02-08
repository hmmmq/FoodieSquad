/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package foodiesquad.entity;

import java.io.File;

/**
 *
 * @author wolf
 */
public class Menu {
 int mId;
 String mName;
 double mPirce;
 String mDescription;
String mType;
 File mPicture;
 int cId;

    public int getmId() {
        return mId;
    }

    public void setmId(int mId) {
        this.mId = mId;
    }

    public String getmName() {
        return mName;
    }

    public void setmName(String mName) {
        this.mName = mName;
    }

    public double getmPirce() {
        return mPirce;
    }

    public void setmPirce(double mPirce) {
        this.mPirce = mPirce;
    }

    public String getmDescription() {
        return mDescription;
    }

    public void setmDescription(String mDescription) {
        this.mDescription = mDescription;
    }

    public String getmType() {
        return mType;
    }

    public void setmType(String mType) {
        this.mType = mType;
    }

    public File getmPicture() {
        return mPicture;
    }

    public void setmPicture(File mPicture) {
        this.mPicture = mPicture;
    }

    public int getcId() {
        return cId;
    }

    public void setcId(int cId) {
        this.cId = cId;
    }

    public Menu() {
        super();
    }
    
   public Menu(int mId,
 String mName,
 double mPirce,
 String mDescription,
String mType,
 File mPicture,
 int cId){
super();
    this. mId=mId;
this. mName=mName;
 this.mPirce=mPirce;
 
this.mDescription=mDescription;
this. mType= mType;

this. mPicture=mPicture;
 this. cId=cId;
    
}
}
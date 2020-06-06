package com.niit.pojo;

public class FavoriteCanteen {

    private Integer favoriteCanteenId;

	

	public Integer getFavoriteCanteenId() {
		return favoriteCanteenId;
	}

	public void setFavoriteCanteenId(Integer favoriteCanteenId) {
		this.favoriteCanteenId = favoriteCanteenId;
	}

	

	private Integer favoriteId;

    private Canteen canteenId;

    public Integer getFavoriteId() {
        return favoriteId;
    }

    public void setFavoriteId(Integer favoriteId) {
        this.favoriteId = favoriteId;
    }

	public Canteen getCanteenId() {
		return canteenId;
	}

	public void setCanteenId(Canteen canteenId) {
		this.canteenId = canteenId;
	}

	public FavoriteCanteen() {
		super();
		// TODO Auto-generated constructor stub
	}

	public FavoriteCanteen(Integer favoriteId, Canteen canteenId) {
		super();
		this.favoriteId = favoriteId;
		this.canteenId = canteenId;
	}

   
}
package com.niit.pojo;

public class Favorite {
    private Integer favoriteId;

    private Integer userId;
    
  

    public Integer getFavoriteId() {
        return favoriteId;
    }

    public void setFavoriteId(Integer favoriteId) {
        this.favoriteId = favoriteId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

	public Favorite(Integer favoriteId, Integer userId) {
		super();
		this.favoriteId = favoriteId;
		this.userId = userId;
	}

	public Favorite() {
		super();
		// TODO Auto-generated constructor stub
	}
    
    
    
    
}
package com.niit.pojo;

public class FavoriteDish {
	
    private Integer favoriteDishId;



	private Integer favoriteId;



	public Dish getDishId() {
		return dishId;
	}



	public Integer getFavoriteDishId() {
		return favoriteDishId;
	}



	public void setFavoriteDishId(Integer favoriteDishId) {
		this.favoriteDishId = favoriteDishId;
	}



	
	public Integer getFavoriteId() {
		return favoriteId;
	}



	public void setFavoriteId(Integer favoriteId) {
		this.favoriteId = favoriteId;
	}



	private Dish dishId;
 
  


	public void setDishId(Dish dishId) {
		this.dishId = dishId;
	}





	public FavoriteDish(Dish dishId, Integer favoriteId) {
		super();
		this.dishId = dishId;
		this.favoriteId = favoriteId;
	}



	public FavoriteDish() {
		super();
		// TODO Auto-generated constructor stub
	}

  

   
}
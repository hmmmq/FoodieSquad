package com.niit.pojo;

public class CartItem {
    private Integer cartItemId;

    private Integer cartId;

    private Dish dishId;

    public Dish getDishId() {
		return dishId;
	}

	public void setDishId(Dish dishId) {
		this.dishId = dishId;
	}

	private Integer dishCount;

    public Integer getCartItemId() {
        return cartItemId;
    }

    public void setCartItemId(Integer cartItemId) {
        this.cartItemId = cartItemId;
    }

    public Integer getCartId() {
        return cartId;
    }

    public void setCartId(Integer cartId) {
        this.cartId = cartId;
    }

  

    public Integer getDishCount() {
        return dishCount;
    }

    public void setDishCount(Integer dishCount) {
        this.dishCount = dishCount;
    }
}
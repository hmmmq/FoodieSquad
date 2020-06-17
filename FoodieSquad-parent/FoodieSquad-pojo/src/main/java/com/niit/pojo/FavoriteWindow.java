package com.niit.pojo;

public class FavoriteWindow {
    private Integer favoriteWindowId;





	public Integer getFavoriteWindowId() {
		return favoriteWindowId;
	}

	public void setFavoriteWindowId(Integer favoriteWindowId) {
		this.favoriteWindowId = favoriteWindowId;
	}

	

	private Window windowId;

    private Integer favoriteId;

    

    public Window getWindowId() {
		return windowId;
	}

	public void setWindowId(Window windowId) {
		this.windowId = windowId;
	}

	public Integer getFavoriteId() {
        return favoriteId;
    }

    public FavoriteWindow() {
		super();
		// TODO Auto-generated constructor stub
	}

	public void setFavoriteId(Integer favoriteId) {
        this.favoriteId = favoriteId;
    }

	public FavoriteWindow(Window windowId, Integer favoriteId) {
		super();
		this.windowId = windowId;
		this.favoriteId = favoriteId;
	}
}
package com.niit.pojo;

public class Comments {
    private Integer commentId;

    private Integer userId;

    private Integer canteenId;

    private String canteenComment;

    private Integer windowId;

    private String windowComment;

    private Integer dishId;

    private String dishComment;

    private String commentType;

    public Integer getCommentId() {
        return commentId;
    }

    public void setCommentId(Integer commentId) {
        this.commentId = commentId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getCanteenId() {
        return canteenId;
    }

    public void setCanteenId(Integer canteenId) {
        this.canteenId = canteenId;
    }

    public String getCanteenComment() {
        return canteenComment;
    }

    public void setCanteenComment(String canteenComment) {
        this.canteenComment = canteenComment;
    }

    public Integer getWindowId() {
        return windowId;
    }

    public void setWindowId(Integer windowId) {
        this.windowId = windowId;
    }

    public String getWindowComment() {
        return windowComment;
    }

    public void setWindowComment(String windowComment) {
        this.windowComment = windowComment;
    }

    public Integer getDishId() {
        return dishId;
    }

    public void setDishId(Integer dishId) {
        this.dishId = dishId;
    }

    public String getDishComment() {
        return dishComment;
    }

    public void setDishComment(String dishComment) {
        this.dishComment = dishComment;
    }

    public String getCommentType() {
        return commentType;
    }

    public void setCommentType(String commentType) {
        this.commentType = commentType;
    }
    
    public Comments canteenComments(Integer userId, Integer canteenId, String canteenComment, String commentType) {
    	Comments canteencomments=new Comments();
    	canteencomments.userId = userId;
    	canteencomments.canteenId = canteenId;
    	canteencomments.canteenComment = canteenComment;
    	canteencomments.commentType = commentType;
    	return canteencomments;
    }

    
    public Comments windowComments(Integer userId, Integer windowId, String windowComment, String commentType) {
    	Comments windowComments=new Comments();
    	windowComments.userId = userId;
    	windowComments.windowId = windowId;
    	windowComments.windowComment = windowComment;
    	windowComments.commentType = commentType;
    	return windowComments;
	}

    public Comments dishComments(Integer userId, Integer dishId, String dishComment, String commentType) {
    	Comments dishComments=new Comments();
		dishComments.userId = userId;
		dishComments.dishId = dishId;
		dishComments.dishComment = dishComment;
		dishComments.commentType = commentType;
		return dishComments;
	}

public Comments() {
		super();
		
	}

	
}
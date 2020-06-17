package com.niit.pojo;

public class Permission {
    @Override
	public String toString() {
		return "Permission [id=" + id + ", permname=" + permname + ", permtag=" + permtag + "]";
	}

	private Integer id;

    private String permname;

    private String permtag;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPermname() {
        return permname;
    }

    public void setPermname(String permname) {
        this.permname = permname;
    }

    public String getPermtag() {
        return permtag;
    }

    public void setPermtag(String permtag) {
        this.permtag = permtag;
    }
}
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package foodiesquad.dao;

import foodiesquad.entity.Menu;

/**
 *
 * @author wolf
 */
public interface MenuDao {
        public boolean addMenu(Menu menu);//增加菜单，参数为菜单实体，返回布尔变量
	public boolean delMenu(Menu menu);//删除菜单，参数为菜单实体，返回布尔变量
	public boolean updateMenu(Menu menu);//更新菜单,参数为菜单实体，返回布尔变量
        public Menu queryMenu(Menu menu);//查询菜单，参数为菜单实体，返回菜单实体
}

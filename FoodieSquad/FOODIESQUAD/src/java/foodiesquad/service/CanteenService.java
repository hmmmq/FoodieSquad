/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package foodiesquad.service;

import foodiesquad.entity.Canteen;
import foodiesquad.entity.Menu;
import java.util.List;

/**
 *
 * @author hmqhmq
 */
public interface CanteenService {
        public int addCanteen(Canteen Canteen);
	public boolean delCanteen(int cId);
	public boolean updateCanteen(Canteen Canteen);
	 public List<Menu> queryMenuById(int cId);
        public List<Canteen> queryAllCanteen();
	public Canteen queryCanteenById(int cId);
	public List<Canteen> queryCanteenByCanteenName(String cName);
	public List<Canteen> queryCanteenByCanteenAddress(String cAddress);
	public List<Canteen> queryCanteenByCanteenNameAndCanteenAddress(String cName, String cAddress);
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package foodiesquad.service;


import foodiesquad.entity.Sale;
import java.util.List;

/**
 *
 * @author hmqhmq
 */
public interface SaleService {
     public int addSale(Sale Sale);
	public boolean delSale(int fId);
	public boolean updateSale(Sale Sale);
	
        public List<Sale> queryAllSale();
	public Sale querySaleBysId(int sId);
	public List<Sale> querySaleBycId(int cId);
        public List<Sale> querySaleBysName(String sName);
   
}

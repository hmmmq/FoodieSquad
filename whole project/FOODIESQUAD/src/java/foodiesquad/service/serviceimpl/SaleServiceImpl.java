/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package foodiesquad.service.serviceimpl;

import foodiesquad.dao.SaleDao;
import foodiesquad.dao.UserDao;
import foodiesquad.dao.impl.SaleDaoImpl;
import foodiesquad.entity.Sale;
import foodiesquad.service.SaleService;
import java.util.List;

/**
 *
 * @author hmqhmq
 */
public class SaleServiceImpl implements SaleService{
 private SaleDao SaleDao;
    SaleServiceImpl(){
        SaleDao=new SaleDaoImpl();
    }

    @Override
    public int addSale(Sale Sale) {
        Sale s=SaleDao.querySaleBysId(Sale.getsId());
		if(s==null) {
			boolean res_add=SaleDao.addSale(Sale);
			if(res_add) {
				return 1;//添加成功
			}else {
				return 2;//添加失败
			}
		}
		return 3;//添加失败 //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean delSale(int fId) {
     return SaleDao.delSale( fId); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean updateSale(Sale Sale) {
      return  SaleDao.updateSale( Sale) ; //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Sale> queryAllSale() {
       return SaleDao.queryAllSale(); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Sale querySaleBysId(int sId) {
      return SaleDao.querySaleBysId(sId); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Sale> querySaleBycId(int cId) {
        return SaleDao.querySaleBycId( cId); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Sale> querySaleBysName(String sId) {
      return SaleDao.querySaleBysName(sId);//To change body of generated methods, choose Tools | Templates.
    }
}

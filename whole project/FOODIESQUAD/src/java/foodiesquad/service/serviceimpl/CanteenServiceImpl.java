/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package foodiesquad.service.serviceimpl;

import foodiesquad.dao.CanteenDao;
import foodiesquad.dao.UserDao;
import foodiesquad.dao.impl.CanteenDaoImpl;
import foodiesquad.entity.Canteen;
import foodiesquad.entity.Menu;
import foodiesquad.service.CanteenService;
import java.util.List;

/**
 *
 * @author hmqhmq
 */
public class CanteenServiceImpl implements CanteenService {
    public CanteenDao CanteenDao;
    public CanteenServiceImpl(){
        CanteenDao=new CanteenDaoImpl();
    }

    @Override
    public int addCanteen(Canteen Canteen) {
       Canteen s=CanteenDao.queryCanteen(Canteen);
		if(s==null) {
			boolean res_add=CanteenDao.addCanteen(Canteen);
			if(res_add) {
				return 1;//添加成功
			}else {
				return 2;//添加失败
			}
		}
		return 3;//添加失败 //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean delCanteen(int cid) {
       return CanteenDao.delCanteen(cid); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean updateCanteen(Canteen Canteen) {
       return CanteenDao.updateCanteen(Canteen); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Canteen> queryAllCanteen() {
       return CanteenDao.queryAllCanteen(); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Canteen queryCanteenById(int cId) {
      return CanteenDao.queryCanteenById(cId); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Canteen> queryCanteenByCanteenName(String cName) {
      return CanteenDao.queryCanteenByCanteenName(cName); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Canteen> queryCanteenByCanteenAddress(String cAddress) {
      return CanteenDao.queryCanteenByCanteenAddress(cAddress); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Canteen> queryCanteenByCanteenNameAndCanteenAddress(String cName, String cAddress) {
       return CanteenDao.queryCanteenByCanteenNameAndCanteenAddress(cName, cAddress); //To change body of generated methods, choose Tools | Templates.
    }
    public List<Menu> queryMenuById(int cId) {
      return CanteenDao.queryMenuById(cId); //To change body of generated methods, choose Tools | Templates.
    }


  
}

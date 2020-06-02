/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package foodiesquad.service.serviceimpl;

import foodiesquad.dao.DeliverDao;
import foodiesquad.dao.UserDao;
import foodiesquad.dao.impl.DeliverDaoImpl;
import foodiesquad.dao.impl.UserDaoImpl;
import foodiesquad.entity.Deliver;
import foodiesquad.service.DeliverService;
import java.util.List;

/**
 *
 * @author hmqhmq
 */
public class DeliverServiceImpl implements DeliverService {
   
   private DeliverDao DeliverDao;
    DeliverServiceImpl(){
        DeliverDao=new DeliverDaoImpl();
    }

    @Override
    public int addDeliver(Deliver Deliver) {
       Deliver s=DeliverDao.queryDeliverById(Deliver.getdId());
		if(s==null) {
			boolean res_add=DeliverDao.addDeliver(Deliver);
			if(res_add) {
				return 1;//添加成功
			}else {
				return 2;//添加失败
			}
		}
		return 3;//添加失败 //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean delDeliver(int dId) {
      return  DeliverDao.delDeliver(dId); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean updateDeliver(Deliver Deliver) {
       return  DeliverDao.updateDeliver( Deliver); //To change body of generated methods, choose Tools | Templates.
    }

 

    @Override
    public Deliver queryDeliverById(int dId) {
      return  DeliverDao.queryDeliverById(dId); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Deliver queryDeliverBydName(String dName) {
       return DeliverDao.queryDeliverBydName( dName); //To change body of generated methods, choose Tools | Templates.
    }

  
}

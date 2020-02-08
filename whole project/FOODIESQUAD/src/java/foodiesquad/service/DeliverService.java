/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package foodiesquad.service;


import foodiesquad.entity.Deliver;
import java.util.List;

/**
 *
 * @author hmqhmq
 */
public interface DeliverService {
        public int addDeliver(Deliver Deliver);
	public boolean delDeliver(int dId);
	public boolean updateDeliver(Deliver Deliver);
	
        public Deliver queryDeliverById(int dId);
	public Deliver queryDeliverBydName(String dName);
	
	
}

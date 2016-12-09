package ua.service;

import java.util.List;

import ua.shop_e.Buy;
import ua.shop_e.MyOrder;

public interface BuyService {
	
	List <Buy> findAll();
	
	void save(Buy form);
	
	void delete(int id);

	Buy findById(int id);

	void addOrder(MyOrder myorder);
}

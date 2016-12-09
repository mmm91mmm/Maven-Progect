package ua.implementation;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ua.repository.MyOrderRepository;
import ua.repository.ProductRepository;
import ua.repository.SizeRepository;
import ua.service.MyOrderService;
import ua.shop_e.MyOrder;
import ua.shop_e.Product;
import ua.shop_e.Size;

@Service
public class MyOrderServiceImpl implements MyOrderService {

	@Autowired
	private  MyOrderRepository  myOrderRepository;

	@Autowired
	private  ProductRepository  productRepository;
	
	@Autowired
	private  SizeRepository  sizeRepository;
	
	
	@Override
	public void delete(int id) {
		myOrderRepository.delete(id);
		
	}

	@Override
	public List<MyOrder> findAll() {
		return myOrderRepository.findAll();
	}

	

	@Override
	public MyOrder findOne(int id) {
		return myOrderRepository.findOne(id);
	}

	@Override
	@Transactional
	public void save(int productId, MyOrder myOrder, String sizeName) {
		Product product = productRepository.findOne(productId);	
		Size size = sizeRepository.findByName(sizeName);
		myOrder.setProduct(product);
		myOrder.setSize(size);
	}

}

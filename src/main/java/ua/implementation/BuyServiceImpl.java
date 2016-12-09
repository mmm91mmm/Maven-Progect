package ua.implementation;

import java.security.Principal;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ua.repository.BuyRepository;
import ua.service.BuyService;
import ua.shop_e.Buy;
import ua.shop_e.MyOrder;
import ua.shop_e.Product;

@Service
public class BuyServiceImpl implements BuyService {

	@Resource
	private  BuyRepository  buyRepository;
	
	@Override
	public List<Buy> findAll() {
		return buyRepository.findAll();
	}

	@Override
	public void save(Buy form) {
		Buy buy = new Buy();
		buy.setId(form.getId());
		buy.setOrders(form.getOrders());
		buyRepository.save(buy);
	}

	@Override
	public void delete(int id) {
		buyRepository.delete(id);	
	}

	@Override
	public Buy findById(int id) {
		return buyRepository.findById(id);
	}

	@Override
	public void addOrder(MyOrder myorder) {
		
		
	}
//	@Override
//	@Transactional
//	public void addSizes(int productId, String sizeName) {
//		Product product = productRepository.findOne(productId);
//		if (!product.getSizes().contains(sizeName)){
//		product.getSizes().add(sizeRepository.findByName(sizeName));
//		productRepository.save(product);
//		}
//	}


}

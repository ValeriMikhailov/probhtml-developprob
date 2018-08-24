package test.com.service.impl;

import test.com.dao.OrderDao;
import test.com.entity.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import test.com.service.OrderService;

import java.util.List;

@Service("orderService")
public class OrderServiceImpl implements OrderService {
    @Autowired
    private OrderDao orderDao;

//    @Override
    public Order addOrder(Order order) {
        return orderDao.create(order);
    }

//    @Override
    public Order getById(long id) {
        return orderDao.getById(id);
    }

//    @Override
    public Order delete(long id) {
        Order orderForDelete = orderDao.getById(id);
        return orderDao.delete(orderForDelete);
    }

//    @Override
    public List<Order> getList() {
        return orderDao.getList();
    }

//    @Override
    public Order update(Order order) {
        return orderDao.update(order);
    }
}

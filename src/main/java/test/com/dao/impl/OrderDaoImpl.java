package test.com.dao.impl;

import test.com.dao.OrderDao;
import test.com.entity.Order;

public class OrderDaoImpl extends BasicDaoImpl<Order> implements OrderDao {

    public OrderDaoImpl(Class<Order> entityClass) {
        super(entityClass);
    }
}

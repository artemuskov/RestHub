package com.kh013j;

import com.kh013j.model.domain.Order;
import com.kh013j.model.domain.Role;
import com.kh013j.model.domain.User;
import com.kh013j.model.exception.DishNotFound;
import com.kh013j.model.repository.OrderRepository;
import com.kh013j.model.service.interfaces.OrderService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.util.Assert;

import java.sql.Timestamp;

@RunWith(SpringRunner.class)
@DataJpaTest
public class OrderDishRepositoryTest {
    @Autowired
    private OrderRepository orderRepository;

    @Autowired
    private OrderService orderService;

    private Order order = new Order();

    @Test
    public void isOrderAdded() {
        Assert.notNull(orderRepository.save(order));
    }

    @Test
    public void isOrderDeleted() throws DishNotFound {
        Assert.notNull(orderService.delete(1L));
    }

    @Test
    public void isOrdersEqual() {
        User user = new User(1, "amely.honey@gmail.com", "Kitten", "fghj", "confirmationtoken77777", true, new Role(1, "Admin"));

        Timestamp time = new Timestamp(22L);

        order = new Order(2, time, user, 1, false, null, new User());
        orderService.create(order);

        Assert.isTrue(order.equals(orderRepository.findOne(2L)));
    }

}

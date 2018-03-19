package com.kh013j.model.service;

import com.kh013j.model.domain.Dish;
import com.kh013j.model.domain.Order;
import com.kh013j.model.domain.OrderedDish;
import com.kh013j.model.domain.Status;
import com.kh013j.model.exception.CategoryNotFound;
import com.kh013j.model.exception.DishNotFound;
import com.kh013j.model.repository.OrderedDishRepository;
import com.kh013j.model.service.interfaces.DishService;
import com.kh013j.model.service.interfaces.OrderedDishService;
import com.kh013j.model.service.interfaces.StatusService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class OrderedDishServiceImpl implements OrderedDishService {
    @Resource
    private OrderedDishRepository orderedDishRepository;
    @Autowired
    private StatusService statusService;

    @Override
    @Transactional
    public OrderedDish create(OrderedDish orderedDish) {
        return orderedDishRepository.save(orderedDish);
    }

    @Override
    @Transactional(rollbackFor = CategoryNotFound.class)
    public OrderedDish delete(long id) throws DishNotFound {
        OrderedDish deletedOrderedDish = orderedDishRepository.findOne(id);

        if (orderedDishRepository == null)
            throw new DishNotFound();

        orderedDishRepository.delete(deletedOrderedDish);
        return deletedOrderedDish;
    }


    @Override
    @Transactional
    public OrderedDish findById(long id) {
        return orderedDishRepository.findOne(id);
    }

    @Override
    public List<OrderedDish> findAllByStatusIn(List<Status> statuses) {
        return orderedDishRepository.findAllByStatusIn(statuses);
    }

    public List<OrderedDish> findAllForCooker() {
        return orderedDishRepository.findAllByStatusIn(statusService.cookersStatuses());
    }


    @Override
    @Transactional
    public void setDone(long id) {
        OrderedDish dish = orderedDishRepository.findOne(id);
        dish.setStatus(statusService.nextStatus(dish.getStatus()));
        orderedDishRepository.saveAndFlush(dish);
    }

    @Override
    @Transactional
    public List<OrderedDish> findAll() {
        return orderedDishRepository.findAll();
    }

    @Override
    @Transactional
    public void setCooking(long id) {
        OrderedDish dish = orderedDishRepository.findOne(id);
        dish.setStatus(statusService.nextStatus(dish.getStatus()));
        orderedDishRepository.saveAndFlush(dish);
    }
    @Override
    @Transactional
    public void setDelivered(long id) {
        OrderedDish dish = orderedDishRepository.findOne(id);
        dish.setStatus(statusService.nextStatus(dish.getStatus()));
        orderedDishRepository.saveAndFlush(dish);
    }

    public List<OrderedDish> createOrderedDishesFromMap(Map<Dish, Integer> orderMap) {
        List<OrderedDish> orderedDishes = new ArrayList<>();
        for (Map.Entry<Dish, Integer> entry : orderMap.entrySet()) {
            orderedDishes.add(createOrderedDishFromDish(entry.getKey(), entry.getValue()));
        }
        return orderedDishes;
    }

    public OrderedDish createOrderedDishFromDish(Dish dish, int quantity) {
        OrderedDish orderedDish = new OrderedDish();
        orderedDish.setDish(dish);
        orderedDish.setQuantity(quantity);
        orderedDish.setStatus(statusService.create());
        return orderedDish;
    }
}

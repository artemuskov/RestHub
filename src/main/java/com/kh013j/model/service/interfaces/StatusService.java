package com.kh013j.model.service.interfaces;

import com.kh013j.model.domain.Role;
import com.kh013j.model.domain.Status;
import com.kh013j.model.exception.DishNotFound;

import java.util.List;

public interface StatusService {
    Status create(Status role);
    void delete(long id);
    List findAll();
    Status update(Status role);
    Status findById(long id);
    Status findByName(String name);
}

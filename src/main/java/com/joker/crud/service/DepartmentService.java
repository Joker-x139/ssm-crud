package com.joker.crud.service;

import com.joker.crud.bean.Department;
import com.joker.crud.dao.DepartmentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Joker
 * @date 2021/11/29-15:02
 */
@Service
public class DepartmentService {
    @Autowired
    private DepartmentMapper departmentMapper;

    public List<Department> getDepts() {
        List<Department> depts = departmentMapper.selectByExample(null);
        return depts;
    }
}

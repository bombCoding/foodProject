package com.nutFruit.food.service.impl;

import com.nutFruit.food.domain.DocTest;
import com.nutFruit.food.mapper.DocTestMapper;
import com.nutFruit.food.service.IDocTestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DocTestServiceImpl implements IDocTestService {
    @Autowired
    private DocTestMapper mapper;

    @Override
    public int deleteByPrimaryKey(Long id) {
        return mapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(DocTest record) {
        return mapper.insert(record);
    }

    @Override
    public DocTest selectByPrimaryKey(Long id) {
        return mapper.selectByPrimaryKey(id);
    }

    @Override
    public List<DocTest> selectAll() {
        return mapper.selectAll();
    }

    @Override
    public int updateByPrimaryKey(DocTest record) {
        return mapper.updateByPrimaryKey(record);
    }
}

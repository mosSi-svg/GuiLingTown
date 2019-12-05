package service;

import mapper.CategoryMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service


public class CategoryService {
    @Resource
    CategoryMapper categoryMapper;





}

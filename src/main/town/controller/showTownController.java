package controller;

import mapper.CommentMapper;
import mapper.TowImageMapper;
import mapper.TownMapper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import pojo.TowImage;

import javax.annotation.Resource;

@Controller
@RequestMapping("")
public class showTownController {
    @Resource
    TownMapper  townMapper;

    @Resource
    TowImageMapper  towImageMapper;

    @Resource
    CommentMapper  commentMapper;



}

package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import mapper.CommentMapper;
import mapper.UserMapper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;
import pojo.User;
import pojo.UserExample;
import com.alibaba.fastjson.JSONObject;
import util.result;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("")
public class userController {

    @Resource
    UserMapper  userMapper;
    @Resource
    CommentMapper  commentMapper;
    @ResponseBody
    @RequestMapping("login")
    public String login(User user , HttpSession session){

        UserExample ue = new UserExample();
        ue.createCriteria().andNameEqualTo(user.getName()).andPasswordEqualTo(user.getPassword());
        List<User> ls = userMapper.selectByExample(ue);
        JSONObject json= new JSONObject();
        result Result = new result();
        if( ls.size() < 1 ){
            Result.setResult("false");
            json.put("result", JSONObject.toJSON(Result));
            return json.toJSONString();
        }
        else {
            user = ls.get(0);
            session.setAttribute("user",user);
            Result.setResult("true");
            json.put("result", JSONObject.toJSON(Result));
            return json.toJSONString();
        }
    }
    @ResponseBody
    @RequestMapping("register")
    public String  register(  User user ) {
        List<User> us = userMapper.selectByExample(new UserExample());
        boolean exit = false;
        for (User u : us) {
            if (u.getName().equals(user.getName())) {
                exit = true;
                break;
            }
        }
        JSONObject json= new JSONObject();

        result Result = new result();
        if (exit)
            Result.setResult("true");
        else {
            userMapper.insert(user);
            Result.setResult("false");
        }
        json.put("result", JSONObject.toJSON(Result));
        return json.toJSONString();
    }
}

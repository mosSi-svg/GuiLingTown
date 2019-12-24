package controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import mapper.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import pojo.*;
import util.MapUtil;
import util.Page;
import util.uploadImageFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("")
public class showTownController {
    @Resource
    TownMapper  townMapper;
    @Resource
    TowImageMapper  towImageMapper;
    @Resource
    CommentMapper  commentMapper;
    @Resource
    CoImageMapper coImageMapper;
    @Resource
    UserMapper  userMapper;
    @RequestMapping("show")
    public String show(Model model , int tid , Page page){

        TowImageExample  e = new TowImageExample();
        e.createCriteria().andTidEqualTo(tid);

        List<TowImage> ms = towImageMapper.selectByExample(e);
        TowImage sImage = ms.get(0);
        TowImage sImage2 = ms.get(1);
        Town t  = townMapper.selectByPrimaryKey(tid);
        PageHelper.offsetPage(page.getStart(),page.getCount());
        CommentExample E = new CommentExample();
        E.createCriteria().andTidEqualTo(tid);
        List<Comment> coms = commentMapper.selectByExample(E);
        for(Comment c : coms ){
            c.setUserName(userMapper.selectByPrimaryKey(c.getUid()).getName());
        }

        page.setParam("&tid="+t.getId()+"#fourthPage");
        int total = (int)new PageInfo<>(coms).getTotal();
        page.setTotal(total);
        model.addAttribute("sm1",sImage);
        model.addAttribute("sm2",sImage2);
        model.addAttribute("ms",ms);
        model.addAttribute("t",t);

        model.addAttribute("coms",coms);
        return "show";

    }

    @RequestMapping("comment_add")

    public String add(uploadImageFile imageFile , Comment comment , HttpSession session)throws IOException {
        CoImage cim = new CoImage();
        User user  = (User)session.getAttribute("user");
        coImageMapper.insert(cim);
        comment.setMid(cim.getId());
        comment.setUid(user.getId());
        commentMapper.insert(comment);
       String  fileName ="E:\\project\\imgResources\\img\\comment";
       String name = comment.getMid()+".jpg";
       File file = new File(fileName,name);
       imageFile.getImage().transferTo(file);

       return "redirect:show?tid="+comment.getTid()+"#fourthPage";
    }

    @RequestMapping("hotel")
    public  String hotel(Model model){
        System.out.println("接收到请求！");
       return "hotel";
    }

    @RequestMapping("show_map")

    public  String map(Integer tid,Model mdodel){
        MapUtil mu = new MapUtil();
        String tname = townMapper.selectByPrimaryKey(tid).getName();
        String result = MapUtil.getCoordinate(tname);
        String[] strs = result.split(",");
        mu.setJin(strs[0]);
        mu.setWei(strs[1]);
        mdodel.addAttribute("map",mu);
        return "showMap";

    }



}

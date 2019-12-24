package controller;

import java.util.ArrayList;
import java.util.List;
import mapper.CategoryMapper;
import mapper.TowImageMapper;
import mapper.TownMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import pojo.*;

import javax.annotation.Resource;

@Controller
@RequestMapping("")
public class MainPageController {
@Resource
    TownMapper townMapper;
@Resource
    TowImageMapper towImageMapper;
@Resource
    CategoryMapper categoryMapper;

@RequestMapping("/index")

    public String mainPage(Model model ){
    List<Category> cs = categoryMapper.selectByExample(new CategoryExample());
    List<Town> tts = townMapper.selectByExample( new TownExample());
    List<Town> ts= new ArrayList<>();
    int i = 0 ;
    for( Town t : tts){

   if( i > 3 )
       break;
   i++;
   TowImageExample example = new TowImageExample();
   example.createCriteria().andTidEqualTo(t.getId());
   t.setImage(towImageMapper.selectByExample(example).get(0));
   ts.add(t);
    }
    model.addAttribute("cs",cs);
    model.addAttribute("ts",ts);
    return "index";
}

@RequestMapping("listTown")

 public String listByCid( int cid , Model model){
    List<Category> cs = categoryMapper.selectByExample(new CategoryExample());
    TownExample e =new TownExample();
    e.createCriteria().andCidEqualTo(cid);
    List<Town> tts = townMapper.selectByExample( e);
    List<Town> ts= new ArrayList<>();

    for( Town t : tts){
        TowImageExample example = new TowImageExample();
        example.createCriteria().andTidEqualTo(t.getId());
        t.setImage(towImageMapper.selectByExample(example).get(1));
        ts.add(t);
    }
    model.addAttribute("cs",cs);
    model.addAttribute("ts",ts);

    return "list";
}


    @RequestMapping("listBySearch")

    public String listBySearch( String search , Model model){
        List<Category> cs = categoryMapper.selectByExample(new CategoryExample());
        TownExample e =new TownExample();
        e.createCriteria().andNameLike("%"+search+"%");
        List<Town> tts = townMapper.selectByExample( e);
        List<Town> ts= new ArrayList<>();

        for( Town t : tts){
            TowImageExample example = new TowImageExample();
            example.createCriteria().andTidEqualTo(t.getId());
            t.setImage(towImageMapper.selectByExample(example).get(1));
            ts.add(t);
        }
        model.addAttribute("cs",cs);
        model.addAttribute("ts",ts);

        return "list";
    }



}



package controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import mapper.CategoryMapper;
import mapper.ImageMapper;
import mapper.TowImageMapper;
import mapper.TownMapper;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import pojo.*;
import util.Page;
import util.uploadImageFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Locale;

@Controller

@RequestMapping("")
public class TownController {
    @Resource
    ImageMapper imageMapper;
    @Resource
    TownMapper townMapper;
    @Resource
    CategoryMapper categoryMapper;
    @Resource
    TowImageMapper towImageMapper;

    @RequestMapping("town_list")
    public String list(Integer id , Model model , Page page ){
        int cid =id;
        Category c =new Category();
        List<Town> ts = new ArrayList<>();
       if( cid  < 0){
        ts= townMapper.selectByExample( new TownExample());
       }
       else{
           c = categoryMapper.selectByPrimaryKey(cid);
           TownExample te = new TownExample();
           te.setOrderByClause("id desc");
           te.createCriteria().andCidEqualTo(cid);
           ts= townMapper.selectByExample(te);
       } List<Category> cs = categoryMapper.selectByExample(new CategoryExample());
        PageHelper.offsetPage(page.getStart(),page.getCount());
        int total = (int) new PageInfo<>(ts).getTotal();
        page.setTotal(total);
        page.setParam("$id="+id);

        model.addAttribute("cs",cs);
       model.addAttribute("cid",cid);
       model.addAttribute("ts",ts);
       model.addAttribute("page",page);
        model.addAttribute("category",c);
        return "listTown";
    }
    @RequestMapping("town_update")
    public void update( Town town){
       townMapper.updateByPrimaryKey(town);

    }
    @RequestMapping("town_add")

    public String add( Town town){
        townMapper.insert(town);
        return "redirect:town_list?id="+town.getCid();
    }

    @RequestMapping("town_delete")
    public String  update( int id){
       Town t = townMapper.selectByPrimaryKey(id);
       townMapper.deleteByPrimaryKey(id);
       return "redirect:town_list?id="+t.getCid();

    }

    @RequestMapping("townImage_add")
    public String  Image_add(uploadImageFile image  , HttpSession session , Model model , Integer tid){
     TowImage TImage = new TowImage();
     TImage.setTid(tid);
     towImageMapper.insert(TImage);
     int x = TImage.getId();
     TImage.setMid(x);
     String file =session.getServletContext().getRealPath("img/detail");
     String name= x+".jpg";
     File MFile = new File(file,name);
     MFile.getParentFile().mkdirs();
     try{
         image.getImage().transferTo(MFile);
     }catch (IOException e){
         e.printStackTrace();
     }
    return "redirect:townImage_list?id="+tid;
    }
    @RequestMapping("towImage_delete")
     public String deleteImage(Integer id ,HttpSession session){
      TowImage towImage = towImageMapper.selectByPrimaryKey(id);
      String fileP = session.getServletContext().getRealPath("img/detail");
      String name= towImage.getId()+".jpg";
      File file = new File(fileP,name);
      file.delete();
      towImageMapper.deleteByPrimaryKey(id);
      return "redirect:townImage_list?id="+towImage.getTid();
    }

    @RequestMapping("townImage_list")
    public String imageList(Integer id ,Model model ,Page page){
        int tid = id;
        PageHelper.offsetPage(page.getStart(),4);
        TowImageExample towImageExample = new TowImageExample();
        towImageExample.setOrderByClause("id desc");
        towImageExample.createCriteria().andTidEqualTo(tid);
        List<TowImage> ts = towImageMapper.selectByExample(towImageExample);
        Town t = townMapper.selectByPrimaryKey(tid);
        int total = (int) new PageInfo<>(ts).getTotal();
        page.setTotal(total);
        page.setParam("&id="+tid);
        model.addAttribute("ts",ts);
        model.addAttribute("page",page);
        model.addAttribute("t",t);

        return"listTowImage";

    }
}

package controller;

import java.util.List;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import mapper.CategoryMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import pojo.Category;
import pojo.CategoryExample;
import util.Page;

import javax.annotation.Resource;
import java.util.Locale;

@Controller

@RequestMapping("")
public class CategoryController {
    @Resource
    CategoryMapper categoryMapper;
    @RequestMapping("/category_list")

    public String  list(Model model , Page page ){
        PageHelper.offsetPage(page.getStart(),page.getCount());
        List<Category> cs = categoryMapper.selectByExample( new CategoryExample());
        int total = (int) new PageInfo<>(cs).getTotal();
        page.setTotal(total);
        model.addAttribute("cs",cs);
        model.addAttribute("page",page);
        return "listCategory";
    }
    @RequestMapping("/category_add")

      public String  add(  Category category ,Model model ){
        categoryMapper.insert(category);


        return "redirect:listCategory";
    }

    @RequestMapping("/category_delete")

    public String  delete(  int id ,Model model ){
        categoryMapper.deleteByPrimaryKey(id);
        return "redirect:listCategory";
    }

    @RequestMapping("/category_edit")

    public String  edit( int id ,Model model ){

        Category c = categoryMapper.selectByPrimaryKey(id);
        model.addAttribute("c",c);
        return "editCategory";
    }

    @RequestMapping("/category_update")
    public String  update(  Category category ,Model model ){
        categoryMapper.updateByPrimaryKey(category);
        return "redirect:category_list";
    }

}

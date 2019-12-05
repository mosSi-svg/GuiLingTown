package mapper;

import java.util.List;
import pojo.Image;
import pojo.ImageExample;

public interface ImageMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Image record);

    int insertSelective(Image record);

    List<Image> selectByExample(ImageExample example);
}
package mapper;

import java.util.List;
import pojo.CoImage;
import pojo.CoImageExample;

public interface CoImageMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(CoImage record);

    int insertSelective(CoImage record);

    List<CoImage> selectByExample(CoImageExample example);

    CoImage selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CoImage record);

    int updateByPrimaryKey(CoImage record);
}
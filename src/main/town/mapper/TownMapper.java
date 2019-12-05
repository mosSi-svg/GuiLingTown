package mapper;

import java.util.List;
import pojo.Town;
import pojo.TownExample;

public interface TownMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Town record);

    int insertSelective(Town record);

    List<Town> selectByExample(TownExample example);

    Town selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Town record);

    int updateByPrimaryKey(Town record);
}
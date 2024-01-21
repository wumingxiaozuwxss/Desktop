package com.example.demo.mapper;


import com.example.demo.entiy.Location;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface LocationMapper {

    int insertLocation(Location location);

    int chengLocation(Location location);

    int delLocation(Integer locationId);

    int chengLocationState(Integer userId);

    List<Location> findLocation(Integer userId);

    Location findLocationState(Integer userId);

    Location findLocationId(Integer locationId);
}

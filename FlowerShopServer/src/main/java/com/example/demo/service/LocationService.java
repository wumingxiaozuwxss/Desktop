package com.example.demo.service;

import com.example.demo.entiy.Location;
import com.example.demo.entiy.Res;
import com.example.demo.entiy.User;
import com.example.demo.mapper.LocationMapper;
import com.example.demo.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


/**
 *
 */
@Service
public class LocationService {

    @Autowired
    private LocationMapper locationMapper;


    public Res addLocation(Location location){
        String time = "" + System.currentTimeMillis();
        String substring = time.substring(5, 13);
        location.setLocationId(Integer.valueOf("4"+substring));
        if (location.getLocationState() == 1){
            int i = locationMapper.chengLocationState(location.getUserId());
        }
        int i = locationMapper.insertLocation(location);
        return new Res(200, "新增成功", location);
    }

    public Res chengLocation(Location location){
        int i1 = locationMapper.chengLocationState(location.getUserId());
        int i = locationMapper.chengLocation(location);
        return new Res(200, "修改成功", location);
    }
    public Res delLocation(Integer locationId){
        int i = locationMapper.delLocation(locationId);
        return new Res(200, "删除成功", locationId);
    }


    public Res findLocation(Integer userId) {
        List<Location> location = locationMapper.findLocation(userId);
        return new Res(200, "查询成功", location);
    }
}

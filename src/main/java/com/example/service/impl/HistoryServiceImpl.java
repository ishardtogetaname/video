package com.example.service.impl;

import com.example.mapper.HistoryMapper;
import com.example.pojo.History;
import com.example.service.HistoryService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class HistoryServiceImpl implements HistoryService {
    @Resource
    private HistoryMapper historyMapper;

    @Override
    public int insHistory(History history) {
        return historyMapper.insert(history);
    }

    @Override
    public int updHistory(History history) {
        return historyMapper.updateByPrimaryKey(history);
    }

    @Override
    public History selHistoryByName(int uid,String videoName) {
        return historyMapper.getByVideoName(uid,videoName);
    }

    @Override
    public List<History> selHistoryByUid(int uid) {
        return historyMapper.getByUid(uid);
    }
}

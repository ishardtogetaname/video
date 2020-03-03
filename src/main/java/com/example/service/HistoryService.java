package com.example.service;

import com.example.pojo.History;
import org.springframework.stereotype.Service;

import java.util.List;

public interface HistoryService {
    int insHistory(History history);

    int updHistory(History history);

    History selHistoryByName(int uid,String videoName);

    List<History> selHistoryByUid(int uid);
}

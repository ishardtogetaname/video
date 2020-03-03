package com.example.service;

import com.example.pojo.Admin;

public interface ManagerService {

    Admin selByName(String name);

    Admin selByNameAndPassword(String name,String password);
}

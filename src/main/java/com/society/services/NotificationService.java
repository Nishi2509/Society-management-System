package com.society.services;

import com.society.models.NotificationVo;

import java.util.ArrayList;

public interface NotificationService {

    void insertNotification(NotificationVo notificationVo);

    ArrayList<NotificationVo> getCurrentUserNotifications();

    void readNotification(int notificationId);

    NotificationVo getNotificationById(int notificationId);

    void notifyEveryOwner(String subject,String description);
}

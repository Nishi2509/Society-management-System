package com.society.repository;

import com.society.models.NotificationVo;

import java.util.ArrayList;

public interface NotificationDao {

    void insertNotification(NotificationVo notificationVo);

    ArrayList<NotificationVo> getCurrentUserNotifications(int ownerId);

    ArrayList<NotificationVo> getNotificationById(int notificationId);
}

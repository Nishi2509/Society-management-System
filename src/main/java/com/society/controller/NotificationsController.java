package com.society.controller;

import com.society.models.NotificationVo;
import com.society.models.OwnerVo;
import com.society.services.NotificationService;
import com.society.services.OwnerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.security.acl.Owner;
import java.util.ArrayList;


@RestController
public class NotificationsController {

    @Autowired
    private NotificationService notificationService;

    @Autowired
    private OwnerService ownerService;

    @RequestMapping(value = "user/getNotifications", method = RequestMethod.GET)
    public ArrayList<NotificationVo> getNotificationForCurrentUser() {
        return this.notificationService.getCurrentUserNotifications();
    }

    @RequestMapping(value = "user/readNotifications/{notificationId}", method = RequestMethod.GET)
    public String readNotification(@PathVariable("notificationId") int notificationId) {
        this.notificationService.readNotification(notificationId);
        return "Success";
    }

    @RequestMapping(value = "getOwnerDetailsForHeader", method = RequestMethod.GET)
    public OwnerVo getOwnerDetailsForHeader() {
        return this.ownerService.getCurrentOwner();
    }
}

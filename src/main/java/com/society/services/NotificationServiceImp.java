package com.society.services;

import com.society.models.NotificationVo;
import com.society.models.OwnerVo;
import com.society.repository.NotificationDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
public class NotificationServiceImp implements NotificationService {

    @Autowired
    private NotificationDao notificationDao;

    @Autowired
    private OwnerService ownerService;

    @Override
    public void insertNotification(NotificationVo notificationVo) {
        this.notificationDao.insertNotification(notificationVo);
    }

    @Override
    public ArrayList<NotificationVo> getCurrentUserNotifications() {
        return notificationDao.getCurrentUserNotifications(ownerService.getCurrentOwner().getId());
    }

    @Override
    public void readNotification(int notificationId) {
        NotificationVo notificationVo = this.getNotificationById(notificationId);
        notificationVo.setReadStatus(true);
        this.notificationDao.insertNotification(notificationVo);
    }

    @Override
    public NotificationVo getNotificationById(int notificationId) {
        return this.notificationDao.getNotificationById(notificationId).get(0);
    }

    @Override
    public void notifyEveryOwner(String subject, String description) {
        List<OwnerVo> ownerList = this.ownerService.getAllOwners();
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm");
        LocalDateTime now = LocalDateTime.now();
        for (int i = 0; i < ownerList.size(); i++) {
            NotificationVo notificationVo = new NotificationVo();
            notificationVo.setSubject(subject);
            notificationVo.setDescription(description);
            notificationVo.setOwnerVo(ownerList.get(i));
            notificationVo.setDataAndTime(dtf.format(now));
            this.insertNotification(notificationVo);
        }
    }
}

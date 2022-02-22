package com.EIE.demo.dao;

import com.EIE.demo.model.DeclarationTransporteur;
import com.EIE.demo.model.Role;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface DeclarationTransporteurRepository extends JpaRepository<DeclarationTransporteur, Integer> {

    @Query("select d from DeclarationTransporteur d left join d.notification n where d.deleteDateTime is null and n.deleteDateTime is null and d.declarationId in (Select max(dd.declarationId) from DeclarationTransporteur dd where dd.notification.id_notification=:id) ")
    DeclarationTransporteur getlastDeclarationByNotificationId(int id);

    @Query("Select d from DeclarationTransporteur d left join d.notification n where n.deleteDateTime is null and d.deleteDateTime is null and d.etat like '1' and n.id_notification=:id")
    DeclarationTransporteur getDeclarationTransValideByNotification(int id);


    @Query("Select d from DeclarationTransporteur d left join d.notification n where n.deleteDateTime is null and d.deleteDateTime is null and n.id_notification=:id")
    DeclarationTransporteur getDeclarationTransByNotification(int id);

}



package com.EIE.demo.dao;

import com.EIE.demo.model.ContactMessage;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface ContactMessageRepository extends JpaRepository<ContactMessage, Integer> {

    @Query("select c from ContactMessage c left join  c.compte cc where cc.deleteDateTime is null and c.deleteDateTime is null and cc.compteId=:iduser order by  c.id_message desc ")
    Page<ContactMessage> getListAllMessage(Pageable pageRequest, int iduser);

    @Query("select c from ContactMessage c left join c.compte cc where cc.deleteDateTime is null  and c.deleteDateTime is null and c.id_message=:id and cc.compteId=:iduser order by  c.id_message desc ")
    ContactMessage getMessageContactById(int id,int iduser);


    @Query("from ContactMessage where deleteDateTime is null and reponse is null order by id_message desc ")
    public List<ContactMessage> getAllMessageReponse1();

    @Query("from ContactMessage where deleteDateTime is null and reponse is not null order by id_message desc ")
    public List<ContactMessage> getAllMessageReponse2();

    @Query("from ContactMessage where id_message=:id ")
    ContactMessage getMessageById(int id);
}




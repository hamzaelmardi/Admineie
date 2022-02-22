package com.EIE.demo.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

@Entity
@org.hibernate.annotations.Proxy(lazy = true)
@Table(name = "Departement")

@JsonIgnoreProperties({ "hibernateLazyInitializer", "handler" })

public class Departement implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    private  int departementid;
    private String departementnom;
    private Date deleteDateTime;


    public Date getDeleteDateTime() {
        return deleteDateTime;
    }

    public void setDeleteDateTime(Date deleteDateTime) {
        this.deleteDateTime = deleteDateTime;
    }

    public Departement() {
    }


    public int getDepartementid() {
        return departementid;
    }

    public void setDepartementid(int departementid) {
        this.departementid = departementid;
    }

    public String getDepartementnom() {
        return departementnom;
    }

    public void setDepartementnom(String departementnom) {
        this.departementnom = departementnom;
    }
}

package com.EIE.demo.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@org.hibernate.annotations.Proxy(lazy = true)
@Table(name = "employe")

@JsonIgnoreProperties({ "hibernateLazyInitializer", "handler" })

public class Employe implements Serializable {

    private static final long serialVersionUID = 1L;

    public Employe() {

    }
    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    private int empId;

    private Date deleteDateTime;


    @Column(name = "nom_emp", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String nom;

    @Column(name = "adresse", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String adresse;

    @Column(name = "tel", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String tel;

    @ManyToOne
    private Departement departement;

    public Departement getDepartement() {
        return departement;
    }

    public void setDepartement(Departement departement) {
        this.departement = departement;
    }

    public int getEmpId() {
        return empId;
    }

    public void setEmpId(int empId) {
        this.empId = empId;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getAdresse() {
        return adresse;
    }

    public void setAdresse(String adresse) {
        this.adresse = adresse;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public void setDeleteDateTime(Date deleteDateTime) {
        this.deleteDateTime = deleteDateTime;
    }

}

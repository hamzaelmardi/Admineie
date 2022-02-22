package com.EIE.demo.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;


@Entity
@org.hibernate.annotations.Proxy(lazy = true)
@Table(name = "IncrementationFichier")

@JsonIgnoreProperties({ "hibernateLazyInitializer", "handler" })
public class IncrementationFichier implements Serializable {


	public IncrementationFichier() {
		
	}

	@Id
    @GeneratedValue (strategy=GenerationType. IDENTITY)
    @Column (name="id_Incr")
    private int id_Incr;
	
	public int getId_code() {
		return id_Incr;
	}

	public void setId_code(int id_code) {
		this.id_Incr = id_code;
	}

}

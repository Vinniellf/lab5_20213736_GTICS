package com.example.tarea.Entities;

import jakarta.persistence.*;

@Entity
@Table(name = "Sedes")
public class Sedes {

    @Id
    @Column(name = "idSedes", nullable = false)
    private Integer id;

    @Column(name = "nombreSede", length = 45)
    private String name;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
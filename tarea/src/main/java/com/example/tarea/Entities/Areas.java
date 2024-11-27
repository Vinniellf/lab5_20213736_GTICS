package com.example.tarea.Entities;

import jakarta.persistence.*;

@Entity
@Table(name = "Areas")
public class Areas {

    @Id
    @Column(name = "idAreas", nullable = false)
    private Integer id;

    @Column(name = "nombreArea", length = 45)
    private String nombre;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
}
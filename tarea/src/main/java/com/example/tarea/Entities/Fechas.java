package com.example.tarea.Entities;

import jakarta.persistence.*;

@Entity
@Table(name = "Fechas")
public class Fechas {

    @Id
    @Column(name = "idFechas", nullable = false)
    private Integer id;

    @Column(name = "fechasDisponibilidad", length = 20)
    private String fecha;

    @ManyToOne
    @JoinColumn(name = "idProfesional")
    private Profesionales profesional;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public Profesionales getProfesional() {
        return profesional;
    }

    public void setProfesional(Profesionales profesional) {
        this.profesional = profesional;
    }
}

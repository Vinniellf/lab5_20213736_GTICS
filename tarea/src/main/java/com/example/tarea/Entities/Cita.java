package com.example.tarea.Entities;

import jakarta.persistence.*;

@Entity
@Table(name = "Citas")
public class Cita {
    @Id
    @Column(name = "idAreas", nullable = false)
    private Integer id;

    @Column(name = "nombreArea", length = 45)
    private String nombre;

    @ManyToOne
    @JoinColumn(name = "idArea")
    private Areas area;
}

package com.example.tarea.Entities;

import jakarta.persistence.*;

@Entity
@Table(name = "Profesionales")
public class Profesionales {

    @Id
    @Column(name = "idProfesionales", nullable = false)
    private Integer id;

    @Column(name = "nombre", length = 45)
    private String name;

    @Column(name = "imagen", length = 45)
    private String imagen;

    @Column(name = "descripcionProfesional", length = 90)
    private String descripcion;

    @ManyToOne
    @JoinColumn(name = "idArea")
    private Areas area;

    @ManyToOne
    @JoinColumn(name = "idSede")
    private Sedes sede;

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

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Areas getArea() {
        return area;
    }

    public void setArea(Areas area) {
        this.area = area;
    }

    public Sedes getSede() {
        return sede;
    }

    public void setSede(Sedes sede) {
        this.sede = sede;
    }
}

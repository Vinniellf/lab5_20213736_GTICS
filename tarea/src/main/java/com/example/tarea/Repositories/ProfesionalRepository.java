package com.example.tarea.Repositories;

import com.example.tarea.Entities.Profesionales;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface ProfesionalRepository extends JpaRepository<Profesionales, Long> {
    @Query("SELECT f FROM Profesionales f WHERE (:area = 0 OR f.area.id = :area) AND (:sede = 0  OR f.sede.id = :sede)")
    List<Profesionales> finByAreaAndSede(@Param("area") Long  area, @Param("sede") Long  sede);
}

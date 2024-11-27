package com.example.tarea.Controllers;

import com.example.tarea.Entities.Areas;
import com.example.tarea.Entities.Fechas;
import com.example.tarea.Entities.Profesionales;
import com.example.tarea.Entities.Sedes;
import com.example.tarea.Repositories.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/tarea")
public class BaseController {

    final BaseRepository baseRepository;
    final ProfesionalRepository profesionalRepository;
    final AreasRepository areasRepository;
    final FechasRepository fechasRepository;
    final SedesRepository sedesRepository;

    public BaseController(BaseRepository baseRepository, ProfesionalRepository profesionalRepository, AreasRepository areasRepository, FechasRepository fechasRepository, SedesRepository sedesRepository) {
        this.baseRepository = baseRepository;
        this.profesionalRepository = profesionalRepository;
        this.areasRepository = areasRepository;
        this.fechasRepository = fechasRepository;
        this.sedesRepository = sedesRepository;
    }

    @GetMapping("/profesionales")
    public String sub1(Model model) {
        List<Profesionales> profesionales = profesionalRepository.findAll();
        List<Areas> areas = areasRepository.findAll();
        List<Sedes> sedes = sedesRepository.findAll();
        model.addAttribute("profesionales", profesionales);
        model.addAttribute("areas", areas);
        model.addAttribute("sedes", sedes);

        return "plantilla";
    }

    @GetMapping("/filtrar")
    public String filtrar(@RequestParam("area") Long  area,
                        @RequestParam("sede") Long  sede, Model model){

        List<Profesionales> profesionales = profesionalRepository.finByAreaAndSede(area, sede);
        List<Areas> areas = areasRepository.findAll();
        List<Sedes> sedes = sedesRepository.findAll();

        model.addAttribute("profesionales", profesionales);
        model.addAttribute("areas", areas);
        model.addAttribute("sedes", sedes);
        return "plantilla";}

    @GetMapping("/mostrarReservar")
    public String mostrarReservar(Model model) {
        return "reservarCita";
    }

    /*@GetMapping("/editar")
    public String editarBase(Model model,
                                  @RequestParam("idEmployee") Integer id) {
        List<Job> listaJobs = employeesJobRepository.findAll();
        model.addAttribute("listaJobs", listaJobs);
        Optional<Employee> optionalEmployee = employeesRepository.findById(id);

        if(optionalEmployee.isPresent()) {
            Employee employee = optionalEmployee.get();
            model.addAttribute("employee", employee);
            return "catalogo";
        }else{
            return "redirect:/tarea/listar";
        }
    }*/

    /*@PostMapping("/guardar")
    public String guardar (Employee employee) {
        employeesRepository.save(employee);
        return "redirect:/tarea/listar";
    }*/

    /*@GetMapping("/borrar")
    public String borrarEmpleado(Model model, @RequestParam("idEmployee") int id, RedirectAttributes redirectAttributes) {
        try {
            employeesRepository.deleteById(id);
            redirectAttributes.addFlashAttribute("mensaje", "Se borró el empleado");
            redirectAttributes.addFlashAttribute("alertClass", "alert-success");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("mensaje", "No se pudo borrar el empleado");
            redirectAttributes.addFlashAttribute("alertClass", "alert-danger");
        }
        return "redirect:/employee/listar";
    }*/

}

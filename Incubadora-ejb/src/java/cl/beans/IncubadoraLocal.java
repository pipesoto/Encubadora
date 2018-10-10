/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.beans;

import cl.modelo.Emprendedor;
import cl.modelo.Proyecto;
import java.util.ArrayList;
import javax.ejb.Local;

/**
 *
 * @author 2guzm
 */
@Local
public interface IncubadoraLocal {

    void addEmprendedor(Emprendedor emprendedor);

    void addProyecto(Proyecto proyecto);

    ArrayList<Emprendedor> getEmprendedor();

    boolean deleteEmprendedor(String rut);

    boolean existEmprendedor(String rut);

    ArrayList<Proyecto> getProyecto();
    
    boolean existsProyect(String rut);
    
}

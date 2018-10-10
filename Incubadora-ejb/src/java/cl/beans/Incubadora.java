/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.beans;

import cl.modelo.Emprendedor;
import cl.modelo.Proyecto;
import java.util.ArrayList;
import javax.ejb.Singleton;

/**
 *
 * @author 2guzm
 */
@Singleton
public class Incubadora implements IncubadoraLocal {

    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")
    ArrayList<Emprendedor> listaEmp = new ArrayList<Emprendedor>();
    ArrayList<Proyecto> listaPro = new ArrayList<Proyecto>();

    public Incubadora() {
        listaEmp.add(new Emprendedor("1-1", "Emprendedor 1", "Profesion 1", "email1@email.com"));
        listaEmp.add(new Emprendedor("2-2", "Emprendedor 2", "Profesion 2", "email2@email.com"));
        listaEmp.add(new Emprendedor("3-3", "Emprendedor 3", "Profesion 3", "email3@email.com"));
        listaEmp.add(new Emprendedor("4-4", "Emprendedor 4", "Profesion 4", "email4@email.com"));
        listaEmp.add(new Emprendedor("5-5", "Emprendedor 5", "Profesion 5", "email5@email.com"));
        listaEmp.add(new Emprendedor("6-6", "Emprendedor 6", "Profesion 6", "email6@email.com"));
        listaEmp.add(new Emprendedor("7-7", "Emprendedor 7", "Profesion 7", "email7@email.com"));
        
        listaPro.add(new Proyecto("1-1","proyecto1","Desc Proyecto1",2000,"2",true,5));
        listaPro.add(new Proyecto("2-2","proyecto2","Desc Proyecto2",3000,"3",true,7));
        listaPro.add(new Proyecto("3-3","proyecto3","Desc Proyecto3",4000,"4",true,7));
        listaPro.add(new Proyecto("4-4","proyecto4","Desc Proyecto4",5000,"5",true,6));
        listaPro.add(new Proyecto("5-5","proyecto5","Desc Proyecto5",6000,"6",true,3));
        listaPro.add(new Proyecto("6-6","proyecto6","Desc Proyecto6",5000,"5",false,0));
        listaPro.add(new Proyecto("7-7","proyecto7","Desc Proyecto7",6000,"6",false,0));
        
    }
    
    
    @Override
    public void addEmprendedor(Emprendedor emprendedor) {
        listaEmp.add(emprendedor);
    }
    
    @Override
    public boolean deleteEmprendedor(String rut) {
        for (Emprendedor emprendedor : listaEmp) {
            if (emprendedor.getRut().equals(rut)) {
                listaEmp.remove(emprendedor);
                return true;
            }
        }
        return false;
    }

    @Override
    public ArrayList<Emprendedor> getEmprendedor() {
        return listaEmp;
    }
    
    @Override
    public boolean existEmprendedor(String rut) {
        for (Emprendedor emprendedor : listaEmp) {
            if (emprendedor.getRut().equals(rut)) {
                return true;
            }
        }
        return false;
    }
  
     @Override
    public void addProyecto(Proyecto proyecto) {
        listaPro.add(proyecto);
    }
    
    @Override
    public ArrayList<Proyecto> getProyecto() {
        if (listaPro.size()>0) {
            return listaPro;
        }
        return null;
    }

    @Override
    public boolean existsProyect(String rut) {
        for (Proyecto p : listaPro) {
            if (p.getRut().equals(rut)) {
               return true; 
            }
        }
        return false;
    }
      
}

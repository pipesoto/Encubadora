/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.modelo;

/**
 *
 * @author 2guzm
 */
public class Emprendedor {
    
    private String rut;
    private String nombre;
    private String profesion;
    private String email;

    public Emprendedor() {
    }

    public Emprendedor(String rut, String nombre, String profesion, String email) {
        this.rut = rut;
        this.nombre = nombre;
        this.profesion = profesion;
        this.email = email;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getRut() {
        return rut;
    }

    public void setRut(String rut) {
        this.rut = rut;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getProfesion() {
        return profesion;
    }

    public void setProfesion(String profesion) {
        this.profesion = profesion;
    }
    
    
}

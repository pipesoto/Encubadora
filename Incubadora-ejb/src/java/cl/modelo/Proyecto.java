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
public class Proyecto {
    private String rut;
    private String nombre;
    private String descripcion;
    private double monto;
    private String tiempo;
    private boolean documentacion;
    private double nota;
    
    public Proyecto() {
        
    }

    public Proyecto(String rut, String nombre, String descripcion, double monto, String tiempo, boolean documentacion, double nota) {
        this.rut = rut;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.monto = monto;
        this.tiempo = tiempo;
        this.documentacion = documentacion;
        this.nota = nota;
    }

    public String getTiempo() {
        return tiempo;
    }

    public void setTiempo(String tiempo) {
        this.tiempo = tiempo;
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

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public double getMonto() {
        return monto;
    }

    public void setMonto(double monto) {
        this.monto = monto;
    }

    public boolean isDocumentacion() {
        return documentacion;
    }

    public void setDocumentacion(boolean documentacion) {
        this.documentacion = documentacion;
    }

    public double getNota() {
        return nota;
    }

    public void setNota(double nota) {
        this.nota = nota;
    }
    
    
}

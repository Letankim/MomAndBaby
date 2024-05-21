/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author HP
 */
public class Wards {

    private int wardsId;

    private int districtId;

    private String name;

    // Constructors
    public Wards() {
    }

    public Wards(int wardsId, int districtId, String name) {
        this.wardsId = wardsId;
        this.districtId = districtId;
        this.name = name;
    }

    // Getters and Setters
    public int getWardsId() {
        return wardsId;
    }

    public void setWardsId(int wardsId) {
        this.wardsId = wardsId;
    }

    public int getDistrictId() {
        return districtId;
    }

    public void setDistrictId(int districtId) {
        this.districtId = districtId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}

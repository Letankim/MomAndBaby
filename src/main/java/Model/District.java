/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author HP
 */
public class District {

    private int district_id;

    private int province_id;

    private String name;

    // Constructors
    public District() {
    }

    public District(int districtId, int provinceId, String name) {
        this.district_id = districtId;
        this.district_id = provinceId;
        this.name = name;
    }

    // Getters and Setters
    public int getDistrict_id() {
        return district_id;
    }

    public void setDistrict_id(int districtId) {
        this.district_id = districtId;
    }

    public int getProvince_id() {
        return province_id;
    }

    public void setProvince_id(int provinceId) {
        this.province_id = provinceId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}

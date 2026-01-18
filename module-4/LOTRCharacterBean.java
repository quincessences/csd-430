// Name: Maria Q. Michaels
// Date: 1/18/2026
// Assignment: CSD430 Module 4 Assignment
// Assignment Purpose: Display JavaBean data


package beans;

import java.io.Serializable;

public class LOTRCharacterBean implements Serializable {

    private static final long serialVersionUID = 1L;

    // fields
    private String name;
    private String race;
    private String fellowship;
    private String homeland;
    private String role;

    public LOTRCharacterBean() {
    }

    // methods
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getRace() {
        return race;
    }

    public void setRace(String race) {
        this.race = race;
    }

    public String getFellowship() {
        return fellowship;
    }

    public void setFellowship(String fellowship) {
        this.fellowship = fellowship;
    }

    public String getHomeland() {
        return homeland;
    }

    public void setHomeland(String homeland) {
        this.homeland = homeland;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
}
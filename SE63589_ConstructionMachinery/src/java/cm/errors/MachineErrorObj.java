/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cm.errors;

import java.io.Serializable;

/**
 *
 * @author CaoThu
 */
public class MachineErrorObj implements Serializable {

    private String errMachineID;
    private String errMachineIDExist;
    private String errMachineName;
    private String errDescription;
    private String errPrice;
    private String errDate;

    public String getErrMachineID() {
        return errMachineID;
    }

    public void setErrMachineID(String errMachineID) {
        this.errMachineID = errMachineID;
    }

    public String getErrMachineIDExist() {
        return errMachineIDExist;
    }

    public void setErrMachineIDExist(String errMachineIDExist) {
        this.errMachineIDExist = errMachineIDExist;
    }

    public String getErrMachineName() {
        return errMachineName;
    }

    public void setErrMachineName(String errMachineName) {
        this.errMachineName = errMachineName;
    }

    public String getErrDescription() {
        return errDescription;
    }

    public void setErrDescription(String errDescription) {
        this.errDescription = errDescription;
    }

    public String getErrPrice() {
        return errPrice;
    }

    public void setErrPrice(String errPrice) {
        this.errPrice = errPrice;
    }

    public String getErrDate() {
        return errDate;
    }

    public void setErrDate(String errDate) {
        this.errDate = errDate;
    }

}

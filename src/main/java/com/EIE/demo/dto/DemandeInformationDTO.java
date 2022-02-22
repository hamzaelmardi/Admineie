package com.EIE.demo.dto;

public class DemandeInformationDTO {

    private String typeEnv;
    private long numbersOfTypeEnv;

    public String getTypeEnv() {
        return typeEnv;
    }

    public void setTypeEnv(String typeEnv) {
        this.typeEnv = typeEnv;
    }

    public long getNumbersOfTypeEnv() {
        return numbersOfTypeEnv;
    }

    public void setNumbersOfTypeEnv(long numbersOfTypeEnv) {
        this.numbersOfTypeEnv = numbersOfTypeEnv;
    }

    public DemandeInformationDTO(String typeEnv, long numbersOfTypeEnv) {
        this.typeEnv = typeEnv;
        this.numbersOfTypeEnv = numbersOfTypeEnv;
    }
}

package com.example.staj.model;

import jakarta.persistence.*;


@Entity
@Table(name = "Sellers")
public class Seller {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer SellerID;

    private String Name;
    private Boolean PromotionStatus = false;
    private Double rating;

    public Integer getSellerID() {
        return SellerID;
    }

    public void setSellerID(Integer sellerID) {
        this.SellerID = sellerID;
    }

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        this.Name = name;
    }

    public Boolean getPromotionStatus() {
        return PromotionStatus;
    }

    public void setPromotionStatus(Boolean promotionStatus) {
        this.PromotionStatus = promotionStatus;
    }

    public Double getRating() {
        return rating;
    }

    public void setRating(Double rating) {
        this.rating = rating;
    }


}


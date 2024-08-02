package com.example.staj.model;
import jakarta.persistence.*;


@Entity
@Table(name = "Promotions")
public class Promotion {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer PromotionID;

    private Integer SellerID;
    private Double PromotionValue;

    @ManyToOne
    @JoinColumn(name = "SellerID", insertable = false, updatable = false)
    private Seller seller;

    public Integer getPromotionID() {
        return PromotionID;
    }

    public void setPromotionID(Integer promotionID) {
        this.PromotionID = promotionID;
    }

    public Integer getSellerID() {
        return SellerID;
    }

    public void setSellerID(Integer sellerID) {
        this.SellerID = sellerID;
    }

    public Double getPromotionValue() {
        return PromotionValue;
    }

    public void setPromotionValue(Double promotionValue) {
        this.PromotionValue = promotionValue;
    }

    public Seller getSeller() {
        return seller;
    }

    public void setSeller(Seller seller) {
        this.seller = seller;
    }
}

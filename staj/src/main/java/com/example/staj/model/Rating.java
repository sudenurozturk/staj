package com.example.staj.model;

import jakarta.persistence.*;


@Entity
@Table(name = "Ratings")
public class Rating {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer RatingID;

    private Integer SellerID;
    private Double RatingValue;

    @ManyToOne
    @JoinColumn(name = "SellerID", insertable = false, updatable = false)
    private Seller seller;

    public Integer getRatingID() {
        return RatingID;
    }

    public void setRatingID(Integer ratingID) {
        this.RatingID = ratingID;
    }

    public Integer getSellerID() {
        return SellerID;
    }

    public void setSellerID(Integer sellerID) {
        this.SellerID = sellerID;
    }

    public Double getRatingValue() {
        return RatingValue;
    }

    public void setRatingValue(Double ratingValue) {
        this.RatingValue = ratingValue;
    }

    public Seller getSeller() {
        return seller;
    }

    public void setSeller(Seller seller) {
        this.seller = seller;
    }
}

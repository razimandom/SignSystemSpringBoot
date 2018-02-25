package com.example.SpringMySQL.models;

import javax.persistence.*;

@Entity
@Table(name ="genkey_data")
public class KeyModel {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    public int id;

    @Column(name = "privatekey_data")
    public String privatekey_data;
    @Column(name = "publickey_data")
    public String publickey_data;
    @Column(name = "salt_data")
    public String salt_data;
    @Column(name = "vector_data")
    public String vector_data;

    public KeyModel() {

    }

    public KeyModel(String privatekey_data, String publickey_data, String salt_data, String vector_data) {
        this.privatekey_data = privatekey_data;
        this.publickey_data = publickey_data;
        this.salt_data = salt_data;
        this.vector_data = vector_data;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPrivatekey_data() {
        return privatekey_data;
    }

    public void setPrivatekey_data(String privatekey_data) {
        this.privatekey_data = privatekey_data;
    }

    public String getPublickey_data() {
        return publickey_data;
    }

    public void setPublickey_data(String publickey_data) {
        this.publickey_data = publickey_data;
    }

    public String getSalt_data() {
        return salt_data;
    }

    public void setSalt_data(String salt_data) {
        this.salt_data = salt_data;
    }

    public String getVector_data() {
        return vector_data;
    }

    public void setVector_data(String vector_data) {
        this.vector_data = vector_data;
    }
}
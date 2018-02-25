package com.example.SpringMySQL.models;

import javax.persistence.*;

@Entity
@Table(name ="document_data")
public class DocModel {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    public int id;

    @Column(name = "req_email")
    public String req_email;
    @Column(name = "req_name")
    public String req_name;
    @Column(name = "sign_email")
    public String sign_email;
    @Column(name = "sign_name")
    public String sign_name;
    @Column(name = "doc_title")
    public String doc_title;
    @Column(name = "doc_type")
    public String doc_type;
    @Column(name = "doc_md5")
    public String doc_md5;
    @Column(name = "doc_status")
    public String doc_status;
    @Column(name = "doc_deadline")
    public String doc_deadline;
    @Column(name = "doc_signature")
    public String doc_signature;
    @Column(name = "req_date_created")
    public String req_date_created;
    @Column(name = "req_date_modified")
    public String req_date_modified;
    @Column(name = "req_time_created")
    public String req_time_created;

    public DocModel() {

    }

    public DocModel(String req_email, String req_name, String sign_name, String sign_email, String doc_title, String doc_type, String doc_md5, String doc_status, String doc_deadline, String doc_signature, String req_date_created, String req_date_modified, String req_time_created) {
        this.req_email = req_email;
        this.req_name = req_name;
        this.sign_email = sign_email;
        this.sign_name = sign_name;
        this.doc_title = doc_title;
        this.doc_type = doc_type;
        this.doc_md5 = doc_md5;
        this.doc_status = doc_status;
        this.doc_deadline = doc_deadline;
        this.doc_signature = doc_signature;
        this.req_date_created = req_date_created;
        this.req_date_modified = req_date_modified;
        this.req_time_created = req_time_created;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getReq_email() {
        return req_email;
    }

    public void setReq_email(String req_email) {
        this.req_email = req_email;
    }

    public String getReq_name() {
        return req_name;
    }

    public void setReq_name(String req_name) {
        this.req_name = req_name;
    }

    public String getSign_email() {
        return sign_email;
    }

    public void setSign_email(String sign_email) {
        this.sign_email = sign_email;
    }

    public String getSign_name() {
        return sign_name;
    }

    public void setSign_name(String sign_name) {
        this.sign_name = sign_name;
    }

    public String getDoc_title() {
        return doc_title;
    }

    public void setDoc_title(String doc_title) {
        this.doc_title = doc_title;
    }

    public String getDoc_type() {
        return doc_type;
    }

    public void setDoc_type(String doc_type) {
        this.doc_type = doc_type;
    }

    public String getDoc_md5() {
        return doc_md5;
    }

    public void setDoc_md5(String doc_md5) {
        this.doc_md5 = doc_md5;
    }

    public String getDoc_status() {
        return doc_status;
    }

    public void setDoc_status(String doc_status) {
        this.doc_status = doc_status;
    }

    public String getDoc_deadline() {
        return doc_deadline;
    }

    public void setDoc_deadline(String doc_deadline) {
        this.doc_deadline = doc_deadline;
    }

    public String getDoc_signature() {
        return doc_signature;
    }

    public void setDoc_signature(String doc_signature) {
        this.doc_signature = doc_signature;
    }

    public String getReq_date_created() {
        return req_date_created;
    }

    public void setReq_date_created(String req_date_created) {
        this.req_date_created = req_date_created;
    }

    public String getReq_date_modified() {
        return req_date_modified;
    }

    public void setReq_date_modified(String req_date_modified) {
        this.req_date_modified = req_date_modified;
    }

    public String getReq_time_created() {
        return req_time_created;
    }

    public void setReq_time_created(String req_time_created) {
        this.req_time_created = req_time_created;
    }
}
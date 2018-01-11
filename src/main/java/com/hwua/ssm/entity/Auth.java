package com.hwua.ssm.entity;

import java.util.List;

public class Auth {
    private Integer id;
    private String text;
    private Integer dbid;
    private String authName;
    private String authCode;
    private String authURL;
    private String type;
    private Integer parentId;
    private Integer orders;
    private String valid;
    private Integer layer;
    private List<Auth> children;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Auth auth = (Auth) o;

        if (id != null ? !id.equals(auth.id) : auth.id != null) return false;
        if (text != null ? !text.equals(auth.text) : auth.text != null) return false;
        if (dbid != null ? !dbid.equals(auth.dbid) : auth.dbid != null) return false;
        if (authName != null ? !authName.equals(auth.authName) : auth.authName != null) return false;
        if (authCode != null ? !authCode.equals(auth.authCode) : auth.authCode != null) return false;
        if (authURL != null ? !authURL.equals(auth.authURL) : auth.authURL != null) return false;
        if (type != null ? !type.equals(auth.type) : auth.type != null) return false;
        if (parentId != null ? !parentId.equals(auth.parentId) : auth.parentId != null) return false;
        if (orders != null ? !orders.equals(auth.orders) : auth.orders != null) return false;
        if (valid != null ? !valid.equals(auth.valid) : auth.valid != null) return false;
        if (layer != null ? !layer.equals(auth.layer) : auth.layer != null) return false;
        return children != null ? children.equals(auth.children) : auth.children == null;
    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (text != null ? text.hashCode() : 0);
        result = 31 * result + (dbid != null ? dbid.hashCode() : 0);
        result = 31 * result + (authName != null ? authName.hashCode() : 0);
        result = 31 * result + (authCode != null ? authCode.hashCode() : 0);
        result = 31 * result + (authURL != null ? authURL.hashCode() : 0);
        result = 31 * result + (type != null ? type.hashCode() : 0);
        result = 31 * result + (parentId != null ? parentId.hashCode() : 0);
        result = 31 * result + (orders != null ? orders.hashCode() : 0);
        result = 31 * result + (valid != null ? valid.hashCode() : 0);
        result = 31 * result + (layer != null ? layer.hashCode() : 0);
        result = 31 * result + (children != null ? children.hashCode() : 0);
        return result;
    }

    @Override
    public String toString() {
        return "Auth{" +
                "id=" + id +
                ", text='" + text + '\'' +
                ", dbid=" + dbid +
                ", authName='" + authName + '\'' +
                ", authCode='" + authCode + '\'' +
                ", authURL='" + authURL + '\'' +
                ", type='" + type + '\'' +
                ", parentId=" + parentId +
                ", orders=" + orders +
                ", valid='" + valid + '\'' +
                ", layer=" + layer +
                ", children=" + children +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public Integer getDbid() {
        return dbid;
    }

    public void setDbid(Integer dbid) {
        this.dbid = dbid;
    }

    public String getAuthName() {
        return authName;
    }

    public void setAuthName(String authName) {
        this.authName = authName;
    }

    public String getAuthCode() {
        return authCode;
    }

    public void setAuthCode(String authCode) {
        this.authCode = authCode;
    }

    public String getAuthURL() {
        return authURL;
    }

    public void setAuthURL(String authURL) {
        this.authURL = authURL;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    public Integer getOrders() {
        return orders;
    }

    public void setOrders(Integer orders) {
        this.orders = orders;
    }

    public String getValid() {
        return valid;
    }

    public void setValid(String valid) {
        this.valid = valid;
    }

    public Integer getLayer() {
        return layer;
    }

    public void setLayer(Integer layer) {
        this.layer = layer;
    }

    public List<Auth> getChildren() {
        return children;
    }

    public void setChildren(List<Auth> children) {
        this.children = children;
    }
}

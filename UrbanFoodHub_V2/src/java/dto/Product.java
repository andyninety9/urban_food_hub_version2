/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package dto;

/**
 *
 * @author duyma
 */
public abstract class Product {
    protected String id;
    protected String name;
    protected String category;
    protected String desc;
    protected String image;
    protected double price;
    protected int status;

    public Product() {
    }

    public Product(String id, String name, String category, String desc, String image, double price, int status) {
	this.id = id;
	this.name = name;
	this.category = category;
	this.desc = desc;
	this.image = image;
	this.price = price;
	this.status = status;
    }

    public String getDesc() {
	return desc;
    }

    public void setDesc(String desc) {
	this.desc = desc;
    }

    public String getId() {
	return id;
    }

    public void setId(String id) {
	this.id = id;
    }

    public String getName() {
	return name;
    }

    public void setName(String name) {
	this.name = name;
    }

    public String getCategory() {
	return category;
    }

    public void setCategory(String category) {
	this.category = category;
    }

    public double getPrice() {
	return price;
    }

    public void setPrice(double price) {
	this.price = price;
    }

    public int getStatus() {
	return status;
    }

    public void setStatus(int status) {
	this.status = status;
    }

    public String getImage() {
	return image;
    }

    public void setImage(String image) {
	this.image = image;
    }

    @Override
    public String toString() {
	return "Product{" + "id=" + id + ", name=" + name + ", category=" + category + ", desc=" + desc + ", image="
		+ image + ", price=" + price + ", status=" + status + '}';
    }

}

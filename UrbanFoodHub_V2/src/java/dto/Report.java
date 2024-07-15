/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dto;

import java.sql.Date;
import java.util.HashMap;

/**
 *
 * @author duyma
 */
public class Report {
    private int noNewOrderToday;
    private int noProductOutStock;
    private int noProductRuningOut;
    private double incomeMonthly;
    private double incomePrevious;
    private HashMap<Account, Integer> listTopAccountCancelOrder;
    private HashMap<Product, Integer> listTopSellProduct;
    private HashMap<Date, Double> incomeRecently;

    public Report() {
        this.listTopAccountCancelOrder = new HashMap<>();
        this.listTopSellProduct = new HashMap<>();
        this.incomeRecently = new HashMap<>();
    }

    public Report(int noNewOrderToday, int noProductOutStock, int noProductRuningOut, double incomeMonthly, double incomePrevious, HashMap<Account, Integer> listTopAccountCancelOrder, HashMap<Product, Integer> listTopSellProduct, HashMap<Date, Double> incomeRecently) {
        this.noNewOrderToday = noNewOrderToday;
        this.noProductOutStock = noProductOutStock;
        this.noProductRuningOut = noProductRuningOut;
        this.incomeMonthly = incomeMonthly;
        this.incomePrevious = incomePrevious;
        this.listTopAccountCancelOrder = listTopAccountCancelOrder;
        this.listTopSellProduct = listTopSellProduct;
        this.incomeRecently = incomeRecently;
    }

    

    

    

    public int getNoNewOrderToday() {
        return noNewOrderToday;
    }

    public void setNoNewOrderToday(int noNewOrderToday) {
        this.noNewOrderToday = noNewOrderToday;
    }

    public int getNoProductOutStock() {
        return noProductOutStock;
    }

    public void setNoProductOutStock(int noProductOutStock) {
        this.noProductOutStock = noProductOutStock;
    }

    public int getNoProductRuningOut() {
        return noProductRuningOut;
    }

    public void setNoProductRuningOut(int noProductRuningOut) {
        this.noProductRuningOut = noProductRuningOut;
    }

    public double getIncomeMonthly() {
        return incomeMonthly;
    }

    public void setIncomeMonthly(double incomeMonthly) {
        this.incomeMonthly = incomeMonthly;
    }

    public HashMap<Account, Integer> getListTopAccountCancelOrder() {
        return listTopAccountCancelOrder;
    }

    public void setListTopAccountCancelOrder(HashMap<Account, Integer> listTopAccountCancelOrder) {
        this.listTopAccountCancelOrder = listTopAccountCancelOrder;
    }

    public HashMap<Product, Integer> getListTopSellProduct() {
        return listTopSellProduct;
    }

    public void setListTopSellProduct(HashMap<Product, Integer> listTopSellProduct) {
        this.listTopSellProduct = listTopSellProduct;
    }

    public HashMap<Date, Double> getIncomeRecently() {
        return incomeRecently;
    }

    public void setIncomeRecently(HashMap<Date, Double> incomeRecently) {
        this.incomeRecently = incomeRecently;
    }

    public double getIncomePrevious() {
        return incomePrevious;
    }

    public void setIncomePrevious(double incomePrevious) {
        this.incomePrevious = incomePrevious;
    }

    @Override
    public String toString() {
        return "Report{" + "noNewOrderToday=" + noNewOrderToday + ", noProductOutStock=" + noProductOutStock + ", noProductRuningOut=" + noProductRuningOut + ", incomeMonthly=" + incomeMonthly + ", listTopAccountCancelOrder=" + listTopAccountCancelOrder + ", listTopSellProduct=" + listTopSellProduct + '}';
    }
    
    
    
    
}

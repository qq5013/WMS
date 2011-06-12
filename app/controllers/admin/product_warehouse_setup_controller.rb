class Admin::ProductWarehouseSetupController < ApplicationController

  before_filter :authorize

  def product_warehouse_setup
    @product = Product.find(params[:product])
  end
  
  def create_product_warehouse_setup
    @product = Product.find(params[:product_warehouse_setup][:product_id])
    @product_warehouse_setup = ProductWarehouseSetup.new(params[:product_warehouse_setup])
    if @product_warehouse_setup.save
      flash[:notice] = "Product Warehouse Setup saved"
    else
      flash[:notice] = "Error creating Product Warehouse Setup"
    end
    redirect_to :controller => 'admin', :action => 'product_warehouse_setup', :product => @product
  end
  
  def edit_product_warehouse_setup
    @product_warehouse_setup = ProductWarehouseSetup.find(params[:product_warehouse_setup])
  end
  
  def update_product_warehouse_setup
    @product_warehouse_setup = ProductWarehouseSetup.find(params[:product_warehouse_setup][:id])
    if @product_warehouse_setup.update_attributes(params[:product_warehouse_setup])
      redirect_to :controller => 'admin', :action => 'product_warehouse_setup', :product => @product_warehouse_setup.product
    else
      flash[:notice] = "Error updating Product Warehouse Setup"
      redirect_to :controller => 'admin', :action => 'edit_product_warehouse_setup', :product_warehouse_setup => @product_warehouse_setup
    end
  end
  
  def delete_product_warehouse_setup
    @product = Product.find(params[:product_warehouse_setup][:product_id])
    ProductWarehouseSetup.destroy(params[:product_warehouse_setup])
    redirect_to :controller => 'admin', :action => 'product_warehouse_setup', :product => @product
  end

end

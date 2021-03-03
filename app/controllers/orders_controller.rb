class OrdersController < ApplicationController
    before_action :set_order, only: [:show, :edit, :update, :destroy]

    def index
        @orders = Order.all
    end

    def show
    end

    def new
        @order = Order.new
        @customer_options = Customer.all.map{ |u| [ u.first_name ] }
    end

    def edit
    end

    def create
        @order = Order.new(order_params)
        if @order.save
          flash.notice = "The order record was created successfully."
          redirect_to @order
        else
          flash.now.alert = @order.errors.full_messages.to_sentence
          render :edit
        end
    end

    def update
        if @order.update(order_params)
            flash.notice = "The order record was updated successfully"
            redirect_to @order
            else
              flash.now.alert = @order.errors.full_messages.to_sentence
              render :edit
          end
    end

    def destroy
        @order.destroy
        respond_to do |format|
          format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
          format.json { head :no_content }
        end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:customer_id, :product_name, :product_count)
    end
end

class CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def quit
  end

  def out
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
		  flash[:success] = "登録情報を変更しました"
      redirect_to mypage_path
    else
      render :edit
    end
  end
  
  private
   def customer_params
     params.require(:customer).permit(:address, :first_name, :last_name , :last_name_kana, :first_name_kana, :post_code, :phone_number, :email)
   end
end
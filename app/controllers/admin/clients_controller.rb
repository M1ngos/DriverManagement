class Admin::ClientsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @clients = Client.all
  end

  def show
    @client = Client.find(params[:id])
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)
    if @client.save
      redirect_to admin_clients_path, notice: "Client was successfully created."
    else
      render :new
    end
  end

  def edit
    @client = Client.find(params[:id])
  end

  def update
    @client = Client.find(params[:id])
    if @client.update(client_params)
      redirect_to admin_clients_path, notice: "Client was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @client = Client.find(params[:id])
    @client.destroy
    redirect_to admin_clients_path, notice: "Client was successfully deleted."
  end

  private

  def client_params
    params.require(:client).permit(:name, :contact_info, :address)
  end
end

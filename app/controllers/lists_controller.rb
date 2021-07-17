class ListsController < ApplicationController
  before_action :set_list, only: [ :show, :destroy ]

  def index
    @lists = List.all
  end

  def show
    @bookmark = Bookmark.new
  end

  def new
    @list = List.new
  end

  # def edit
  # end

  def create
    @list = List.new(list_params)

    if @list.save
      redirect_to @list, notice: "List was created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # def update
  #   if @list.update(list_params)
  #     redirect_to @list, notice: "List was updated."
  #   else
  #     render :edit, status: :unprocessable_entity
  #   end
  # end

  def destroy
    @list.destroy
    redirect_to lists_url, notice: "List was destroyed."
  end

  private
  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name)
  end
end

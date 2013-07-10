class NewItemsController < ApplicationController
  before_action :set_new_item, only: [:show, :edit, :update, :destroy]

  # GET /new_items
  # GET /new_items.json
  def index
    @new_items = NewItem.all
  end

  # GET /new_items/1
  # GET /new_items/1.json
  def show
  end

  # GET /new_items/new
  def new
    @new_item = NewItem.new
  end

  # GET /new_items/1/edit
  def edit
  end

  # POST /new_items
  # POST /new_items.json
  def create
    @new_item = NewItem.new(new_item_params)

    respond_to do |format|
      if @new_item.save
        format.html { redirect_to @new_item, notice: 'New item was successfully created.' }
        format.json { render action: 'show', status: :created, location: @new_item }
      else
        format.html { render action: 'new' }
        format.json { render json: @new_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /new_items/1
  # PATCH/PUT /new_items/1.json
  def update
    respond_to do |format|
      if @new_item.update(new_item_params)
        format.html { redirect_to @new_item, notice: 'New item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @new_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /new_items/1
  # DELETE /new_items/1.json
  def destroy
    @new_item.destroy
    respond_to do |format|
      format.html { redirect_to new_items_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_new_item
      @new_item = NewItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def new_item_params
      params.require(:new_item).permit(:itemtype, :itemid)
    end
end

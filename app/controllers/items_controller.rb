class ItemsController < ApplicationController
  before_filter :authenticate_user! ,:except => [:show,:index]
  # GET /items
  # GET /items.json
  def index
    if params[:category_id]
      @items = Item.joins(:category).where(:category_id =>  params[:category_id]).select("items.*")
    else
      if params[:id]
        @items = Item.find(params[:id])
      else
        @items = Item.all
      end
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json {render json:   @items.to_json(:only=>[:id,:name,:short_name,:description], :methods => [:avatar_url_thumb,:avatar_url_medium,:avatar_url_original])}
    end
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @item = Item.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json {render json:   @item.to_json(:only=>[:id,:name,:short_name,:description], :methods => [:avatar_url_thumb,:avatar_url_medium,:avatar_url_original])}
    end
  end

  # GET /items/new
  # GET /items/new.json
  def new
    @item = Item.new
    @item.active=true
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @item }
    end
  end

  # GET /items/1/edit
  def edit
    @item = Item.find(params[:id])
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(params[:item])

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render json: @item, status: :created, location: @item }
      else
        format.html { render action: "new" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /items/1
  # PUT /items/1.json
  def update
    @item = Item.find(params[:id])

    respond_to do |format|
      if @item.update_attributes(params[:item])
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.html { redirect_to items_url }
      format.json { head :no_content }
    end
  end
end

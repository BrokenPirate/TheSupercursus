class AsksController < ApplicationController
  before_action :set_ask, only: [:show, :edit, :update, :destroy]
  before_action :find_topics, only: [:index, :show, :new, :edit]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /asks
  # GET /asks.json
  def index
    @asks = Ask.all.order('created_at desc')
  end

  # GET /asks/1
  # GET /asks/1.json
  def show
    @asks = Ask.all.order('created_at desc')
    @ask = Ask.find(params[:id])
  end

  # GET /asks/new
  def new
    @ask = current_user.asks.build
  end

  # GET /asks/1/edit
  def edit
  end

  # POST /asks
  # POST /asks.json
  def create
    @topics  = Topic.all
    @ask = current_user.asks.build(ask_params)
    respond_to do |format|
      if @ask.save
        format.html { redirect_to @ask, notice: 'Ask was successfully created.' }
        format.json { render :show, status: :created, location: @ask }
      else
        format.html { render :new }
        format.json { render json: @ask.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /asks/1
  # PATCH/PUT /asks/1.json
  def update
    respond_to do |format|
      if @ask.update(ask_params)
        format.html { redirect_to @ask, notice: 'Ask was successfully updated.' }
        format.json { render :show, status: :ok, location: @ask }
      else
        format.html { render :edit }
        format.json { render json: @ask.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /asks/1
  # DELETE /asks/1.json
  def destroy
    @ask.destroy
    respond_to do |format|
      format.html { redirect_to asks_url, notice: 'Ask was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ask
      @ask = Ask.find(params[:id])
    end

    def find_topics
      @topics = Topic.all.order('created_at desc')
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ask_params
      params.require(:ask).permit(:title, :content, :topic_id)
    end
end
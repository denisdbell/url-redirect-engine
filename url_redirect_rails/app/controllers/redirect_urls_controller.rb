class RedirectUrlsController < ApplicationController
  before_action :set_redirect_url, only: [:show, :edit, :update, :destroy]

  # GET /redirect_urls
  # GET /redirect_urls.json
  def index
    @redirect_urls = RedirectUrl.all
  end

  # GET /redirect_urls/1
  # GET /redirect_urls/1.json
  def show
  end

  # GET /redirect_urls/new
  def new
    @redirect_url = RedirectUrl.new
  end

  # GET /redirect_urls/1/edit
  def edit
  end

  # POST /redirect_urls
  # POST /redirect_urls.json
  def create
    @redirect_url = RedirectUrl.new(redirect_url_params)

    respond_to do |format|
      if @redirect_url.save
        format.html { redirect_to @redirect_url, notice: 'Redirect url was successfully created.' }
        format.json { render :show, status: :created, location: @redirect_url }
      else
        format.html { render :new }
        format.json { render json: @redirect_url.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /redirect_urls/1
  # PATCH/PUT /redirect_urls/1.json
  def update
    respond_to do |format|
      if @redirect_url.update(redirect_url_params)
        format.html { redirect_to @redirect_url, notice: 'Redirect url was successfully updated.' }
        format.json { render :show, status: :ok, location: @redirect_url }
      else
        format.html { render :edit }
        format.json { render json: @redirect_url.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /redirect_urls/1
  # DELETE /redirect_urls/1.json
  def destroy
    @redirect_url.destroy
    respond_to do |format|
      format.html { redirect_to redirect_urls_url, notice: 'Redirect url was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_redirect_url
      @redirect_url = RedirectUrl.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def redirect_url_params
      params.require(:redirect_url).permit(:old_url, :new_url)
    end
end

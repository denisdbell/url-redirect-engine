class RedirectsController < ApplicationController
  before_action :set_redirect, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token


  # GET /redirects
  # GET /redirects.json
  def index
    @redirects = Redirect.all
  end

  # GET /redirects/1
  # GET /redirects/1.json
  def show
  end

  # GET /redirects/new
  def new
    @redirect = Redirect.new
  end

  # GET /redirects/1/edit
  def edit
  end

  # GET /redirect
 # GET /redirect
  def perform_redirect

    url = params[:url]
    query = params.has_key?(:query)

    redirection_required = false;
    rule = "";   
    new_url = "";

    puts query

    Redirect.all.each do |redirect|

        if redirect.rule.match(url) 
            redirection_required = true
            rule = redirect.rule
            new_url = redirect.new_url 
        end
    
    end

    RedirectLog.create( old_url: url, new_url: new_url, rule: rule,  status: redirection_required)

     if !query and redirection_required
          redirect_to new_url
     else
        respond_to do |format|
            if redirection_required
              msg = { :status => "ok", :rule => rule,:old_url => url,:new_url => new_url} 
            else
              msg = { :status => "ok", :message => "No redirect found for #{url}"}
            end
              format.json  { render :json => msg }
        end
    end
   
  end


  # POST /redirects
  # POST /redirects.json
  def create

    @redirect = Redirect.new(redirect_params)

    respond_to do |format|
      if @redirect.save
        format.html { redirect_to @redirect, notice: 'Redirect was successfully created.' }
        format.json { render :show, status: :created, location: @redirect }
      else
        format.html { render :new }
        format.json { render json: @redirect.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /redirects/1
  # PATCH/PUT /redirects/1.json
  def update
    respond_to do |format|
      if @redirect.update(redirect_params)
        format.html { redirect_to @redirect, notice: 'Redirect was successfully updated.' }
        format.json { render :show, status: :ok, location: @redirect }
      else
        format.html { render :edit }
        format.json { render json: @redirect.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /redirects/1
  # DELETE /redirects/1.json
  def destroy
    @redirect.destroy
    respond_to do |format|
      format.html { redirect_to redirects_url, notice: 'Redirect was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_redirect
      @redirect = Redirect.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def redirect_params
      params.require(:redirect).permit(:rule, :new_url)
    end
end

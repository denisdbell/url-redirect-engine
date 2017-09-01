class RedirectLogsController < ApplicationController
  before_action :set_redirect_log, only: [:show, :edit, :update, :destroy]

  # GET /redirect_logs
  # GET /redirect_logs.json
  def index
    @redirect_logs = RedirectLog.all
  end

  # GET /redirect_logs/1
  # GET /redirect_logs/1.json
  def show
  end

  # GET /redirect_logs/new
  def new
    @redirect_log = RedirectLog.new
  end

  # GET /redirect_logs/1/edit
  def edit
  end

  # POST /redirect_logs
  # POST /redirect_logs.json
  def create
    @redirect_log = RedirectLog.new(redirect_log_params)

    respond_to do |format|
      if @redirect_log.save
        format.html { redirect_to @redirect_log, notice: 'Redirect log was successfully created.' }
        format.json { render :show, status: :created, location: @redirect_log }
      else
        format.html { render :new }
        format.json { render json: @redirect_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /redirect_logs/1
  # PATCH/PUT /redirect_logs/1.json
  def update
    respond_to do |format|
      if @redirect_log.update(redirect_log_params)
        format.html { redirect_to @redirect_log, notice: 'Redirect log was successfully updated.' }
        format.json { render :show, status: :ok, location: @redirect_log }
      else
        format.html { render :edit }
        format.json { render json: @redirect_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /redirect_logs/1
  # DELETE /redirect_logs/1.json
  def destroy
    @redirect_log.destroy
    respond_to do |format|
      format.html { redirect_to redirect_logs_url, notice: 'Redirect log was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_redirect_log
      @redirect_log = RedirectLog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def redirect_log_params
      params.require(:redirect_log).permit(:old_url, :new_url, :rule, :status)
    end
end

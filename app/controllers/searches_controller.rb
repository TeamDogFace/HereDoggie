class SearchesController < ApplicationController
  before_action :set_search, only: [:show, :edit, :update, :destroy]

  # GET /searches
  # GET /searches.json
  def index
    @searches = Search.all
  end

  # GET /searches/1
  # GET /searches/1.json
  def show
  end

  # GET /searches/new
  def new
    @search = Search.new
    @search.facebook_urls.build
  end

  # GET /searches/1/edit
  def edit
  end

  # POST /searches
  # POST /searches.json
  def create
    @search = Search.new(search_params)

    respond_to do |format|
      if @search.save
        # Split up URLs and create entries
        if create_facebook_urls
          format.html { redirect_to @search, notice: 'Your search was successfully queued.' }
          format.json { render action: 'show', status: :created, location: @search }
        end
      else
        format.html { render action: 'new' }
        format.json { render json: @search.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /searches/1
  # PATCH/PUT /searches/1.json
  def update
    respond_to do |format|
      if @search.update(search_params)
        format.html { redirect_to @search, notice: 'Search was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @search.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /searches/1
  # DELETE /searches/1.json
  def destroy
    @search.destroy
    respond_to do |format|
      format.html { redirect_to searches_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_search
      @search = Search.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def search_params
      params.require(:search).permit(:date_lost, :num_results, :email, :facebook_url_string, :photo)
    end

    # Create FacebookUrl entries with search_ids equal to the current @search.id
    def create_facebook_urls
      success = true
      @search.urls.each do |url|
        fb_url = FacebookUrl.new({ search_id: @search.id, url: url })
        success &= fb_url.save
      end
      success
    end
end

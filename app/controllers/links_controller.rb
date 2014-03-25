class LinksController < ApplicationController

  def index
  	@link = Link.all
  end

  def new
  	@link = Link.new
  end

  def create
    @link = Link.new(link_params)

    respond_to do |format|
      if @link.save
        format.html { redirect_to @link, notice: 'Link was successfully created.' }
        format.json { render action: 'show', status: :created, location: @link }
      else
        format.html { render action: 'new' }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end  
  end

  def show	
  	@link = Link.find(params[:id])
  end


private
  def set_link
    @link = Link.find(params[:id])
  end
  def link_params
  	params.require(:link).permit(:title, :url)
  end


end


# Addint a new link on our new view/action isn't 
# updating our database. So after adding a new link 
# we are redirected to our index that shows our database
# of links table?
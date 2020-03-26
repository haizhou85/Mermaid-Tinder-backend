class MermaidsController < ApplicationController

  def index
    mermaids = Mermaid.all
    render json: mermaids
  end
  def show
    mermaid = Mermaid.find(params[:id])
    render json: mermaid
  end

  def create
    mermaid = Mermaid.create(mermaid_params)
    if mermaid.valid?
      render json: mermaid
    else
      render json: mermaid.errors, status: :unprocessable_entity
   end
  end




private
  def mermaid_params
    params.require(:mermaid).permit(:name, :age, :enjoys)
  end

end

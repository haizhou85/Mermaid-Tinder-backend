class MermaidsController < ApplicationController



  def index
    mermaids = Mermaid.all
    render json: mermaids
  end

  def update
    mermaid = Mermaid.find(params[:id])
    mermaid.update_attributes(mermaid_params)
    render json: mermaid
  end

  def destroy
      Mermaid.destroy(params[:id])
  end

  def create
    mermaid = Mermaid.create(mermaid_params)
    if mermaid.valid?
      render json: mermaid
    else
      render json: mermaid.errors, status: :unprocessable_entity
   end

  end

  def show
    mermaid = Mermaid.find(params[:id])
    render json: mermaid
  end

private
  def mermaid_params
    params.require(:mermaid).permit(:name, :age, :enjoys)
  end

end

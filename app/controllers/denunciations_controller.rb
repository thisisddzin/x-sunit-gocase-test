class DenunciationsController < ApplicationController
  def create
      @denunciation = Denunciation.new(denunciation_params)
      if !verify_denunciation(denunciation_params)
        if @denunciation.save
          render json: @denunciation, status: :created
        else
          render json: @denunciation.errors, status: :unprocessable_entity
        end
      else
        render json: {
          message: "You already denounced him."
        }
      end
  end

  private
    def denunciation_params
      params.require(:denunciation).permit(
        :survivor_id, 
        :sender_id
      )
    end

    def verify_denunciation(params)
      Survivor.find(params[:survivor_id]).denunciations.find_by(sender_id: params[:sender_id]).present?
    end
end

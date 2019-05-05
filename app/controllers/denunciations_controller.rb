class DenunciationsController < ApplicationController
  after_action :verify_survivor_to_get_abducted, only: [:create]
  before_action :set_survivor, only: [:create]

  def create
      @denunciation = Denunciation.new(denunciation_params)
      if @survivor.abducted
        render json: {
          message: "Already abducted."
        }
      else
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
  end

  private
    def denunciation_params
      params.require(:denunciation).permit(
        :survivor_id, 
        :sender_id
      )
    end

    def verify_denunciation(params)
      @survivor.denunciations.find_by(sender_id: params[:sender_id]).present?
    end

    def verify_survivor_to_get_abducted
      if @survivor.denunciations.count > 2 
        @survivor.abducted = true
        @survivor.save!
      end
    end

    def set_survivor 
      @survivor = Survivor.find(params[:survivor_id])
    end
end

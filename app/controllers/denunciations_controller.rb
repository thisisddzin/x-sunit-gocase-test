class DenunciationsController < ApplicationController
  after_action :verify_survivor_to_set_abducted, only: [:create]
  before_action :set_sender_survivor, only: [:create]

  # GET /denunciations
  def index 
    render json: Denunciation.all
  end

  # GET /denunciations/:id
  def show 
    if params[:survivor_id]
      return render json: Denunciation.where(survivor_id: params[:survivor_id])
    end

    render json: Denunciation.where(survivor_id: params[:id])
  end

  # POST /denunciations
  def create
      @denunciation = Denunciation.new(denunciation_params)
      if @survivor.abducted
        render json: return_message("Already abducted.")
      else
        if !denunciation_already_exists(denunciation_params)
          if @denunciation.save
            render json: @denunciation, status: :created
          else
            render json: @denunciation.errors, status: :unprocessable_entity
          end
        else
          render json: return_message("You already denounced him.")
        end
      end
  end

  protected
    def return_message message
      {
        data: {
          message: message
        }
      }
    end

  private
    def denunciation_params
      params.require(:denunciation).permit(
        :survivor_id, 
        :sender_id
      )
    end

    # Verify if the sender already abducted or try report yourself. (action_not_allowed)
    def action_not_allowed
      if @sender.abducted 
        render json: return_message("Action not allowed, you are abducted.")
      elsif params[:sender_id] == params[:survivor_id] 
        render json: return_message("Action not allowed, you can't report yourself.")
      end
    end

    def denunciation_already_exists(params)
      @survivor.denunciations.find_by(sender_id: params[:sender_id]).present?
    end

    def verify_survivor_to_set_abducted
      if @survivor.denunciations.count > 2 
        @survivor.abducted = true
        @survivor.save!
      end
    end

    def set_sender_survivor 
      @survivor = Survivor.find(params[:survivor_id])
      @sender = Survivor.find(params[:sender_id])

      action_not_allowed
    end
end

class ArtworkShareController < ApplicationController

    def create
        @share = ArtworkShare.new(artwork_share_params)
        if @share.save
            render json: @share
        else
            render json: @share.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        @share = ArtworkShare.find(params[:id])
            if @share.destroy
                render json: @share
                redirect_to user_url(@share)
            else
                render json: @share.error.full_messages, status: :unprocessable_entity
            end
        end
    end


    private
    def artwork_share_params
        params.require(:artwork_share).permit(:artwork_id, :viewer_id)
    end

end
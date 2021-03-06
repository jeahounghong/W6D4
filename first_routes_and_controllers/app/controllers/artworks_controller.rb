class ArtworksController < ApplicationController
    
    def index
        @user = User.find(params[:user_id])
        render json: @user.artworks
    end

    def show
        @artwork = Artwork.find(params[:id])
        render json: @artwork
    end

    def create
        @artwork = Artwork.new(artwork_params)
        if @artwork.save
            render json: @artwork
        else
            render json: @artwork.errors.full_messages, status: :unprocessable_entity
        end
    end

    def update
        @artwork = Artwork.find(params[:id])

        if @artwork.update(artwork_params)
            render json: @artwork
        else
            render json: @artwork.errors.full_messages, status: :unprocessable_entity
        end

    end

    def destroy
        @artwork = Artwork.find(params[:id])

        if @artwork.destroy
            render json: @artwork
        else
            render json: @artwork.errors.full_messages, status: :unprocessable_entity
        end
    end

    private
    def artwork_params
        params.require(:artwork).permit(:title, :artist_id, :image_url)
    end
end
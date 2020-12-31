class PatternsController < ApplicationController

    before_action :set_pattern
    
    def index
        @patterns = Pattern.all
        render json: @patterns
    end

    def create
        @pattern = Pattern.new(pattern_params)
        if @pattern.save
            render json: @pattern
        else
            render json: {error: 'Error creating pattern'}
        end
    end

    def show
        # pattern = Pattern.find_by(id: params[:id])
        render json: @pattern
    end

    def update
        if @pattern.update(pattern_params)
            render json: @pattern
        else
            render json: @pattern.errors
        end
    end

    def destroy
        # pattern = Pattern.find_by(id: params[:id])
        @pattern.destroy
    end

    private

    def set_pattern
        @pattern = Pattern.find_by(id: params[:pattern_id])
    end

    def pattern_params
        params.require(:pattern).permit(:name, :category, :comment)
    end

end

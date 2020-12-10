class PatternsController < ApplicationController
    
    def index
        patterns = Pattern.all
        render json: patterns
    end

    def create
        pattern = Pattern.new(pattern_params)
        if pattern.save
            render json: pattern
        else
            render json: {error: 'Error creating pattern'}
        end
    end

    def show
        pattern = Pattern.find_by(id: params[:id])
        render json: pattern
    end

    def update
        if pattern.update(pattern_params)
            render json: pattern
        else
            render json: {error: 'Error creating pattern'}
        end
    end

    def destroy
        pattern = Pattern.find_by(id: params[:id])
        pattern.destroy
    end

    private

    def pattern_params
        params.require(:pattern).permit(
        :id, :name, :category, :comment)
    end

end

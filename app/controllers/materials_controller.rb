class MaterialsController < ApplicationController
    before_action :set_pattern

    def index
        materials = @pattern.materials
        # materials = Material.all
        render json: materials
    end

    def create  
        material = @pattern.materials.new(material_params)
        # material = Material.new(material_params)
        if material.save
            render json: material
        else
            render json: {error: 'Error creating material'}
        end
    end

    def show
        material = Material.find_by(id: params[:pattern_id])
        render json: material
    end

    def update
        if material.update(material_params)
            render json: material
        else
            render json: {error: 'Error creating material'}
        end
    end

    def destroy
        material = Material.find_by(id: params[:id])
        material.destroy
    end

    private

    def set_pattern
        @pattern = Pattern.find(params[:pattern_id])
    end

    def material_params
        params.require(:material).permit(
        :id, :name, :description, :pattern_id)
    end
end

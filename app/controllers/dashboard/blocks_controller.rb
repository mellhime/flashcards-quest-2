module Dashboard
  class BlocksController < ApplicationController
    before_action :set_block, only: [:destroy, :edit, :update, :set_as_current]

    def index
      @blocks = current_user.blocks.all.order('title')
    end

    def new
      @block = Block.new
    end

    def edit; end

    def create
      @block = current_user.blocks.build(block_params)
      if @block.save
        redirect_to blocks_path
      else
        render 'new'
      end
    end

    def update
      if @block.update(block_params)
        redirect_to blocks_path
      else
        render 'edit'
      end
    end

    def destroy
      @block.destroy
      redirect_to blocks_path
    end

    def set_as_current
      current_user.set_current_block(@block)
      redirect_to blocks_path
    end

    private

    def set_block
      @block = current_user.blocks.find(params[:id])
    end

    def block_params
      params.require(:block).permit(:title)
    end
  end
end

class PinsController < ApplicationController
    before_action :authenticate_user!
    #specifies where find_pin is allow to start. 
    before_action :find_pin, only: [:show, :edit, :update, :destroy] 
    
    def index
        #displays all Pins in descending order of creation (newest first)
        @pins= Pin.all.order("created_at DESC")
    end
    
    def show
    
    end
    
    def new
        #@pin = Pin.new once user.id is required this code doesn't work anymore
        #this method will record the user id in the Pins table
        @pin = current_user.pins.build
    end
    
    def create
        #once devise is install and a user ID must be put in the pin table this code doesn't work
        #@pin= Pin.new(pin_params)
        @pin = current_user.pins.build(pin_params)
        if @pin.save
            #flash messages for is in layouts/_messages.html.erb
            flash[:success] = "Pin was successfully created"
            redirect_to @pin
        else
        render 'new'
        end
    end
    
    def edit
        #there is nothing here since the before action already finds the pin we want to edit.
    end
    
    def update
        #since we use the find_pin before action we don't need to specify it.
        if @pin.update(pin_params)
            #flash has to be before redirecting, otherwise it will give a string conversion error.
             flash[:success] = "Pin was successfully update"
             redirect_to @pin
        else
            render 'edit'
        end
    end
    
    def destroy
        if 
            @pin.destroy
            flash[:success] = "Pin was successfully deleted"
            redirect_to root_path
        else
            flash[:danger] = "Pin could not be deleted"
            redirect_to edit_pin_path
        end
        
    end
    
    
    private
    
    def pin_params
        #permits the pins components before their creation.
        params.require(:pin).permit(:title, :description, :image)
    end
    
    private
    #since we need the find_pin method for update, show, edit and destror action we create a specific method so as not to repeat ourselves.
    def find_pin
        @pin = Pin.find(params[:id])
    end
        
end

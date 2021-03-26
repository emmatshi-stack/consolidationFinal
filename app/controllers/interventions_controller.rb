class InterventionsController < ApplicationController
    before_action :require_login

    def require_login
        if !current_user
          flash[:error] = "You must be logged in to access this section"
          redirect_to main_app.root_path # halts request cycle
        end
      end

    def interventions
        @interventions = Intervention.new
        puts @interventions
        puts params
        
        
    end
    
    def getbuildings
        puts params
        custid = params["custormerid"]

        buildings = Building.where(:customer_id => custid)
        puts buildings.inspect
        puts "#################################################"
        respond_to do |format|
         format.json { render json: buildings }
        end

    end

    def getbatteries
        puts params
        buildid = params["buildingid"]

        batteries = Battery.where(:building_id => buildid)

        puts batteries.inspect
        puts "#################################################"
        
        respond_to do |format|
            format.json { render json: batteries }
        end
    end
    def getcolumns
        puts params
        colid = params["batteryid"]

        columns = Column.where(:battery_id => colid)

        puts columns.inspect
        
        respond_to do |format|
            format.json { render json: columns }
        end
    end

    def getelevators
        puts params
        elid = params["columnid"]

        elevators = Elevator.where(:column_id => elid)

        puts elevators.inspect
        
        respond_to do |format|
            format.json { render json: elevators }
        end
    end


    def save
        intervention =  Intervention.new
        puts params

        customer = params["intervention"]["customer_id"]
        building = params["intervention"]["building_id"]
        battery = params["intervention"]["battery_id"]
        column = params["intervention"]["column_id"]
        elevator = params["intervention"]["elevator_id"]
        employee = params["intervention"]["employee_id"]
        description = params["intervention"]["reports"]

        p "user information: "
        p current_user

        intervention.author = current_user.id
        intervention.result = "Incomplete"
        intervention.reports = description
        intervention.status = "Pending"
        intervention.customer_id = customer
        intervention.building_id = building
        intervention.employee_id = employee
        if battery != "-1"
            intervention.battery_id = battery

        end

        
        
        
        if column != "-1"
            intervention.column_id = column
            intervention.battery_id = nil
            

            
        end 

        if elevator != "-1"
            intervention.elevator_id = elevator
            intervention.column_id = nil
            intervention.battery_id = nil

        end 

        
        
        
        customer_int = Customer.where(:id => intervention.customer_id)
        employee_int = Employee.where(:id => intervention.employee_id)
        
            


        p "#####################################start#############################################"
        p customer_int
        p "#########################################middle############################################"

        p employee_int
        p "#########################################end############################################"



        puts intervention.inspect
        #intervention.save!
        if intervention.save
            # fact_contacts()
            #sendMail()
            #dropbox()


            # client = ZendeskAPI::Client.new do |config|
            #     config.url = ENV["ZENDESK_URL"]
            #     config.username = ENV["ZENDESK_EMAIL"]
            #     config.token = ENV["ZENDESK_TOKEN"]
            # end
    
            # ZendeskAPI::Ticket.create!(client,
            # :subject => "#{intervention.id} from #{intervention.id}",
            # :comment => {
            #     :value => "An intervention form has been submitted by the employee having the following information: 
            #     The Requester: #{intervention.author} 
            #     The Customer: #{customer_int.company_name} 
            #     Building ID: #{intervention.building_id}
            #     The Battery ID: #{intervention.battery_id}
            #     The Column ID : #{intervention.column_id}
            #     Elevator ID if specified: #{intervention.elevator_id}
            #     The employee to be assigned to the task: #{customer_int.first_name} #{employeE.last_name}
            #     Description of the request for intervention: #{intervention.reports}

            #     Thank you Rocket Elevator is there for your vertical transportation need.
    
                
    
            #     Attached Message: 
    
            #     The Contact uploaded an attachment"
            # },
            # :priority => "normal",
            # :type => "question"
            # )


            redirect_to success_url
       # else    
        #    redirect_to "/intervention", notice: "Invalid fields!"
        end
       
    

        #puts battery.split(" - ")[0]

        #        {"customer_id"=>"1", "building_id"=>"38 - Franklyn Terry", "battery_id"=>"38 - Inactive", "column_id"=>"153 - Active", "elevator_id"=>"Select elevator", "employee_id"=>"17", "description"=>"hshhhstgegre"}, "commit"=>"name of button here", "controller"=>"interventions", "action"=>"save"}

        #redirect_to :action => "interventions", :isSaved => true
        
    end

    
end
class AutoQuote
    
    include Capybara::DSL

    def url
        visit '/' 
    end

    elementos = [ 
        :new_order, :name, :email, :telefone, :btnCommit, 
        :has_vehicle_true, :has_vehicle_false, :brand, :model, :year, :plate,
        :version, :usage, :ownership, :adapted, :bullet_proof,
        :zipCode, :number,
        :cpf, :person_marital, :insurance, :another_driver,
        :selectPlan, :modalError,
        :titleResultSeg
    ]
    
    attr_reader *elementos
  
    def initialize
        @new_order = 'a[href*="/auto/order/new"]' 

        ##DADOS PESSOAIS##
        @name = '#auto_order_flow_lead_person_data_lead_person_attributes_name'
        @email = '#auto_order_flow_lead_person_data_lead_person_attributes_email'
        @telefone = '#auto_order_flow_lead_person_data_lead_person_attributes_phone'
        @btnCommit = "input[name='commit']"

        ##DADOS DO VEICULO##
        @has_vehicle_true = "label[value='true']"
        @has_vehicle_false = "label[value='false']"
        @brand = '#manual_auto_order_flow_pricing_requirements_vehicle_attributes_make'
        @model = '#manual_auto_order_flow_pricing_requirements_vehicle_attributes_model'
        @year = '#manual_auto_order_flow_pricing_requirements_vehicle_attributes_year'
        @version = '#manual_auto_order_flow_pricing_requirements_vehicle_attributes_version'
        @usage = '#auto_order_flow_pricing_requirements_vehicle_attributes_usage'
        @ownership = '#auto_order_flow_pricing_requirements_vehicle_attributes_ownership_status'
        @adapted = '#adapted'
        @bullet_proof = '#auto_order_flow_pricing_requirements_vehicle_attributes_bullet_proof'
        @plate = '#auto_order_flow_pricing_requirements_vehicle_attributes_license_plate_or_vin'

        ##ENDEREÇO##
        @zipCode = '#auto_order_flow_pricing_requirements_insured_person_attributes_address_attributes_zipcode'
        @number = '#auto_order_flow_pricing_requirements_insured_person_attributes_address_attributes_number'

        ##DADOS DO SEGURADO##
        @cpf = '#auto_order_flow_pricing_requirements_insured_person_attributes_cpf'
        @person_marital = '#auto_order_flow_pricing_requirements_insured_person_attributes_marital_status'
        @insurance = '#auto_order_flow_pricing_requirements_driver_attributes_has_insurance'
        @another_driver = '#auto_order_flow_pricing_requirements_driver_block > fieldset:nth-child(3) > fieldset > section > span:nth-child(2) > label'
    
        ##PLANOS##
        @selectPlan = '#preformatted-coverages-auto-plans-6'
        @modalError = '#vehicle-completion-modal-main-title'

        @titleResultSeg = '.h2.section-title'
    end

    def newOrder
        first(@new_order).click
    end

    def about
        @fakerName = Faker::Name.name 
        @fakeremail = Faker::Internet.free_email
        find(@name).set @fakerName
        find(@email).set @fakeremail
        find(@telefone).set '11999999999'
        find(@btnCommit).click
    end

    def selectValue(element, value)
        within element do
            first("option[value='#{value}']").click
        end
    end

    def hasVehicle(plate)
        case plate
        when 'XXX-0000'
            find(@has_vehicle_false).click
            selectValue(@brand, 'HONDA')
            selectValue(@model, 'FIT')
            selectValue(@year, '2015')
            selectValue(@version, 'FIT DX 1.5 FLEXONE 16V 5P AUT. (Gasolina / Flex)')
            selectValue(@ownership, 'owned_by_person')
            selectValue(@bullet_proof, 'false')
        when 'EKP-8193'
            find(@has_vehicle_true).click
            find(@plate).set 'EKP-8193'
            selectValue(@ownership, 'owned_by_person')
            selectValue(@bullet_proof, 'false')            
        end
    end

    def address
        find(@zipCode).set '01010-010'
        find(@number).set 10
    end

    def insuredData
        find(@cpf).set '398.505.228-01'
        selectValue(@person_marital, 'single')
        selectValue(@insurance, 'false')
        find(@another_driver).click
        find(@btnCommit).click
    end

    def selectPlan
        find(@selectPlan).click
    end

    def modalError
        find(@modalError).text
    end

    def title
        find(@titleResultSeg).text
    end
end

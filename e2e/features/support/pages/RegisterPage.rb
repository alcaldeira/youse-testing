class RegisterPage
    
    include Capybara::DSL

    elementos = [ 
        :name, :email, :password, :confirmation_pass, :button_submit, :title_login,
        :title_register, :flashSucessRegister, :alert_error
    ]
    
    attr_reader *elementos
  
    def initialize
        @name = '#user_name'
        @email = '#user_email'
        @password = '#user_password'
        @confirmation_pass = '#user_password_confirmation'
        @button_submit = '#new_user > div > input'
        @title_register = '#container > div.container__content.container__content--for-auth > h2'
        @flashSucessRegister = '#container > div.flash-message__container.js-flash-messages-container'
    end

    def clickCreateAccount
        find(@cadastro).click
    end

    def createAccount(type, name, email, senha)
        @fakerName = Faker::Name.name_with_middle
        @fakeremail = Faker::Internet.free_email
        case type
        when "sucesso"
            find(@name).set(@fakerName) 
            find(@email).set(@fakeremail)
            find(@password).set('1020304050')
            find(@confirmation_pass).set('1020304050')
            find(@button_submit).click           
        else
            find(@name).set(name) 
            find(@email).set(email)
            find(@password).set(senha)
            find(@confirmation_pass).set(senha)  
            find(@button_submit).click
        end
    end

    def assertAlert
        find(@flashSucessRegister).text
    end
end

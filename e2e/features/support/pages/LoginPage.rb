class LoginPage
    
    include Capybara::DSL

    elementos = [ 
        :cadastro, :title_login, :email,:user_email, :user_pass, :buttonSubmit, :alert_error, 
        :myAccount, :logout
    ]
    
    attr_reader *elementos
  
    def initialize
        @cadastro = 'a[href="/users/sign_up"]'
        @title_login = '#container > div.container__content.container__content--for-auth > h2'
        @email = '#email'
        @user_email = '#user_email'
        @user_pass = '#user_password'
        @buttonSubmit = '.button.button-highlight.button--centered'
        @alert_error = '#container > div.flash-message__container.js-flash-messages-container'
        @myAccount = '.account-dropdown__menu.links-list.account-dropdown__menu__right'
        @logout = '#track_logout'
    end

    def nextLogin(email)
        find(@email).set email
        find(@buttonSubmit).click
    end

    def inputPass(password)
        find(@user_pass).set password 
        find(@buttonSubmit).click
    end

    def clickCreateAccount
        find(@cadastro).click
    end

    def assertTitleLogin
        find(@title_login).text
    end

    def alertError
        find(@alert_error).text
    end

    def login(email, password, type)
        @email64 = 'YW5kZXJzb25AeW91c2UuY29t'
        @senha64 = 'eW91c2UxMjM='
        case type
        when 'corretos'
            nextLogin(Base64.decode64(@email64))
            inputPass(Base64.decode64(@senha64))
        when 'incorretos'
            nextLogin(email)
            inputPass(password)
        else
            puts 'Não há dados a serem preenchidos'
        end

        def logout
            find(@myAccount).click
            find(@logout).click
        end
    end

end

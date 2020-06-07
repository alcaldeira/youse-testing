class HomePage
    
    include Capybara::DSL

    def url
        visit '/' 
    end

    elementos = [ 
        :minhaconta, :cadastro, :auto, :residencia, :vida,

        :new_order
    ]
    
    attr_reader *elementos
  
    def initialize
        @minhaConta = 'a[href*=account]'
        @cadastro = 'a[href*=users/sign_up]'
        @auto = '#gatsby-focus-wrapper > div.View__StyledView-sc-1kmgy0v-0.kiAQQf > div.View__StyledView-sc-1kmgy0v-0.kBwnXA > div > div > div.View__StyledView-sc-1kmgy0v-0.dgmcJi > div:nth-child(2) > a'
        @residencia = '#gatsby-focus-wrapper > div.View__StyledView-sc-1kmgy0v-0.kiAQQf > div.View__StyledView-sc-1kmgy0v-0.kBwnXA > div > div > div.View__StyledView-sc-1kmgy0v-0.dgmcJi > div:nth-child(3) > a > span'
        @vida = '#gatsby-focus-wrapper > div.View__StyledView-sc-1kmgy0v-0.kiAQQf > div.View__StyledView-sc-1kmgy0v-0.kBwnXA > div > div > div.View__StyledView-sc-1kmgy0v-0.dgmcJi > div:nth-child(4) > a > span'
    end
  
    def clickMyAccount
        find(@minhaConta).click
    end

    def createAccount
        find(@cadastro).click
    end

    def clickProduct(product)
        case product
        when 'auto'
            find(@auto).click
        when 'residencial'
            find(@residencia).click
        when 'vida'
            find(@vida).click
        else
            puts 'Produto não localizado'
        end
    end

    def newOrder
        # within(first(@new_order)).click
        find(@new_order).click
    end
end

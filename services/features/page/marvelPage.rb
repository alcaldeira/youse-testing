class MarvelChacarters
    include HTTParty
    include RSpec::Matchers
    base_uri 'https://gateway.marvel.com/v1/public'
    format :json
  
    def hexdigest
      ts = Time.now
      hash = Digest::MD5.hexdigest ts.to_s + $keyPrivate + $keyPublic
      return hash, $keyPublic, ts
    end
    
    def getLimitCharacter
      self.class.get("/characters?limit=5&ts=#{hexdigest[2]}&apikey=#{hexdigest[1]}&hash=#{hexdigest[0]}")
    end

    def getCharacterId(id)
      self.class.get("/characters/#{id}?ts=#{hexdigest[2]}&apikey=#{hexdigest[1]}&hash=#{hexdigest[0]}")
    end
  
    def getComics
      self.class.get("/characters/1009146/comics?ts=#{hexdigest[2]}&apikey=#{hexdigest[1]}&hash=#{hexdigest[0]}")
    end
  
    def assertLimistCharacter(body)
      count = body["data"]["results"].count
      for i in 0..count - 1
        body["data"]["results"][i]["name"]
      end
      expect(count).to be(5) 
    end
  
    def expectComics(body)
      contador = body["data"]["results"].count
      for i in 0..contador - 1
        body["data"]["results"][i]["title"]
      end
    end
  end
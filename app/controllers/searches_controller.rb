class SearchesController < ApplicationController
  def search
  end

  def foursquare
    @resp = Faraday.get 'https://api.foursquare.com/v2/venues/search' do |req|
     req.params['client_id'] = E2A5ZTAKP5EN5KPJ24KOX4EUE2DMQRWEYJJUSNXKB0V3ZY5Y
     req.params['client_secret'] = TT3S3DNPTKTIDJRIS32RCMIUULYYB0COAMUNREG2IIB34IGP
     req.params['v'] = '20160201'
     req.params['near'] = params[:zipcode]
     req.params['query'] = 'coffee shop'
   end
   body_hash = JSON.parse(@resp.body)
   @venues = body_hash["response"]["venues"]
   render 'search'
  end
end

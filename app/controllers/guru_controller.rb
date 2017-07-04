class GuruController < ApplicationController
	require 'open-uri'
	def chatbot
		cidade = (params[:result][:parameters]['any'].present?)? params[:result][:parameters]['any'] : 'Sao Paulo'
		key_guru = '&APPID=7aa70c2275a4e89b264fc6e32913be52'
		source = "http://api.openweathermap.org/data/2.5/weather?q=" + cidade + key_guru +"&lang=pt"

		query = JSON.load(open(source))
		descricao = query['weather'][0]['description']
		
		retorno = {
	      "speech": descricao,
	      "displayText": descricao,
	      "data": "",
	      "source": "Programming Assitant"
	    }
 
    	render json: retorno

	end
end

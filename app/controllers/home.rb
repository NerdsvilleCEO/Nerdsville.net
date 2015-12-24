NerdsvilleNet::App.controllers :home do
  get '/' do
    @title = "Nerdsville LLC - Home"
    haml :"home/home"
  end
end

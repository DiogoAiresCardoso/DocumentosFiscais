object Service2: TService2
  OldCreateOrder = False
  OnCreate = ServiceCreate
  OnDestroy = ServiceDestroy
  DisplayName = 'Api Documentos Fiscais'
  OnStop = ServiceStop
  Height = 150
  Width = 215
end

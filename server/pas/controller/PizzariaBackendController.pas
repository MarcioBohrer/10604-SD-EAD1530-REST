unit PizzariaBackendController;

interface

uses
  System.SysUtils,
  System.StrUtils,
  REST.Json,
  System.JSON,
  MVCFramework,
  MVCFramework.Logger,
  MVCFramework.Commons;

type

  [MVCPath('/')]
  TPizzariaController = class(TMVCController) 


  public
    [MVCPath('/')]
    [MVCHTTPMethod([httpGET])]


    [MVCPath('/efetuarpedido')]
    [MVCHTTPMethod([httpPOST])]
    procedure EfetuarPedido();

    [MVCPath('/GETpedido/($numerodocumento)')]
    [MVCHTTPMethod([httpGET])]
    procedure GETpedido();
  end;

implementation

uses
  UPedidoServiceIntf,
  UPedidoServiceImpl,
  UPedidoEfetuarDTOImpl,
  UPedidoRetornoDTOImpl;








procedure TPizzariaController.GETpedido();
var
  LPedidoService: IPedidoService;
  LPedidoRetornoDTO: TPedidoRetornoDTO;
begin
  LPedidoService := TPedidoService.Create();
  LPedidoRetornoDTO := LPedidoService.GETpedido(Context.Request.Params['numerodocumento']);
  Render(LPedidoRetornoDTO);
end;






procedure TPizzariaController.EfetuarPedido();
var
  LPedidoService: IPedidoService;
  LPedidoEfetuarDTO: TPedidoEfetuarDTO;
  LPedidoRetornoDTO: TPedidoRetornoDTO;
begin
  LPedidoService := TPedidoService.Create();
  LPedidoEfetuarDTO := Context.Request.BodyAs<TPedidoEfetuarDTO>;
  try
    LPedidoRetornoDTO := LPedidoService.efetuarPedido(
      LPedidoEfetuarDTO.PizzaTamanho,
      LPedidoEfetuarDTO.PizzaSabor,
      LPedidoEfetuarDTO.NumeroDocumento);
    Render(LPedidoRetornoDTO);
  finally
    LPedidoEfetuarDTO.Free();
  end;
end;

end.

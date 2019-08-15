program PizzariaBackend;

 {$APPTYPE CONSOLE}

uses
  System.SysUtils,
  FireDAC.Stan.Def,
  FireDAC.Phys.SQLite,
  FireDAC.DApt,
  FireDAC.Stan.Async,
  FireDAC.UI.Intf,
  FireDAC.VCLUI.Wait,
  FireDAC.Stan.Intf,
  FireDAC.Comp.UI,
  MVCFramework.Logger,
  MVCFramework.Commons,
  MVCFramework.REPLCommandsHandlerU,
  Web.ReqMulti,
  Web.WebReq,
  Web.WebBroker,
  IdHTTPWebBrokerBridge,
  PizzariaBackendController in '..\pas\controller\PizzariaBackendController.pas',
  WebModulePizzariaBackEnd in '..\pas\wm\WebModulePizzariaBackEnd.pas' {PizzariaWebModule: TWebModule},
  UDBConnectionImpl in '..\pas\db-connection\UDBConnectionImpl.pas',
  UDBConnectionIntf in '..\pas\db-connection\UDBConnectionIntf.pas',
  UClienteRepositoryImpl in '..\pas\repository\UClienteRepositoryImpl.pas',
  UClienteRepositoryIntf in '..\pas\repository\UClienteRepositoryIntf.pas',
  UPedidoRepositoryImpl in '..\pas\repository\UPedidoRepositoryImpl.pas',
  UPedidoRepositoryIntf in '..\pas\repository\UPedidoRepositoryIntf.pas',
  UPedidoRetornoDTOImpl in '..\..\shared\pas\dto\UPedidoRetornoDTOImpl.pas',
  UPizzaSaborEnum in '..\..\shared\pas\enum\UPizzaSaborEnum.pas',
  UPizzaTamanhoEnum in '..\..\shared\pas\enum\UPizzaTamanhoEnum.pas',
  UClienteServiceImpl in '..\pas\service\UClienteServiceImpl.pas',
  UClienteServiceIntf in '..\pas\service\UClienteServiceIntf.pas',
  UPedidoServiceImpl in '..\pas\service\UPedidoServiceImpl.pas',
  UPedidoServiceIntf in '..\pas\service\UPedidoServiceIntf.pas',
  UPedidoEfetuarDTOImpl in '..\..\shared\pas\dto\UPedidoEfetuarDTOImpl.pas';

{$R *.res}

procedure RunServer(APort: Integer);
var
  lServer: TIdHTTPWebBrokerBridge;
  lCustomHandler: TMVCCustomREPLCommandsHandler;
  lCmd: string;
begin
  Writeln('** DMVCFramework Server ** build ' + DMVCFRAMEWORK_VERSION);
  if ParamCount >= 1 then
    lCmd := ParamStr(1)
  else
    lCmd := 'start';

  lCustomHandler := function(const Value: String; const Server: TIdHTTPWebBrokerBridge; out Handled: Boolean): THandleCommandResult
    begin
      Handled := False;
      Result := THandleCommandResult.Unknown;


    end;

  LServer := TIdHTTPWebBrokerBridge.Create(nil);
  try
    LServer.DefaultPort := APort;

    LServer.MaxConnections := 0;

    LServer.ListenQueue := 200;

    WriteLn('Digite "quit" ou "exit" para desligar o servidor');
    repeat
      if lCmd.IsEmpty then
      begin
        Write('-> ');
        ReadLn(lCmd)
      end;
      try
        case HandleCommand(lCmd.ToLower, LServer, lCustomHandler) of
          THandleCommandResult.Continue:
            begin
              Continue;
            end;
          THandleCommandResult.Break:
            begin
              Break;
            end;
          THandleCommandResult.Unknown:
            begin
              REPLEmit('Comando desconhecido: ' + lCmd);
            end;
        end;
      finally
        lCmd := '';
      end;
    until false;

  finally
    LServer.Free;
  end;
end;

begin
  ReportMemoryLeaksOnShutdown := True;
  IsMultiThread := True;
  try
    if WebRequestHandler <> nil then
      WebRequestHandler.WebModuleClass := WebModuleClass;
    WebRequestHandlerProc.MaxConnections := 1024;
    RunServer(8080);
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.

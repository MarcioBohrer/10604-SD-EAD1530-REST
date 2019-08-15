unit UFrmPrincipalImpl;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Rtti, REST.JSON, System.JSON,TypInfo;

type
  TForm1 = class(TForm)
    PanelFazerPedido: TPanel;
    Label4: TLabel;
    Panel3: TPanel;
    Label5: TLabel;
    edtEnderecoBackend: TLabeledEdit;
    edtDocumentoCliente: TLabeledEdit;
    edtPortaBackend: TLabeledEdit;
    cmbTamanhoPizza: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    cmbSaborPizza: TComboBox;
    Button1: TButton;
    mmRetornoWebService: TMemo;
    Label3: TLabel;
    Panel4: TPanel;
    Label7: TLabel;
    Panel5: TPanel;
    Label8: TLabel;
    MemoRetornoConsulta: TMemo;
    EditDocumentoPesquisar: TEdit;
    BTNGetPedido: TButton;
    Panel1: TPanel;
    Label6: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure BTNGetPedidoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  UPizzaTamanhoEnum,
  UPizzaSaborEnum,
  MVCFramework.RESTClient,
  UPedidoEfetuarDTOImpl;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  LPedidoEfetuarDTO: TPedidoEfetuarDTO;
  LRESTClient: TRESTClient;
begin
  LRESTClient := TRESTClient.Create(edtEnderecoBackend.Text, string(edtPortaBackend.Text).ToInteger());
  LRESTClient.ReadTimeOut(50000);
  try
    LPedidoEfetuarDTO := TPedidoEfetuarDTO.Create();
    try
      LPedidoEfetuarDTO.PizzaTamanho := TRttiEnumerationType.GetValue<TPizzaTamanhoEnum>(cmbTamanhoPizza.Text);
      LPedidoEfetuarDTO.PizzaSabor := TRttiEnumerationType.GetValue<TPizzaSaborEnum>(cmbSaborPizza.Text);
      LPedidoEfetuarDTO.NumeroDocumento := edtDocumentoCliente.Text;

      mmRetornoWebService.Text := LRESTClient.doPOST('/efetuarpedido', [],
        TJson.ObjectToJsonString(LPedidoEfetuarDTO)).BodyAsString();
    finally
      LPedidoEfetuarDTO.Free();
    end;
  finally
    LRESTClient.Free();
  end;
end;

procedure TForm1.BTNGetPedidoClick(Sender: TObject);
var
  LRESTClient: TRESTClient;
  RESPOSTA: TJSONValue;
  LRESTResponse: IRESTResponse;
begin
  LRESTClient := TRESTClient.Create(edtEnderecoBackend.Text, string(edtPortaBackend.Text).ToInteger());
  LRESTClient.ReadTimeOut(50000);
  LRESTResponse := LRESTClient.doGET('/GETpedido', [EditDocumentoPesquisar.Text]);

  RESPOSTA := TJSONObject.ParseJSONValue(LRESTResponse.BodyAsString());
  MemoRetornoConsulta.Lines.CLEAR;
  MemoRetornoConsulta.Lines.Add('RESUMO DO PEDIDO');
  MemoRetornoConsulta.Lines.Add('');
  MemoRetornoConsulta.Lines.Add('TAMANHO: ' + COPY(RESPOSTA.GetValue<string>('PizzaTamanho'),3,15));
  MemoRetornoConsulta.Lines.Add('SABOR:' + COPY(RESPOSTA.GetValue<string>('PizzaSabor'),3,15));
  MemoRetornoConsulta.Lines.Add('');
  MemoRetornoConsulta.Lines.Add('VALOR: ' + FormatFloat('R$ ###,##0.00',RESPOSTA.GetValue<Double>('ValorTotalPedido')));
  MemoRetornoConsulta.Lines.Add('');
  MemoRetornoConsulta.Lines.Add('TEMPO DE PREPARO: ' + RESPOSTA.GetValue<Integer>('TempoPreparo').ToString()+' MINUTOS');

end;

end.

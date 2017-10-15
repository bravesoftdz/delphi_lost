unit base64;

//delphi7��EncdDecd��ԪEncodeString��������Ҳ��base64���뺯��

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  EncdDecd,
  IdGlobal,
  Dialogs, StdCtrls;


function StrToBase64(const str: AnsiString): AnsiString;
//function Base64ToStr(const Base64: string): string;
function Base64ToStr(const Base64: AnsiString): AnsiString;


implementation

function StrToBase64(const str: string): string;
var
  s:AnsiString;
begin
  //Result := EncdDecd.EncodeString(str);exit;
  //Result := EncdDecd.EncodeBase64(str);
  s := str;
  Result := EncdDecd.EncodeBase64(PAnsiChar(s), Length(s));
  Result := StringReplace(Result, #13#10, '', [rfReplaceAll]);//ȥ���س�����,��Ϊ��Щϵͳ��֧��
end;

function Base64ToStr(const Base64: AnsiString): AnsiString;
var
  buf:TBytes;
begin
  //Result := EncdDecd.DecodeString(Base64);Exit;//
  buf := EncdDecd.DecodeBase64(Base64);
  //ShowMessage(PAnsiChar(@buf[0]));

  //Result := stringof(buf);Exit;//�����ν�ı�׼�����Ľ��Ҳ����,��Ϊ���ڲ�����ת�����

  //BytesToRaw(buf, head, SizeOf(TProtoHead));
  //Result := BytesToString(buf, TIdTextEncoding.ASCII);Exit;//����,��ʹ������ ASCII ��Ȼ������ת��,û���õ�ԭʼ����
  //Result := BytesToString(buf, TIdTextEncoding.UTF8);

  //Result := (PAnsiChar(@buf[0]));
  SetLength(Result, Length(buf));
  //SetAnsiString(@Result, @buf[0], Length(buf));
  //StrLCopy(PAnsiChar(result), @buf[0], Length(buf));//���л��� #0 ʱ����
  CopyMemory(PAnsiChar(result), @buf[0], Length(buf));

end;


end.

unit IndexAdditions;

interface

uses SysUtils, StrUtils, Controls, IniFiles, Classes;

function GetIndexDecoder(Filename: string): string;
function CaseOfString(s: string; a: array of string): Integer;

implementation

function CaseOfString(s: string; a: array of string): Integer;
begin
  Result := 0;
  while (Result < Length(a)) and (a[Result] <> s) do
    Inc(Result);
  if a[Result] <> s then
    Result := -1;
end;

function GetIndexDecoder(Filename: string): string;
var
	IndexFile: TextFile;
	DecoderLine: string;
	FileExt: string;
begin
	FileExt := AnsiLowerCase(ExtractFileExt(Filename));
	
	AssignFile(IndexFile, Filename);
	Reset(IndexFile);
	
	ReadLn(IndexFile, DecoderLine);

  case CaseOfString(FileExt, ['.d2v', '.dgi', '.dga']) of
    '.d2v' : begin
      if AnsiContainsStr(DecoderLine, 'DVD2AVIProject') then
        Result := 'Mpeg2Dec3'
      else if AnsiContainsStr(DecoderLine, 'DGIndexProjectFile') then
        Result := 'DGDecode'
      end;
    '.dgi' : begin
      if AnsiContainsStr(DecoderLine, 'DGAVCIndexFileDI') then
        Result := 'DGAVCDecodeDi'
      else if AnsiContainsStr(DecoderLine, 'DGIndexFileNV') then
        Result := 'DGDecNV'
      end;
    '.dga' : Result := 'DGAVCDecode';
  end;

	CloseFile(IndexFile);
end;
	
end.

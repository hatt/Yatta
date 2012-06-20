unit IndexAdditions;

interface

uses SysUtils, StrUtils, Controls, IniFiles, Classes;

type
	function GetIndexDecoder(Filename: string): string;

implementation

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
	if (FileExt = '.d2v') then
	begin
		if AnsiContainsStr(FDecoder, 'DVD2AVIProject') then
			Result := 'Mpeg2Dec3';
		else if AnsiContainsStr(DecoderLine, 'DGIndexProjectFile') then
			Result := 'DGDecode';
	end
	else if (FileExt = '.dgi') then
	begin
		if AnsiContainsStr(DecoderLine, 'DGAVCIndexFileDI') then
			Result := 'DGAVCDecodeDi';
		else if AnsiContainsStr(DecoderLine, 'DGIndexFileNV') then
			Result := 'DGDecNV';
	end
	else if (FileExt = '.dga') then
		Result := 'DGAVCDecode';
	end;
end;
	
end.

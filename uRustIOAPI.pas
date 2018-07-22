/// ////////////////////////////////////////////////////////////////////////////
//MIT License
//
//Copyright (c) 2018 Adriaan Boshoff
//
//Permission is hereby granted, free of charge, to any person obtaining a copy
//of this software and associated documentation files (the "Software"), to deal
//in the Software without restriction, including without limitation the rights
//to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//copies of the Software, and to permit persons to whom the Software is
//furnished to do so, subject to the following conditions:
//
//The above copyright notice and this permission notice shall be included in all
//copies or substantial portions of the Software.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//SOFTWARE.
/// ////////////////////////////////////////////////////////////////////////////

unit uRustIOAPI;

interface

uses
  System.SysUtils, System.Types, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, IdZLib, Classes, IdCompressorZLib;

type
  TRustIO = class(TObject)
  private
    fKey: string;
  public
    constructor Create(const aKey: string = '');
    procedure SetAPIKey(const aKey: string);
    function GetServerData(const URL: string): string;
    // API Calls
    function GetAnimals(const IP, Port: string): string;
    function GetBuildingFoundations(const IP, Port: string): string;
    function GetConstructionTypes(const IP, Port: string): string;
    function GetRecentDeathLocations(const IP, Port: string; const IsPublic: Boolean = False): string;
    function GetDoors(const IP, Port: string): string;
    function GetItems(const IP, Port: string): string;
    function GetLoot(const IP, Port: string): string;
    function GetMonuments(const IP, Port: string; const IsPublic: Boolean = False): string;
    function GetPerformanceMetricsGetLoot(const IP, Port: string): string;
    function GetPlayers(const IP, Port: string): string;
    function GetRecentPlayers(const IP, Port: string): string;
    function GetResourceDeposits(const IP, Port: string): string;
    function GetResourceMap(const IP, Port: string): string;
    function GetResources(const IP, Port: string): string;
    function GetSigns(const IP, Port: string): string;
    function GetSleepers(const IP, Port: string): string;
    function GetUsers(const IP, Port: string): string;

    function GetServerStatus(const IP, Port: string): string;
  end;

const
  INVALID_KEY = 'HTTP/1.1 403 Forbidden';
  API_DOESNT_EXIST = 'HTTP/1.1 404 Not Found';
  COULDNT_CONNECT = 'Socket Error # 10060' + sLineBreak + 'Connection timed out.';

implementation

constructor TRustIO.Create(const aKey: string);
begin
  fKey := aKey;
end;

function TRustIO.GetAnimals(const IP, Port: string): string;
const
  URL = '/animals.json?apiKey=';
begin
  Result := '';

  Result := GetServerData('http://' + IP + ':' + Port + URL + fKey);
  if Result = INVALID_KEY then
    Result := 'Invalid API key!'
  else if Result = API_DOESNT_EXIST then
    Result := 'API call broken!'
  else if Result = COULDNT_CONNECT then
    Result := 'Couldn''t connect to the server';
end;

function TRustIO.GetBuildingFoundations(const IP, Port: string): string;
const
  URL = '/buildings.json?apiKey=';
begin
  Result := '';

  Result := GetServerData('http://' + IP + ':' + Port + URL + fKey);
  if Result = INVALID_KEY then
    Result := 'Invalid API key!'
  else if Result = API_DOESNT_EXIST then
    Result := 'API call broken!'
  else if Result = COULDNT_CONNECT then
    Result := 'Couldn''t connect to the server';
end;

function TRustIO.GetConstructionTypes(const IP, Port: string): string;
const
  URL = '/constructions.json?apiKey=';
begin
  Result := '';

  Result := GetServerData('http://' + IP + ':' + Port + URL + fKey);
  if Result = INVALID_KEY then
    Result := 'Invalid API key!'
  else if Result = API_DOESNT_EXIST then
    Result := 'API call broken!'
  else if Result = COULDNT_CONNECT then
    Result := 'Couldn''t connect to the server';
end;

function TRustIO.GetDoors(const IP, Port: string): string;
const
  URL = '/doors.json?apiKey=';
begin
  Result := '';

  Result := GetServerData('http://' + IP + ':' + Port + URL + fKey);
  if Result = INVALID_KEY then
    Result := 'Invalid API key!'
  else if Result = API_DOESNT_EXIST then
    Result := 'API call broken!'
  else if Result = COULDNT_CONNECT then
    Result := 'Couldn''t connect to the server';
end;

function TRustIO.GetItems(const IP, Port: string): string;
const
  URL = '/items.json?apiKey=';
begin
  Result := '';

  Result := GetServerData('http://' + IP + ':' + Port + URL + fKey);
  if Result = INVALID_KEY then
    Result := 'Invalid API key!'
  else if Result = API_DOESNT_EXIST then
    Result := 'API call broken!'
  else if Result = COULDNT_CONNECT then
    Result := 'Couldn''t connect to the server';
end;

function TRustIO.GetLoot(const IP, Port: string): string;
const
  URL = '/loot.json?apiKey=';
begin
  Result := '';

  Result := GetServerData('http://' + IP + ':' + Port + URL + fKey);
  if Result = INVALID_KEY then
    Result := 'Invalid API key!'
  else if Result = API_DOESNT_EXIST then
    Result := 'API call broken!'
  else if Result = COULDNT_CONNECT then
    Result := 'Couldn''t connect to the server';
end;

function TRustIO.GetMonuments(const IP, Port: string;
  const IsPublic: Boolean): string;
var
  URL: string;
begin
  Result := '';

  if IsPublic then
    URL := '/monuments.json'
  else
    URL := '/monuments.json?apiKey=';

  Result := GetServerData('http://' + IP + ':' + Port + URL + fKey);
  if Result = INVALID_KEY then
    Result := 'Invalid API key!'
  else if Result = API_DOESNT_EXIST then
    Result := 'API call broken!'
  else if Result = COULDNT_CONNECT then
    Result := 'Couldn''t connect to the server';
end;

function TRustIO.GetPerformanceMetricsGetLoot(const IP, Port: string): string;
const
  URL = '/performance.json?apiKey=';
begin
  Result := '';

  Result := GetServerData('http://' + IP + ':' + Port + URL + fKey);
  if Result = INVALID_KEY then
    Result := 'Invalid API key!'
  else if Result = API_DOESNT_EXIST then
    Result := 'API call broken!'
  else if Result = COULDNT_CONNECT then
    Result := 'Couldn''t connect to the server';
end;

function TRustIO.GetPlayers(const IP, Port: string): string;
const
  URL = '/players.json?apiKey=';
begin
  Result := '';

  Result := GetServerData('http://' + IP + ':' + Port + URL + fKey);
  if Result = INVALID_KEY then
    Result := 'Invalid API key!'
  else if Result = API_DOESNT_EXIST then
    Result := 'API call broken!'
  else if Result = COULDNT_CONNECT then
    Result := 'Couldn''t connect to the server';
end;

function TRustIO.GetRecentDeathLocations(const IP, Port: string; const IsPublic: Boolean): string;
var
  URL: string;
begin
  Result := '';

  if IsPublic then
    URL := '/deaths.json'
  else
    URL := '/deaths.json?apiKey=';

  Result := GetServerData('http://' + IP + ':' + Port + URL + fKey);
  if Result = INVALID_KEY then
    Result := 'Invalid API key!'
  else if Result = API_DOESNT_EXIST then
    Result := 'API call broken!'
  else if Result = COULDNT_CONNECT then
    Result := 'Couldn''t connect to the server';
end;

function TRustIO.GetRecentPlayers(const IP, Port: string): string;
const
  URL = '/recent.json';
begin
  Result := '';

  Result := GetServerData('http://' + IP + ':' + Port + URL);
  if Result = INVALID_KEY then
    Result := 'Invalid API key!'
  else if Result = API_DOESNT_EXIST then
    Result := 'API call broken!'
  else if Result = COULDNT_CONNECT then
    Result := 'Couldn''t connect to the server';
end;

function TRustIO.GetResourceDeposits(const IP, Port: string): string;
const
  URL = '/resourcedeposits.json?apiKey=';
begin
  Result := '';

  Result := GetServerData('http://' + IP + ':' + Port + URL + fKey);
  if Result = INVALID_KEY then
    Result := 'Invalid API key!'
  else if Result = API_DOESNT_EXIST then
    Result := 'API call broken!'
  else if Result = COULDNT_CONNECT then
    Result := 'Couldn''t connect to the server';
end;

function TRustIO.GetResourceMap(const IP, Port: string): string;
const
  URL = '/resourcemap.json?apiKey=';
begin
  Result := '';

  Result := GetServerData('http://' + IP + ':' + Port + URL + fKey);
  if Result = INVALID_KEY then
    Result := 'Invalid API key!'
  else if Result = API_DOESNT_EXIST then
    Result := 'API call broken!'
  else if Result = COULDNT_CONNECT then
    Result := 'Couldn''t connect to the server';
end;

function TRustIO.GetResources(const IP, Port: string): string;
const
  URL = '/resources.json?apiKey=';
begin
  Result := '';

  Result := GetServerData('http://' + IP + ':' + Port + URL + fKey);
  if Result = INVALID_KEY then
    Result := 'Invalid API key!'
  else if Result = API_DOESNT_EXIST then
    Result := 'API call broken!'
  else if Result = COULDNT_CONNECT then
    Result := 'Couldn''t connect to the server';
end;

function TRustIO.GetServerData(const URL: string): string;
var
  Http: TIdHttp;
begin
  Http := TIdHttp.Create(nil);
  try
    Http.HandleRedirects := True;
    Http.Request.UserAgent := 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:12.0) Gecko/20100101 Firefox/12.0';
    Http.Compressor := TIdCompressorZLib.Create(Http);
    Result := Http.Get(URL);
  except
    on E: Exception do
    begin
      Result := E.Message;
    end;
  end;
end;

function TRustIO.GetServerStatus(const IP, Port: string): string;
const
  URL = '/status.json';
begin
  Result := '';

  Result := GetServerData('http://' + IP + ':' + Port + URL);
  if Result = INVALID_KEY then
    Result := 'Invalid API key!'
  else if Result = API_DOESNT_EXIST then
    Result := 'API call broken!'
  else if Result = COULDNT_CONNECT then
    Result := 'Couldn''t connect to the server';
end;

function TRustIO.GetSigns(const IP, Port: string): string;
const
  URL = '/signs.json?apiKey=';
begin
  Result := '';

  Result := GetServerData('http://' + IP + ':' + Port + URL + fKey);
  if Result = INVALID_KEY then
    Result := 'Invalid API key!'
  else if Result = API_DOESNT_EXIST then
    Result := 'API call broken!'
  else if Result = COULDNT_CONNECT then
    Result := 'Couldn''t connect to the server';
end;

function TRustIO.GetSleepers(const IP, Port: string): string;
const
  URL = '/sleepers.json?apiKey=';
begin
  Result := '';

  Result := GetServerData('http://' + IP + ':' + Port + URL + fKey);
  if Result = INVALID_KEY then
    Result := 'Invalid API key!'
  else if Result = API_DOESNT_EXIST then
    Result := 'API call broken!'
  else if Result = COULDNT_CONNECT then
    Result := 'Couldn''t connect to the server';
end;

function TRustIO.GetUsers(const IP, Port: string): string;
const
  URL = '/users.json?apiKey=';
begin
  Result := '';

  Result := GetServerData('http://' + IP + ':' + Port + URL + fKey);
  if Result = INVALID_KEY then
    Result := 'Invalid API key!'
  else if Result = API_DOESNT_EXIST then
    Result := 'API call broken!'
  else if Result = COULDNT_CONNECT then
    Result := 'Couldn''t connect to the server';
end;

procedure TRustIO.SetAPIKey(const aKey: string);
begin
  fKey := aKey;
end;

end.


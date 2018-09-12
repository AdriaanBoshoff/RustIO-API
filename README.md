# RustIO-API
RustIO API for Delphi (Built with Delphi Community Edition)

### Notes:
- Some calls don't need a API key so when creating the object you don't need to add a API key if you don't want to.
- Some calls are broken due to Rust:IO. 
#### Without Key:
```pascal
procedure TForm1.btn1Click(Sender: TObject);
var
  rustio: TRustIO;
begin
  rustio := TRustIO.Create;
  mmo1.Text := rustio.GetServerStatus('129.232.180.125', '28019');
  rustio.Free;
end;
```
#### With Key:
```pascal
procedure TForm1.btn1Click(Sender: TObject);
var
  rustio: TRustIO;
begin
  rustio := TRustIO.Create('API Key goes here');
  mmo1.Text := rustio.GetServerStatus('129.232.180.125', '28019');
  rustio.Free;
end;
```

#### Changing key after object is created:
You can change the API key after the object was created with or without the key. Visit <a href="http://playrust.io/manual/#!api.md">Rust:IO Manual</a> to check what calls need a API key and what doesn't.
```pascal
procedure TForm1.btn1Click(Sender: TObject);
var
  rustio: TRustIO;
begin
  rustio := TRustIO.Create(API_KEY_1);

  rustio.SetAPIKey('New API Key');

  mmo1.Text := rustio.GetServerStatus('129.232.180.125', '28019');
  rustio.Free;
end;
```

## Supported Calls:
Refer to: <a href="http://playrust.io/manual/#!api.md">Rust:IO Manual</a>
```pascal
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
```

## Example:

```pascal
procedure TForm1.btn1Click(Sender: TObject);
var
  rustio: TRustIO;
begin
  rustio := TRustIO.Create; // Some calls don't need a key so you can just leave it blank
  mmo1.Text := rustio.GetServerStatus('129.232.180.125', '28019');
  rustio.Free;
end;
```

### Example Response:
```json
{
"hostname":"SpecterNetworks x10 | x5 Scrap | TP | Homes - 05 Jul",
"players":2,
"maxplayers":50,
"sleepers":33,
"level":"Procedural Map",
"world":{"size":4000,"seed":48276329},
"version":{"io":"2.3.6758.42368"},
"env":{"time":17.41}
}
```

1 -eq "1.0"
"1.0" -eq 1

for (($i =0), ($j= 0); $i -lt 5; $i++)
{
    "`$i:$i"
    "`$i:$j"
}
""
for ($($i =0;,$j= 0); $i -lt 5; $($i++;$j++))
{
    "`$i:$i"
    "`$i:$j"
}
""
$ssoo = "freebsd", "openbsd","solaris", "fedora", "ubuntu", "netsbsd"
foreach ($so in $ssoo)
{
    Write-Host $so
}

""

foreach ($archivo in Get-ChildItem)
{
    if ($archivo.lenght -ge 10KB)
    {
        Write-Host $archivo -> [($archivo.length)]
    }
}

$num = 0

while ($num -ne 3)
{
    $num++
    Write-Host $num
}
""
$num = 0

while ($num -ne 5)
{
    if ($num -eq 1) {$num =$num +3 ; ConTinue }
    $num++
    Write-Host $num
}
""

$valor = 5
$multiplicacion =1

do
{
    $multiplicacion = $multiplicacion * $valor
    $valor--
}
while ($valor -gt 0)

Write-Host $multiplicacion
""

$valor = 5
$multiplicacion =1

do
{
    $multiplicacion = $multiplicacion * $valor
    $valor--
}
until ($valor -eq 0)

Write-Host $multiplicacion
""

$num = 10
for($i = 2; $i -lt 10; $i++)
{
    $num = $num+$i
    if ($i -eq 5) { Break }
    
}
Write-Host $num
Write-Host $i
""

$cadena = "Hola, buenas tardes"
$cadena2 = "Hola buenas noches"

switch -Wildcard ($cadena, $cadena2)
{
    "hola, buenas*"{"[$_]} coincide con [Hola, buenas*]"}
    "hola, bue*"{"[$_]} coincide con [Hola, bue*]"}
    "hola,*"{"[$_]} coincide con [Hola,*]"}
    "hola, buenas tardes*"{"[$_]} coincide con [Hola, buenas tardes*]"}
}
""
$num = 10
for ($i = 2; $i -lt 10; $i++)
{
    if ($i -eq 5) {Continue}
    $num = $num+ $i
}
Write-Host $num
Write-Host $i
""

$cadena = "Hola, buenas tardes"
$cadena2 = "Hola, buenas noches"

switch -Wildcard ($cadena, $cadena2)
{
    "hola, buenas*"{"[$_]} coincide con [Hola, buenas*]"}
    "hola, bue*"{"[$_]} coincide con [Hola, bue*]"; Continue}
    "hola,*"{"[$_]} coincide con [Hola,*]"}
    "hola, buenas tardes*"{"[$_]} coincide con [Hola, buenas tardes*]"}
}
""
